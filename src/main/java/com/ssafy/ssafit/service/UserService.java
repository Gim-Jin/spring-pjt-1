package com.ssafy.ssafit.service;

import java.util.List;

import com.ssafy.ssafit.dto.UserDto;

public interface UserService {
	
	public void registUser(UserDto user);
	
	public void withdrawUser(String userEmail);
	
	public void modifyUser(UserDto user);
	
	public List<UserDto> getAllUser();
	
	public UserDto getUserByEmail(String userEmail);
	
	public UserDto login(String userEmail, String userPassword);
	
}
