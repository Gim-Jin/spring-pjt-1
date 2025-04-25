package com.ssafy.ssafit.service.impl;

import org.springframework.stereotype.Service;

import com.ssafy.ssafit.dto.AdminDto;
import com.ssafy.ssafit.repository.AdminRepository;
import com.ssafy.ssafit.service.AdminService;



@Service
public class AdminServiceImpl implements AdminService {
	
	private final AdminRepository adminRepository;
	
	public AdminServiceImpl(AdminRepository adminRepository) {
		this.adminRepository = adminRepository;
	}

	@Override
	public boolean adminLogin(String loginId, String password) {
		
		AdminDto admin = adminRepository.selectById(loginId);
		
		if(admin != null && admin.getAdminPassword().equals(password)) {
			return true;
		}
		
		return false;
		
	}

	
	
	
}
