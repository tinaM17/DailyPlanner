package com.tina.dailyPlanner.controller;


import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tina.dailyPlanner.model.User;
import com.tina.dailyPlanner.service.UserService;

@Controller
@SessionAttributes("username")
public class AuthController {
	private UserService userService;

	private PasswordEncoder passwordEncoder; 

	
	public AuthController(UserService userService,PasswordEncoder passwordEncoder) {
		super();
		this.userService=userService;
		this.passwordEncoder=passwordEncoder;
	}

	@GetMapping("login")
	public String login() {
		return "login";
	}

	
	
	
	@GetMapping("register")
	public String register(ModelMap model) {
		User user=new User("","","","user");
		model.put("user", user);
		return "signup";
	}
	
	@PostMapping("register")
	public String registerPost(User user,ModelMap model, Errors errors) {
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		user.setRole("user");
		String message=userService.register(user);
		if(message.length()==0) {
			return "redirect:/login";
		}
		model.put("error", message);
		return "signup";
	}
	

}
