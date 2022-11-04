package com.myproject.yse;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.myproject.dto.BookDto;
import com.myproject.dto.MemberDto;
import com.myproject.dto.TicketDto;
import com.mysql.cj.xdevapi.Session;

@Controller

public class MainController {

	@Autowired
	airportService airportservice;

	@RequestMapping(value = "/MainPage", method = RequestMethod.GET)

	public ModelAndView create() {

		ModelAndView mav = new ModelAndView();
		List<String> nation = this.airportservice.nation();
		mav.addObject("data", nation);
		mav.setViewName("airport/MainPage");

		return mav;
	}

	@RequestMapping(value = "/MainPage", method = RequestMethod.POST)
	public ModelAndView book(@RequestParam String depart, @RequestParam String arrive, @RequestParam String publeYear) {

		ModelAndView mav = new ModelAndView();
		System.out.println(publeYear);

		mav.setViewName("redirect:/book?depart=" + depart + "&arrive=" + arrive + "&publeYear=" + publeYear);

		return mav;
	}

	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public ModelAndView checkId(@RequestParam String depart, @RequestParam String arrive,
			@RequestParam String publeYear) { // 여러개의 값들을 받을 수 있다.
		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>> checkN = this.airportservice.detail(depart, arrive, publeYear);

		mav.addObject("data", checkN);
		mav.addObject("publeYear", publeYear);
		mav.setViewName("airport/book");
		return mav;

	}

	@RequestMapping(value = "/SignUp", method = RequestMethod.GET)

	public ModelAndView signup() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("airport/SignUp");

		return mav;
	}

	@RequestMapping(value = "/SignUp", method = RequestMethod.POST)

	public ModelAndView signuppost(@RequestParam String id, @RequestParam String pw, @RequestParam String name,
			@RequestParam String gender, @RequestParam int age) {

		MemberDto member = new MemberDto();
		member.setAge(age);
		member.setGender(gender);
		member.setId(id);
		member.setName(name);

		PasswordEncoder p = new BCryptPasswordEncoder();
		String BPw = p.encode(pw);
		member.setPw(BPw);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("airport/MainPage");

		int information = this.airportservice.sign_up(member);

		mav.setViewName("airport/MainPage");

		return mav;
	}
	/*
	 * @RequestMapping(value="/SignUp", method=RequestMethod.POST)
	 * 
	 * public ModelAndView signupDB(@RequestParam Map<String, Object> map) {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * String pw = map.get("password").toString(); //1번째 dto를 쓰는이유 //2번째 map이지금 저렇게
	 * 나오는데 password만 빼올수있는 방법 //System.out.println(map.get("password"));
	 * PasswordEncoder p = new BCryptPasswordEncoder(); String Bpw = p.encode(pw);
	 * 
	 * System.out.println(Bpw); map.put("password", Bpw); int member =
	 * this.airportservice.signup(map);
	 * 
	 * mav.setViewName("airport/SignUp");
	 * 
	 * 
	 * 
	 * return mav; }
	 */

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public ModelAndView login() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("airport/LoginPage");

		return mav;
	}

	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public ModelAndView loginpost(@RequestParam String id, @RequestParam String pw, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();

		String loginCheck = this.airportservice.login(id, pw);

		PasswordEncoder p = new BCryptPasswordEncoder();

		if (p.matches(pw, loginCheck)) {

			MemberDto dtos = this.airportservice.loginInfor(id);
			// @ModeAttribute("test")
			HttpSession session = request.getSession();
			String name = dtos.getName();
			session.setAttribute("sessionName", name);
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionGender", dtos.getGender());
			session.setAttribute("sessionAge", dtos.getAge());
			
			// 이름 아이디
			
			mav.setViewName("redirect:/MainPage");
			
		} else {

			System.out.println("실패");

			mav.setViewName("airport/LoginPage");
		}
		return mav;

	}

	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/MainPage?logout");

		return mav;
	}

	@RequestMapping(value = "/Mypage", method = RequestMethod.GET)
	public ModelAndView Mypage(HttpServletRequest request, HttpServletResponse response) {
	
		
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.getAttribute("sessionId");
		
		BookDto bdto=this.airportservice.myticket((String)session.getAttribute("sessionId"));
		BookDto bdto2 = new BookDto();
		bdto2.setId(bdto.getId());
		bdto2.setName(bdto.getName());
		bdto2.setTicketnum(bdto.getTicketnum());
		bdto2.set도착공항(bdto.get도착공항());
		bdto2.set도착시간(bdto.get도착시간());
		bdto2.set운항편명(bdto.get운항편명());
		bdto2.set출발날짜(bdto.get출발날짜());
		bdto2.set출발공항(bdto.get출발공항());
		bdto2.set출발시간(bdto.get출발시간());
		bdto2.set항공사(bdto.get항공사());
		
		System.out.println(bdto.getId());
		System.out.println(bdto);
		System.out.println(bdto2.getId());
		System.out.println(bdto.get출발공항());
		System.out.println("!!!!"+bdto2.get항공사());
		
	
		mav.addObject("data", bdto2);
		
		mav.setViewName("airport/MyPage");

		return mav;
	}

	@RequestMapping(value = "/bookCheck", method = RequestMethod.GET)
	public ModelAndView bookCheck(@RequestParam String ticketnum, @RequestParam String id,
			@RequestParam String publeYear) {

		ModelAndView mav = new ModelAndView();

		System.out.println("publeYear!!!" + publeYear);
		System.out.println(id);
		MemberDto dtos = this.airportservice.loginInfor(id);
		TicketDto tdto = this.airportservice.ticketInfor(ticketnum);

		System.out.println(dtos.getName());
		System.out.println(tdto.get운항편명());
		BookDto bdto = new BookDto();
		bdto.setId(dtos.getId());
		bdto.setName(dtos.getName());
		bdto.setTicketnum(tdto.getTicketnum());
		bdto.set도착공항(tdto.get도착공항());
		bdto.set도착시간(tdto.get도착시간());
		bdto.set운항편명(tdto.get운항편명());
		bdto.set출발공항(tdto.get출발공항());
		bdto.set출발시간(tdto.get출발시간());
		bdto.set항공사(tdto.get항공사());
		bdto.set출발날짜(publeYear);

		int bookinsert = this.airportservice.book_insert(bdto);

		mav.setViewName("redirect:/MainPage?bookcomplete");

		return mav;
	}

}
