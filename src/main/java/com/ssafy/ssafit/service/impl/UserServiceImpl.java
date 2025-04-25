package com.ssafy.ssafit.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.ssafit.dto.UserDto;
import com.ssafy.ssafit.repository.UserRepository;
import com.ssafy.ssafit.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	private final UserRepository userRepository;
	
	public UserServiceImpl(UserRepository userRepository) {
		
		this.userRepository = userRepository;
		
	}

	@Override
	public void registUser(UserDto user) {
		
		userRepository.insert(user);
		
	}

	@Override
	public void withdrawUser(String userEmail) {
		
		userRepository.deleteUserByEmail(userEmail);
		
	}

	@Override
	public void modifyUser(UserDto user) {
		
		userRepository.update(user);
		
		
	}

	@Override
	public List<UserDto> getAllUser() {
		
		return userRepository.selectAll();
		
	}

	@Override
	public UserDto getUserByEmail(String userEmail) {

		return userRepository.selectByEmail(userEmail);
		
	}

	@Override
	public UserDto login(String userEmail, String userPassword) {
		
		UserDto user = userRepository.selectByEmail(userEmail);
		
		if(user != null && user.getUserPassword().equals(userPassword)) {
			return user;
		}
		
		return null;
		
	}
	
	

}
