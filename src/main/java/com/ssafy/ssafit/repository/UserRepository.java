package com.ssafy.ssafit.repository;

import com.ssafy.ssafit.dto.UserDto;

public interface UserRepository {
	
	public void insert(UserDto user);
	
	public UserDto selectByEmail(String email);
	

	
}
