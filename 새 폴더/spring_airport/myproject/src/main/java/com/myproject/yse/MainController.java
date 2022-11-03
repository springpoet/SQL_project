package com.myproject.yse;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.myproject.dto.MemberDto;
import com.mysql.cj.xdevapi.Session;

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
	
		

		return mav;
	}
	@RequestMapping(value="/MainPage", method=RequestMethod.POST)
	   public ModelAndView book(@RequestParam String depart, @RequestParam String arrive) {
	      
	      ModelAndView mav = new ModelAndView();
	      
	    
	         mav.setViewName("redirect:/book?depart="+depart+"&arrive="+arrive);
	         

	      return mav;
	   }
	   
	   
	   @RequestMapping(value="/book", method = RequestMethod.GET) 
	   public ModelAndView checkId(@RequestParam String depart, @RequestParam String arrive) { //여러개의 값들을 받을 수 있다.
	      ModelAndView mav = new ModelAndView();
	      
	      List<Map<String, Object>> checkN = this.airportservice.detail(depart, arrive);
	     
	      
	       mav.addObject("data", checkN);
	       mav.setViewName("airport/book");
	       return mav;
	
	
	   }
	   
	   @RequestMapping(value="/SignUp", method=RequestMethod.GET)

		public ModelAndView signup() {
			
			ModelAndView mav = new ModelAndView();
			
				mav.setViewName("airport/SignUp");
		
			

			return mav;
		}
	   
	   @RequestMapping(value="/SignUp", method=RequestMethod.POST)

		public ModelAndView signuppost(@RequestParam String id, @RequestParam String pw, @RequestParam String name, @RequestParam String gender, @RequestParam int age) {
			
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
	   @RequestMapping(value="/SignUp", method=RequestMethod.POST)

		public ModelAndView signupDB(@RequestParam Map<String, Object> map) {
		  
			ModelAndView mav = new ModelAndView();
			
			String pw = map.get("password").toString();
			//1번째 dto를 쓰는이유
			//2번째 map이지금 저렇게 나오는데 password만 빼올수있는 방법
			//System.out.println(map.get("password"));
			PasswordEncoder p = new BCryptPasswordEncoder();
			String Bpw = p.encode(pw);
			
			System.out.println(Bpw);
			map.put("password", Bpw);
			 int member = this.airportservice.signup(map);
		      
				mav.setViewName("airport/SignUp");
				
			

			return mav;
		}*/
	   
	   @RequestMapping(value="/Login", method=RequestMethod.GET)
		public ModelAndView login() {
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("airport/LoginPage");

			return mav;
		}
	   
	   @RequestMapping(value="/Login", method=RequestMethod.POST)

		public ModelAndView loginpost(@RequestParam String id, @RequestParam String pw, HttpServletRequest request) {
			
			ModelAndView mav = new ModelAndView();
			
			String loginCheck = this.airportservice.login(id, pw);
			
			 PasswordEncoder p = new BCryptPasswordEncoder();
		

			if(p.matches(pw, loginCheck)) {
				
				MemberDto dtos = this.airportservice.loginInfor(id);
				//@ModeAttribute("test")
				 HttpSession session = request.getSession();
				 String name = dtos.getName();
				 session.setAttribute("sessionName", name);
				 session.setAttribute("sessionId", id);
				 session.setAttribute("sessionGender", dtos.getGender());
				 session.setAttribute("sessionAge", dtos.getAge());
				 
				//이름 아이디
				
				mav.setViewName("redirect:/MainPage");
			} else {
				System.out.println("실패");
			
			mav.setViewName("airport/LoginPage");
			}
			return mav;
		}
	   
	   @RequestMapping(value="/Logout", method=RequestMethod.GET)
		public ModelAndView logout(HttpServletRequest request) {
		   HttpSession session = request.getSession();
		   session.invalidate();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/MainPage?logout");
			
			return mav;
		}
	   
	   @RequestMapping(value="/Mypage", method=RequestMethod.GET)
		public ModelAndView Mypage() {
		   
			ModelAndView mav = new ModelAndView();
						
			mav.setViewName("airport/MyPage");
			
			return mav;
		}
	   @RequestMapping(value="/bookCheck", method=RequestMethod.GET)
		public ModelAndView bookCheck(@RequestParam String ticketnum){
		
		   ModelAndView mav = new ModelAndView();
			
		   //쿼리문으로 db insert 
		   System.out.println(ticketnum);
		   
		   mav.setViewName("redirect:/MainPage?bookcomplete");
		   
			return mav;
		}
	   
}
