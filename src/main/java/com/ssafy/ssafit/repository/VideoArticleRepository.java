package com.ssafy.ssafit.repository;

import java.util.List;

import com.ssafy.ssafit.dto.VideoArticleDto;

public interface VideoArticleRepository {

	// 추가
	public void insert(VideoArticleDto videoarticle);

	// 수정
	public void update(VideoArticleDto videoarticle);

	// 삭제
	public void delete(long id);

	// 단일 조회
	public VideoArticleDto selectById(long id);

	// 검색
	public List<VideoArticleDto> searchByTitle(String title);

	// 전체목록 조회
	public List<VideoArticleDto> selectAll();

	// 시청순 정렬
	public List<VideoArticleDto> selectAllByviewcnt();
	
	// 조회수 업데이트
	public void updateViewCount(long id);
}
