package com.ssafy.ssafit.exception;


// 이것도 404번 에러는 상속해서 쓰면 됨.
public abstract class NotFoundException extends RuntimeException {
	
	
	private final int CODE = 404;

	public NotFoundException(String msg) {
		super(msg);
	}
	
	public int getCode() {
		return CODE;
	}
	
	
}
