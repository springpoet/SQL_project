package com.myproject.yse;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	AirportService airportService;
	
	@RequestMapping(value="/MainPage", method = RequestMethod.GET)
	
	public ModelAndView create() {
		
		ModelAndView mav = new ModelAndView();
		
		List<String> country = this.airportService.country();
		
		mav.addObject("data", country);
		
	
		
		mav.setViewName("/airport/MainPage");
		
		return mav;
		
	}
	
}


