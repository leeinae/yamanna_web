package kr.co.yamanna.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.yamanna.service.MemberService;
import kr.co.yamanna.vo.MemberVO;
import kr.co.yamanna.vo.PointVO;

@Controller
public class MeetingController {
	
	@Autowired
	private MemberService service;

	@RequestMapping(value="/meeting", method = RequestMethod.GET)
	public ModelAndView selectMeetingOption(HttpSession session) {
		
		System.out.println("선택 페이지 호출 됨!");
		
		List<MemberVO> list = service.viewMemberList(session);
		ModelAndView mav = new ModelAndView("selectOption");
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping(value="/createMeeting", method= RequestMethod.POST)
	public ModelAndView createMeeting(HttpServletRequest request, Model model, HttpSession session) {
		//체크박스에 체크된 멤버 id 항목 
		String[] arr = request.getParameterValues("friend");
		
		//무게중심
		double middleX = 0;
		double middleY = 0 ;
		
		//현재 로그인 한 user 정보 MemberVO
		MemberVO loginUser = new MemberVO();
		loginUser.setXpos((Double) session.getAttribute("xpos"));
		loginUser.setYpos((Double) session.getAttribute("ypos"));
		
		//user id, name 등을 담는 list 
		List<MemberVO> list = new ArrayList<MemberVO>();
		list.add(loginUser);
		
		for(int i=0; i<arr.length; i++) {
			MemberVO vo = service.selectMemberId(arr[i]);
			list.add(vo);
		}
		
		for(MemberVO vo : list) {
			System.out.println(vo);

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
		
		return mav;
	}
	
	
}
