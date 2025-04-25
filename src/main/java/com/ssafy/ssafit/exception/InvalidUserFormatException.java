package com.ssafy.ssafit.exception;

public class InvalidUserFormatException extends BadRequestException {
	
	public InvalidUserFormatException() {
		super("유효한 입력이 아닙니다.");
	}
}
