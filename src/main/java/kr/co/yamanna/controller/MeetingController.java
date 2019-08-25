package kr.co.yamanna.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.yamanna.service.MeetingService;
import kr.co.yamanna.service.MemberService;
import kr.co.yamanna.vo.MeetingVO;
import kr.co.yamanna.vo.MemberVO;
import kr.co.yamanna.vo.PointVO;

@Controller
public class MeetingController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MeetingService meetingService;

	@RequestMapping(value="/meeting", method = RequestMethod.GET)
	public ModelAndView selectMeetingOption(HttpSession session) {
		List<MemberVO> list = memberService.viewMemberList(session);
		ModelAndView mav = new ModelAndView("selectOption");
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/createMeeting", method= RequestMethod.POST)
	public ModelAndView createMeeting(HttpServletRequest request, Model model, HttpSession session) {
		//체크박스에 체크된 멤버 id 항목 
		String[] arr = request.getParameterValues("friend");
		String date = request.getParameter("date");
		
		//무게중심
		double middleX = 0;
		double middleY = 0 ;
		
		//현재 로그인 한 user 정보 MemberVO
		MemberVO loginUser = new MemberVO();
		loginUser.setId((String)session.getAttribute("userId"));
		loginUser.setUno((int)session.getAttribute("userNo"));		
		loginUser.setXpos((Double) session.getAttribute("xpos"));
		loginUser.setYpos((Double) session.getAttribute("ypos"));
		
		//user id, name 등을 담는 list 
		List<MemberVO> list = new ArrayList<MemberVO>();
		list.add(loginUser);
		
		for(int i=0; i<arr.length; i++) {
			MemberVO vo = memberService.selectMemberId(arr[i]);
			list.add(vo);
		}
		
		for(MemberVO vo : list) {
			middleX += vo.getXpos();
			middleY += vo.getYpos();
		}
		
		//무게중심
		middleX = middleX / (arr.length+1);
		middleY = middleY / (arr.length+1);
		PointVO middlePoint = new PointVO(middleX, middleY);
		
		System.out.println(middleX + ", " + middleY);
		
		ModelAndView mav = new ModelAndView("meetingPlace");
		
		mav.addObject("middlePoint", middlePoint);
		mav.addObject("userList",list);
		mav.addObject("date",date);
		
		return mav;
	}
	
	@RequestMapping(value="/finalPlace", method = RequestMethod.POST)
	@ResponseBody
	public void saveData(@RequestBody Map<String,Object> param) {
		System.out.println("finalPlace 호출");
		System.out.println(param);
		
		String mid = UUID.randomUUID().toString();
		System.out.println(mid);
		
		MeetingVO meetingVO = new MeetingVO();
		meetingVO.setMid(mid);
		meetingVO.setXpos((double)param.get("stationXpos"));
		meetingVO.setYpos((double)param.get("stationYpos"));
		meetingVO.setMdate((String)param.get("meetDate"));
		
		meetingService.insertMeeting(meetingVO);
		int meetingNum = meetingService.selectMeetingNum(mid);
		
		//param으로 받아온 user json 배열
		List<Map<String,String>> userList = (List<Map<String,String>>) param.get("user");
		
		
		//배열 안에 들어있던 json을 map으로 받아옴
		for(Map<String,String> map : userList) {
			//Meeting relation 파라미터로 전달할 Map
			Map<String, Object> relationMap = new HashMap<String, Object>();
			relationMap.put("mno", meetingNum);
			relationMap.put("uno", map.get("uno"));
			meetingService.insertMeetingRelation(relationMap);
		}
		System.out.println("DB에 저장 완료ㅠㅠ !");
	}
	
	@RequestMapping(value="/send", method = RequestMethod.POST)
	@ResponseBody
	public void sendData(HttpServletRequest request,
			String[] list) {
		System.out.println("실행됐어..");
		System.out.println(list);
	}
	
}
