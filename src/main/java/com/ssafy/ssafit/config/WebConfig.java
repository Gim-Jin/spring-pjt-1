package com.ssafy.ssafit.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ssafy.ssafit.interceptor.AdminCheckInterceptor;
import com.ssafy.ssafit.interceptor.LoginCheckInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	
	
	private final LoginCheckInterceptor loginCheckInterceptor;
	
	private final AdminCheckInterceptor adminCheckInterceptor;
	
	public WebConfig(LoginCheckInterceptor loginCheckInterceptor, AdminCheckInterceptor adminCheckInterceptor) {
		this.loginCheckInterceptor = loginCheckInterceptor;
		this.adminCheckInterceptor = adminCheckInterceptor;
	}
	
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(loginCheckInterceptor)
		.excludePathPatterns("/","/index", "/admin/**","/users/regist" ,"/users/login","/admin/login");

		registry.addInterceptor(adminCheckInterceptor)
		.addPathPatterns("/admin/**")
		.excludePathPatterns("/admin/login");
		
	}
}
