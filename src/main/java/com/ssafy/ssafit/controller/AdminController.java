package com.ssafy.ssafit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.ssafit.dto.UserDto;
import com.ssafy.ssafit.service.AdminService;
import com.ssafy.ssafit.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final UserService userService;
	
	private final AdminService adminService;
	
	// 생성자 주입.
	public AdminController(UserService userService, AdminService adminService) {
		
		this.userService = userService;
		
		this.adminService = adminService;
	}
	
	@GetMapping("/index")
	public String adminIndex() {
		return "adminIndex";
	}
	
	@GetMapping("/login")
	public String adminLoginForm() {
		return "adminLoginForm";
	}
	
	@PostMapping("/login")
	public String adminLogin(@RequestParam("loginId") String loginId, @RequestParam("password") String password, HttpSession session) {
		
		if(adminService.adminLogin(loginId, password)) {
			
			session.setAttribute("role", "admin");
			
			return "redirect:/admin/index";
		}
		
		return "redirect:/admin/login";
	}
	
	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/admin/index";
		
	}
	
	
	@GetMapping("/users")
	public String userList(Model model) {
		
		model.addAttribute("users", userService.getAllUser());
		
		return "userList";
	}
	
	// TODO : email로 받을지, id로 받을지 결정해야함.
	@GetMapping("/users/{email}")
	public String userDetail(@PathVariable("email") String email, Model model) {
			
		UserDto user = userService.getUserByEmail(email);
		
		// 관리자는 유저의 모든 것을 알고 있어야 함. (오늘 프로젝트에서는 ㅎㅎ 에초에 DB에 암호화 해서 넣어야함.)
		model.addAttribute("user",user);
		
		return "adminUserDetail";
		
		
	}
	
	@GetMapping("/users/{email}/modify")
	public String adminUserModifyForm(@PathVariable("email") String email, Model model) {
		
		UserDto user = userService.getUserByEmail(email);
		
		model.addAttribute(user);
		
		return "adminUserModifyForm";
		
	}
	
	@PostMapping("/users/{email}/modify")
	public String adminUserModify(@ModelAttribute UserDto user) {
		
		userService.modifyUser(user);
		
		// 수정 후 이메일 상세 페이지로 반환.
		return "redirect:/admin/users/"+ user.getUserEmail();
		
	}
	
	@GetMapping("/users/{email}/delete")
	public String adminUserDelete(@PathVariable("email") String email) {
		
		userService.withdrawUser(email);
		
		return "redirect:/admin/users";
		
	}
	
	
	
	
}
