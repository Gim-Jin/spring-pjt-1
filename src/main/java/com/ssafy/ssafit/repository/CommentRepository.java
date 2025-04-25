package com.ssafy.ssafit.repository;

import java.util.List;

import com.ssafy.ssafit.dto.CommentDto;

public interface CommentRepository {

	// 추가
	public void insert(CommentDto comment);

	// 수정
	public void update(CommentDto comment);

	// 삭제
	public void delete(long id);

	// 조회
	public CommentDto select(long id);

	// 전체조회(기본은 생성순)
	public List<CommentDto> selectAll(long articleId);

}
