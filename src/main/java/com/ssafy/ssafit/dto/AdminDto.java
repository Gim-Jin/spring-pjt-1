package com.ssafy.ssafit.dto;

public class AdminDto {
	
	
	private long adminId;
	
	private String adminLoginId;
	
	private String adminPassword;
	
	public AdminDto() {
		// TODO Auto-generated constructor stub
	}

	public AdminDto(long adminId, String adminLoginId, String adminPassword) {
		super();
		this.adminId = adminId;
		this.adminLoginId = adminLoginId;
		this.adminPassword = adminPassword;
	}
	
	public long getAdminId() {
		return adminId;
	}

	public void setAdminId(long adminId) {
		this.adminId = adminId;
	}

	public String getAdminLoginId() {
		return adminLoginId;
	}

	public void setAdminLoginId(String adminLoginId) {
		this.adminLoginId = adminLoginId;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	@Override
	public String toString() {
		return "AdminDto [adminId=" + adminId + ", adminLoginId=" + adminLoginId + ", adminPassword=" + adminPassword
				+ "]";
	}
	
	
	
}
