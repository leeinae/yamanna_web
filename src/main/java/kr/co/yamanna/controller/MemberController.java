package kr.co.yamanna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@RequestMapping(value="/friends", method = RequestMethod.GET)
	public String friends() {
		System.out.println("호출");
		return "addFriend";
	}
	
	@RequestMapping(value="/searchFriend", method = RequestMethod.POST)
	@ResponseBody
	public MemberVO searchFriend(@RequestBody MemberVO mvo, HttpSession session) {
		//내 id
		String myId = (String) session.getAttribute("userId");
		//검색한 id
		String id = mvo.getId();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("myId", myId);
		map.put("id", id);
		
		MemberVO vo = service.searchFriendById(map);
		
		System.out.println(vo);
		if(vo == null) {
			vo = new MemberVO();
			vo.setId("");
		}
		return vo;
	}
	
	@RequestMapping(value="/addFriend", method = RequestMethod.POST)
	public void addFriend(@RequestBody MemberVO mvo) {
		System.out.println("친구 추가 컨트롤러 추가");
		System.out.println(mvo.getId());
	}
	
}
