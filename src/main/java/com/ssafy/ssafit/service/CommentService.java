package com.ssafy.ssafit.service;

import java.util.List;

import com.ssafy.ssafit.dto.CommentDto;

public interface CommentService {

	public void createComment(CommentDto comment);

	public void updateComment(CommentDto comment);

	public void delete(long id);

	public CommentDto select(long id);

	public List<CommentDto> selectAll(long articleId);


}
