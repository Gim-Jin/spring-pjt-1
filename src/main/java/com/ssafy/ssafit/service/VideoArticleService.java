package com.ssafy.ssafit.service;

import java.util.List;

import com.ssafy.ssafit.dto.VideoArticleDto;

public interface VideoArticleService {

	public void createArticle(VideoArticleDto videoarticle);

	public void updateArticle(VideoArticleDto videoarticle);

	public void deleteArticle(long id);

	// 자세히 보기
	public VideoArticleDto detailArticle(long id);

	// 검색
	public List<VideoArticleDto> searchByTitle(String title);

	// 전체목록 조회
	public List<VideoArticleDto> selectAll();

	// 시청순 정렬
	public List<VideoArticleDto> selectAllByviewcnt();
	
	// 부위별 조회
	public List<VideoArticleDto> selectVideosByPart(String part);
}
