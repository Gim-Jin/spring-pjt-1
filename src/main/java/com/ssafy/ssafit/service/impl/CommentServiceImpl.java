package com.ssafy.ssafit.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import com.ssafy.ssafit.dto.CommentDto;
import com.ssafy.ssafit.repository.CommentRepository;
import com.ssafy.ssafit.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	private final CommentRepository commentRepository;

	public CommentServiceImpl(CommentRepository commentRepository) {

		this.commentRepository = commentRepository;
	}

	@Override
	public void createComment(CommentDto comment) {
		commentRepository.insert(comment);
	}

	@Override
	public void updateComment(CommentDto comment) {
		commentRepository.update(comment);
	}

	@Override
	public void delete(long id) {
		commentRepository.delete(id);
	}

	@Override
	public CommentDto select(long id) {
		return commentRepository.select(id);
	}

	@Override
	public List<CommentDto> selectAll(long commentId) {
		return commentRepository.selectAll(commentId);
	}

}
