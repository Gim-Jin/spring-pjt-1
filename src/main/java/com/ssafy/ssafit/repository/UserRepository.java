package com.ssafy.ssafit.repository;

import java.util.List;

import com.ssafy.ssafit.dto.UserDto;

public interface UserRepository {
	
	public void insert(UserDto user);
	
	public UserDto selectByEmail(String email);
	
	public void deleteUserByEmail(String email);
	
	public List<UserDto> selectAll();
	
	public void update(UserDto user);
	
}
