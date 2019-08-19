package kr.co.yamanna.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.yamanna.service.MeetingService;
import kr.co.yamanna.service.MemberService;
import kr.co.yamanna.vo.MeetingVO;
import kr.co.yamanna.vo.MemberVO;

@Controller
public class MemberController {	
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MeetingService meetingService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		System.out.println("login 호출");
		return "login";
	}
	
	@RequestMapping(value = "/logincheck", method = RequestMethod.POST)
	public ModelAndView successLogin(@ModelAttribute MemberVO vo, HttpSession session) {
		System.out.println("login 여부  호출" + session);
		boolean result = service.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			int uno = (int) session.getAttribute("userNo");
			
			List<MeetingVO> meetingList = meetingService.selectMeetingList(uno);
			
			mav.setViewName("main");
			mav.addObject("msg","success");
			mav.addObject("meetingList",meetingList);
		} else {
			System.out.println("fail");
			mav.setViewName("login");
			mav.addObject("msg","fail");
		}
		return mav;
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String forwardSignupPage() {
		System.out.println("signup");
		return "signup";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(MemberVO vo) {
		System.out.println(vo);
		service.signUp(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		service.logout(session);
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("msg","logout");
		return mav;
	}
	
	
}
