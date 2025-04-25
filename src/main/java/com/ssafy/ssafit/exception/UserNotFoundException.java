package com.ssafy.ssafit.exception;

public class UserNotFoundException extends NotFoundException{
	public UserNotFoundException() {
		super("유저를 찾을 수 없습니다.");
	}
}
