<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3679426da0622856631417624335749&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/kakaoMap.css">
<script>
/* 로딩바 */
function showLoadingBar() {
	var maskHeight = $(document).height();
	var maskWidth = window.document.body.clientWidth;
	var mask = '<div id="mask" style="position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;"></div>'; 
	var loadingImg = ''; 
	loadingImg += '<div id="loadingImg" style="position:absolute; left:50%; top:40%; display:none; z-index:10000;">';
	loadingImg += "<img src='/resources/img/loading.gif'/>";
	loadingImg += "</div>"; 
	
  	$('#Body').append(mask).append(loadingImg);
	$('#mask').css({ 'width' : maskWidth , 'height': maskHeight , 'opacity' : '0.3' });
	$('#mask').show();
	$('#loadingImg').show();
}

function hideLoadingBar() {
	$('#mask, #loadingImg').hide();
	$('#mask, #loadingImg').remove();
}
</script>
<script>
var placeInfo = new Object();
function loadMap(x, y) {
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		    markers = [], // 마커를 담을 배열입니다
		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		 
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };  
		var container = document.getElementById("map");
		var options = {
				center : new kakao.maps.LatLng(y, x),
				level : 3
		}
		
		var map = new kakao.maps.Map(container, options);
		
		var imgSrc = '/resources/img/location.png', // 마커이미지의 주소입니다    
	    imgSize = new kakao.maps.Size(53, 58), // 마커이미지의 크기입니다
	    imgOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다 
		
		var markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption),
			markerPosition = new kakao.maps.LatLng(y,x); 
		
		// 마커를 생성합니다
		var imgMarker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImg // 마커이미지 설정 
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		imgMarker.setMap(map);  
	    
		// 장소 검색 객체 생성
		var ps = new kakao.maps.services.Places(map); 
		// 카테고리로 은행을 검색합니다
		
		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);
		
		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';
		
		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
		
		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);  
		
		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();
		
		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
		    if (target.addEventListener) {
		        target.addEventListener(type, callback);
		    } else {
		        target.attachEvent('on' + type, callback);
		    }
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
		    if (!currCategory) {
		        return;
		    }
		    
		    // 커스텀 오버레이를 숨깁니다 
		    placeOverlay.setMap(null);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		        displayPlaces(data);
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

		    } else if (status === kakao.maps.services.Status.ERROR) {
		        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
		        
		    }
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {

		    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		    var order = document.getElementById(currCategory).getAttribute('data-order');

		    

		    for ( var i=0; i<places.length; i++ ) {

		            // 마커를 생성하고 지도에 표시합니다
		            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

		            // 마커와 검색결과 항목을 클릭 했을 때
		            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		            (function(marker, place) {
		                kakao.maps.event.addListener(marker, 'click', function() {
		                	//리스너!!!여기서 html 띄워주자긔.. 
		                    displayPlaceInfo(place);
		                });
		            })(marker, places[i]);
		    }
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
		    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo (place) {
		    var content = '<div class="placeinfo">' +
		                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a><div class="after"></div>';   

			placeInfo.pname = place.place_name;
			placeInfo.purl = place.place_url,
			placeInfo.praddr = place.road_address_name;
			placeInfo.paddr = place.address_name;
			placeInfo.pphone = place.phone;
			placeInfo.xpos = place.x;
			placeInfo.ypos = place.y;

/*  		    if (place.road_address_name) {
		        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		    }  else {
		        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		    }                
		    content += '    <span class="tel">' + place.phone + '</span>' + 
		                '</div>' + 
		                '<div class="after"></div>'; */
		    contentNode.innerHTML = content;
		    var output = '<h2>'+place.place_name +'</h2>';
		    if(place.road_address_name){
		    	output += '<h4 title="' + place.road_address_name + '">' + place.road_address_name + '</h4>' +
                '  <h4 class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</h4>';
		    } else {
		        output += '<h4 title="' + place.address_name + '">' + place.address_name + '</h4>';		    	
		    }
		    output += '<h4 class="tel">' + place.phone + '</h4>';
		    output += '<h4><a href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">더보기</a></h4>';
		    output += '<input type="button" value="야만나" onclick="confirmPlace(finalUser, placeInfo)">';
		    
		    var textarea = $("#placeInfo");
		    textarea.html(output);
		    
		    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		    placeOverlay.setMap(map);  
		}


		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
		    var category = document.getElementById('category'),
		        children = category.children;

		    for (var i=0; i<children.length; i++) {
		        children[i].onclick = onClickCategory;
		    }
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
		    var id = this.id,
		        className = this.className;

		    placeOverlay.setMap(null);

		    if (className === 'on') {
		        currCategory = '';
		        changeCategoryClass();
		        removeMarker();
		    } else {
		        currCategory = id;
		        changeCategoryClass(this);
		        searchPlaces();
		    }
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
		    var category = document.getElementById('category'),
		        children = category.children,
		        i;

		    for ( i=0; i<children.length; i++ ) {
		        children[i].className = '';
		    }

		    if (el) {
		        el.className = 'on';
		    } 
	}
}
</script>
<script>
var finalUser =[];
var finalStation = [];
	$(document).ready(function() {
		showLoadingBar();
		var middleX = ${requestScope.middlePoint.xpos }
		var middleY = ${requestScope.middlePoint.ypos }
		var xhr = new XMLHttpRequest();
		var url = "https://api.odsay.com/v1/api/pointSearch?apiKey=ohO488CvUmCEUaxjQ9eaKqHZ3TXyT7LJZbQt/2qM2Lw&lang=0&x="+middleX+"&y="+middleY+"&radius=1500&stationClass=2";
		xhr.open("GET",url, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultObj = JSON.parse(xhr.responseText);
				var resultArr = resultObj["result"]["station"];
				var resultArrCnt = resultObj["result"]["count"];
				if(resultArrCnt==0) {
					alert("중간 지점을 찾을 수 없습니다.. 가위바위보로 정하세요!");
					window.location.replace("${pageContext.request.contextPath }/home");
					
				} else {
					var userList =[];
					<c:set var="members" value="${requestScope.userList }"></c:set>;
					<c:forEach items="${members}" var="member">
						var data = new Object();
						data.id = "${member.id}";
						data.uno = "${member.uno}"
						data.nickname = "${member.nickname}";
						data.xpos = "${member.xpos}";
						data.ypos = "${member.ypos}";
						userList.push(data);
					</c:forEach>
					var jsonUserList = JSON.stringify(userList);
					loadData(resultArr, userList);
				}
			}
		}
	});
	
	
	function loadData(station, user) {
		//평균소요시간 2차원 배열 선언
		const userInfo = new Array();
		//예상 루트 2차원 배열 선언
		var subPathList = new Array();
		for(var i=0; i<user.length; i++) {
			var userTime = new Array();
			var userPath = new Array();
			for(var j=0; j<station.length; j++) {
				var xhr = new XMLHttpRequest();
				var url = "https://api.odsay.com/v1/api/searchPubTransPathR?apiKey=ohO488CvUmCEUaxjQ9eaKqHZ3TXyT7LJZbQt/2qM2Lw&lang=0"+
						"&SX="+ user[i].xpos+"&SY="+user[i].ypos
						+"&EX="+station[j].x+"&EY="+station[j].y+"&OPT=3";

				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var resultObj = JSON.parse(xhr.responseText);
						var resultArr = resultObj["result"]["path"][0];
						userPath[j] = resultArr["subPath"];
						userPath[j].push({trafficType : 0, path : "end"});
						var totalTime = resultArr["info"].totalTime;
  						if (totalTime !="") {

	 						userTime[j] = totalTime;
							userPath[j].push({trafficType : 4, totalTime : totalTime});
							userPath[j].unshift({trafficType : 5, userId : user[i].id});
 						}
					}
				}
				userInfo[i] = userTime;
				subPathList[i] = userPath;

				xhr.open("GET",url, false);
				xhr.send();
			}
		}
		
		var resultList = calc(userInfo);
		var index = resultList[0];

		var min = resultList[1];
		var subPath = new Array();
		for (var i=0; i<userInfo.length; i++){
			subPath[i] = subPathList[i][index];
		}
		sendPath(subPath);
		finalUser = user;
		finalStation = station[index];
		loadMap(station[index].x, station[index].y);
		var output = "<h3>평균 소요 시간 : "+min+"분</h3>";
		$("#resultDiv").html(output);
		hideLoadingBar();
	}
	
/* userList[i][j]
i는 사용자, j는 지하철 역
사용자들의 위치로부터 걸리는 평균 시간을 계산하여 최솟값을 가지는 요소의 index 번호를 반환한다.*/
function calc(dataList) {
  	var avgList=new Array();
  	//평균 계산, [0][0] --> [1][0] --> [2][0]
	for(var j=0; j<dataList[0].length; j++) {
		var time =0;
		for(var i=0; i<dataList.length; i++){
			time += dataList[i][j];
		}
		time = time / dataList.length;
		if (!isNaN(time)) {
			avgList.push(time);			
		} else {
			avgList.push(10000);
		};
	}
  	//배열 최소값 구하기
	var min = avgList.reduce(function(prev, curr) {
		return prev > curr ? curr : prev;
	});
  	
	return [avgList.indexOf(min), min];
}

function confirmPlace(user, place) {
	//json 객체로 controller에 전달~
	var Info = new Object();
	Info.user = user;
	Info.meetName = "${requestScope.meetName}";
	Info.meetDate = "${requestScope.date}";
	Info.pname = place.pname;
	Info.xpos = place.xpos;
	Info.ypos = place.ypos;
	Info.url = place.purl;
	Info.paddr = place.paddr;
	Info.praddr = place.praddr;
	Info.pphone = place.pphone;
	
	$.ajax({
		type : 'POST',
		url : "${pageContext.request.contextPath}/finalPlace",
		contentType: 'application/json; charset=utf-8',
		data : JSON.stringify(Info),
		async : false,
		success : function(data) {
			alert("모임이 생성되었습니다!");
			window.location.replace("${pageContext.request.contextPath }/home");
		},
		error : function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

		}
	});
}

function sendPath(subPath) {
	$.ajax({
		type : 'POST',
		traditional : true,
		url : "${pageContext.request.contextPath}/send",
		data : JSON.stringify(subPath),
		contentType : "application/json; charset=utf-8",
		success : function(result) {
			var output="";
			for(var i=0; i<result.length; i++) {
				for(var j=0; j<result[i].length; j++) {
					if(result[i][j].id) {
						var id = result[i][j].id;
						output += '<h2>'+result[i][j].id+'님의 경로</h2>';						
					} else if(result[i][j].subway) {
						output += '<h3>['+result[i][j].subway+'] ';
						output += result[i][j].start+' ~ '+result[i][j].end+'</h3>';						
					} else if (result[i][j].bus) {
						output += '<h3>['+String(result[i][j].bus)+'번 버스] ';
						output += result[i][j].start+' ~ '+result[i][j].end+'</h3>';					
					} else if (result[i][j].totalTime) {
						output += '<h3> 총 '+result[i][j].totalTime+' 분 소요 </h3>';						
					} else if (result[i][j].walk) {
						output += '<h4>(도보 : '+result[i][j].walk+'분) </h4>';						
					}
				}
			output += '<h3>=======================================</h3>';
			}
			$("#route").html(output);
		},
		error : function(request, status, error) {
	        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
}

</script>
</head>
<body id="Body">
	<a href="${pagecontext.request.contextPath }/home" method="POST">홈으로</a>
	<h1>모임 장소</h1>
	<br>
	<c:set var="members" value="${requestScope.userList }"></c:set>
	<h1>미팅 생성 멤버 수 : ${fn:length(members) }</h1>
	<hr>
	<h2>참여 멤버</h2>
	<c:forEach items="${members }" var="user">
		<h3>${user.id }</h3>
	</c:forEach>
	<div id="resultDiv">
		<!-- 평균 소요시간 -->
	</div>
	<br>
	<table>
		<tr style="width: 100%; height:500px;">
			<td style="width: 60%">
				<span class="map_wrap">
					<div id="map" style="width: 600px; height: 450px;">
						<!-- 결과 지도 창 -->
					</div>
					<ul id="category">
						<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
							카페</li>
						<li id="FD6" data-order="4"><span class="category_bg cafe"></span>
							음식점</li>
						<li id="CT1" data-order="0"><span class="category_bg bank"></span>
							문화시설</li>
						<li id="AT4" data-order="4"><span class="category_bg cafe"></span>
							관광명소</li>
					</ul>
				</span>
			</td>
			<td>
				<div id="placeInfo"></div>
			</td>
		</tr>
	</table>
	
	<div id="route">
		<!-- 경로 결과 창 -->
	</div>
	<br>

</body>
</html>