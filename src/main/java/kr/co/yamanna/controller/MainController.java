package kr.co.yamanna.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.yamanna.service.MeetingService;
import kr.co.yamanna.vo.MeetingVO;



@Controller
public class MainController {
	@Autowired
	private MeetingService meetingService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		System.out.println("Main Start");

		return "login";
	}
	
	@RequestMapping(value="/home", method= RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("userId")!=null) {
			int uno = (int) session.getAttribute("userNo");
			List<List<Object>> meetingList = meetingService.selectMeetingList(uno);
			System.out.println(meetingList);
			
			mav.setViewName("main");
			mav.addObject("msg","success");
			mav.addObject("list",meetingList);
		} else {
			mav.setViewName("login");
		}

		return mav;
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about() {
	
		return "about";
	}
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage() {
		
		return "myPage";
	}
}
