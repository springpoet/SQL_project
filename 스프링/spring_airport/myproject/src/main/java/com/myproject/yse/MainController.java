package com.myproject.yse;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	@Autowired
	airportService airportservice;
	
	@RequestMapping(value="/MainPage", method=RequestMethod.GET)
	
	
	
	public ModelAndView create() {
		
		ModelAndView mav = new ModelAndView();
		List<String> nation = this.airportservice.nation();
			mav.addObject("data", nation);	
			mav.setViewName("airport/MainPage");
		System.out.println(nation);
		

		return mav;
	}

}
