package com.ssafy.ssafit.dto;

public class UserDto {
	
	private long userId;
	
	private String userEmail;
	
	private String userPassword;
	
	private String userNickName;
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	public UserDto(long userId, String userEmail, String userPassword, String userNickName) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userNickName = userNickName;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	@Override
	public String toString() {
		return "UserDto [userId=" + userId + ", userEmail=" + userEmail + ", userPassword=" + userPassword
				+ ", userNickName=" + userNickName + "]";
	}
	
	
	
	
}
