package com.ssafy.ssafit.exception;


// 400번대 에러는 이거 상속해서 쓰면 됨.
public abstract class BadRequestException extends RuntimeException {
	
	private final int CODE = 400;
	
	public BadRequestException(String msg) {
		super(msg);
	}
	
	public int getCode() {
		return CODE;
	}

}
