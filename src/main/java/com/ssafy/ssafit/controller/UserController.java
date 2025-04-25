package com.ssafy.ssafit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.ssafit.dto.UserDto;
import com.ssafy.ssafit.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/users")
public class UserController {
	
	private final UserService userService;
	
	public UserController(UserService userService) {
		
		this.userService = userService;
		
	}
	
	@GetMapping("/regist")
	public String registForm() {
		return "userRegistForm";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute UserDto user) {
			
		userService.registUser(user);
		
		return "redirect:/index";
		
	}	
	
	@GetMapping("/login")
	public String loginForm() {
		return "loginForm";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("userEmail") String userEmail, @RequestParam("userPassword") String password, HttpSession session) {
		
		
		UserDto loginedUser = userService.login(userEmail, password);
		if(loginedUser != null) {
			
			session.setAttribute("email", loginedUser.getUserEmail());
			
			session.setAttribute("nickname", loginedUser.getUserNickName());
			
			session.setAttribute("role", "user");
			
			session.setAttribute("id",loginedUser.getUserId());
			
			return "redirect:/index";
			
		} 
		return "redirect:/login";
		
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/index";
		
	}
	
	
}
