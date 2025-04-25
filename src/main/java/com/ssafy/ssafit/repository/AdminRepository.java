package com.ssafy.ssafit.repository;

import com.ssafy.ssafit.dto.AdminDto;

public interface AdminRepository {
	
	public AdminDto selectById(String loginId);
	
}
