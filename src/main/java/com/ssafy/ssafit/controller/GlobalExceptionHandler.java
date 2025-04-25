package com.ssafy.ssafit.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(Throwable.class)
	public String handle(Throwable ex, Model model) {
		
		model.addAttribute("msg",ex.getMessage());
		
		return "error";
		
	}
}
