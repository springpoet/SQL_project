package com.myproject.yse;

import java.util.List;
import java.util.Map;

import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		System.out.println(nation);

		return mav;
	}

	@RequestMapping(value = "/MainPage", method = RequestMethod.POST)
	public ModelAndView selectpost(@RequestParam String depart, @RequestParam String arrive) {

		ModelAndView mav = new ModelAndView();
		System.out.println(depart);
		System.out.println(arrive);
		mav.setViewName("redirect:/DetailPage?depart=" + depart + "&arrive=" + arrive);
		return mav;
	}

	@RequestMapping(value = "/DetailPage", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam String depart, @RequestParam String arrive) {
		ModelAndView mav = new ModelAndView();
		List<airportDto> flight = this.airportservice.flight(depart);
		System.out.println(flight);
		mav.addObject("data", flight);
		mav.setViewName("/airport/DetailPage");

		return mav;

	}

	@RequestMapping(value = "/DetailPage", method = RequestMethod.POST)
	public ModelAndView detailpost(@RequestParam String arrive, @RequestParam String depart) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/detail?arrive=" + arrive + "&depart=" + depart);

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

		memberDto member = new memberDto();
		member.setAge(age);
		member.setGender(gender);
		member.setId(id);
		member.setName(name);

		System.out.println(id + pw + name);

		PasswordEncoder p = new BCryptPasswordEncoder();
		String BPw = p.encode(pw);
		member.setPw(BPw);


		ModelAndView mav = new ModelAndView();
		mav.setViewName("airport/MainPage");

		int information = this.airportservice.sign_up(member);

		return mav;
	}

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public ModelAndView login() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("airport/LoginPage");

		return mav;
	}

	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public ModelAndView loginpost() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("airport/LoginPage");

		return mav;
	}

}
