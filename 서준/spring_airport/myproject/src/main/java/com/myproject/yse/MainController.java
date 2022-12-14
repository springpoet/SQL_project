package com.myproject.yse;

import java.util.ArrayList;
import java.util.HashMap;
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

		if (publeYear == "") {
			boolean bo = true;
			mav.addObject("duple", bo);
			mav.setViewName("airport/MainPage");
		} else {
			mav.setViewName("redirect:/book?depart=" + depart + "&arrive=" + arrive + "&publeYear=" + publeYear);

		}
		return mav;
	}

	@RequestMapping(value = "/book", method = RequestMethod.GET)
	public ModelAndView checkId(@RequestParam String depart, @RequestParam String arrive,
			@RequestParam String publeYear) {
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
			@RequestParam String gender, @RequestParam String age) {

		if (id == "" || pw == "" || name == "" || age == "") {
			ModelAndView mav = new ModelAndView();
			boolean duple = true;
			mav.addObject("duple2", duple);
			mav.setViewName("airport/SignUp");

			return mav;
		}

		MemberDto member = new MemberDto();
		member.setAge(Integer.parseInt(age));
		member.setGender(gender);
		member.setId(id);
		member.setName(name);

		PasswordEncoder p = new BCryptPasswordEncoder();
		String BPw = p.encode(pw);
		member.setPw(BPw);

		ModelAndView mav = new ModelAndView();

		String checkDuple = this.airportservice.checkDuplicate(id);

		if (checkDuple != null) {

			boolean bo = true;
			mav.addObject("duple", bo);
			mav.setViewName("airport/SignUp");
		} else {
			int information = this.airportservice.sign_up(member);
			mav.setViewName("redirect:/MainPage");
		}

		return mav;
	}

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

			// ?????? ?????????

			mav.setViewName("redirect:/MainPage");

		} else {

			System.out.println("??????");

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
		HttpSession session = request.getSession();
		session.getAttribute("sessionId");

		// ???????????? ????????? ?????????????????? ????????? ?????????????????? ?????????????????????, ?????????????????? ??? ???????????????

		mav.setViewName("airport/MyPage");

		return mav;
	}

	@RequestMapping(value = "/bookCheck", method = RequestMethod.GET)
	public ModelAndView bookCheck(@RequestParam String ticketnum, @RequestParam String id,
			@RequestParam String publeYear) {

		ModelAndView mav = new ModelAndView();

		MemberDto dtos = this.airportservice.loginInfor(id);

		TicketDto tdto = this.airportservice.ticketInfor(ticketnum);

		BookDto bdto = new BookDto();
		bdto.setId(dtos.getId());
		bdto.setName(dtos.getName());
		bdto.setTicketnum(tdto.getTicketnum());
		bdto.set????????????(tdto.get????????????());
		bdto.set????????????(tdto.get????????????());
		bdto.set????????????(tdto.get????????????());
		bdto.set????????????(tdto.get????????????());
		bdto.set????????????(tdto.get????????????());
		bdto.set?????????(tdto.get?????????());
		bdto.set????????????(publeYear);

		// ??????????????? id??? ???????????? ??????????????? ??????????????? ????????????

		List<BookDto> comp = new ArrayList<BookDto>();

		comp = this.airportservice.myticket(id);

		if (comp.size() == 0) {
			int bookinsert = this.airportservice.book_insert(bdto);
			mav.setViewName("redirect:/MainPage?bookcomplete");
		}

		boolean in = false;
		for (int i = 0; i < comp.size(); i++) {

			if (ticketnum.equals(comp.get(i).getTicketnum()) && publeYear.equals(comp.get(i).get????????????())) {

				in = false;
				mav.setViewName("redirect:/MainPage?bookfail");
				break;
			}

			else {
				in = true;
				mav.setViewName("redirect:/MainPage?bookcomplete");

			}
		}
		if (in) {
			int bookinsert = this.airportservice.book_insert(bdto);
		}
		return mav;
	}

	@RequestMapping(value = "/myticketCheck", method = RequestMethod.GET)
	public ModelAndView TicketCheck(@RequestParam String id) {

		ModelAndView mav = new ModelAndView();

		List<BookDto> bdto = null;
		bdto = this.airportservice.myticket(id);

		mav.addObject("data", bdto);
		mav.addObject("check", bdto);
		mav.setViewName("airport/MyPage");

		return mav;
	}

	@RequestMapping(value = "/checkDuplicate", method = RequestMethod.GET)
	public ModelAndView checkDuplication() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("airport/SignUp");
		return mav;

	}

	@RequestMapping(value = "/d3data", method = RequestMethod.GET)
	public ModelAndView d3data() {

		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>> d3chart = this.airportservice.ChartList();

		mav.addObject("data", d3chart);

		System.out.println(d3chart);

		mav.setViewName("airport/d3data");
		return mav;

	}

	@RequestMapping(value = "/adminCheck", method = RequestMethod.GET)
	public ModelAndView adminCheck() {

		ModelAndView mav = new ModelAndView();

		List<BookDto> bdto = new ArrayList<BookDto>();
		bdto = this.airportservice.allticket();

		mav.addObject("adminList", bdto);

		mav.setViewName("airport/MyPage");

		return mav;

	}

	@RequestMapping(value = "/adminDelete", method = RequestMethod.GET)
	public ModelAndView adminDelete(@RequestParam String id, @RequestParam String ticketnum) {

		ModelAndView mav = new ModelAndView();

		int del = this.airportservice.deleteTicket(id, ticketnum);

		mav.setViewName("airport/MyPage");

		return mav;

	}

}
