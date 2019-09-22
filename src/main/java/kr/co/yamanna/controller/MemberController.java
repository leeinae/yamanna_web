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
	
	
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public ModelAndView successLogin(@ModelAttribute MemberVO vo, HttpSession session) {
		System.out.println("login 여부  호출" + session);
		boolean result = service.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			int uno = (int) session.getAttribute("userNo");
			
			List<List<Object>> meetingList = meetingService.selectMeetingList(uno);
			System.out.println(meetingList);
			
			mav.setViewName("main");
			mav.addObject("msg","success");
			mav.addObject("list",meetingList);
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
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		count = service.vaildUserInfo(id);
		System.out.println("check 호출" + count);
		map.put("cnt",count);
		return map;
	}
	
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		service.logout(session);
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("msg","logout");
		return mav;
	}
	
	@RequestMapping(value="/friends", method = RequestMethod.GET)
	public ModelAndView friends(HttpSession session) {
		List<MemberVO> list = service.viewMemberList(session);
		ModelAndView mav = new ModelAndView("friendList");
		mav.addObject("list",list);
		return mav;
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
	@ResponseBody
	public boolean addFriend(@RequestBody Map<String,String> mvo, HttpSession session) {
		System.out.println("친구 추가 컨트롤러 추가");
		//내 id
		String myId = (String) session.getAttribute("userId");
		//검색한 id
		String id = mvo.get("id");

		//id로 no 검색하기
		int uno = service.selectUno(myId);
		int fno = service.selectUno(id);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("uno", uno);
		map.put("fno", fno);
		
		//친구여부 판단
		int flag = service.selectRelation(map);

		if(flag==0) {
			//친구가 아닐 때 친구 추가한다
			service.insertFriendRelation(map);
			return true;
		} else {
			//친구일 때
			return false;
		}
	}
	
}
