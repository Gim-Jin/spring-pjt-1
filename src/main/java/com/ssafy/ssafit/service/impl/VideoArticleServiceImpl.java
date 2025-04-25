package com.ssafy.ssafit.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.ssafit.dto.VideoArticleDto;
import com.ssafy.ssafit.repository.VideoArticleRepository;
import com.ssafy.ssafit.service.VideoArticleService;

@Service
public class VideoArticleServiceImpl implements VideoArticleService {

	private final VideoArticleRepository videoRepository;

	public VideoArticleServiceImpl(VideoArticleRepository videoArticleRepository) {
		this.videoRepository = videoArticleRepository;
	}

	@Override
	public void createArticle(VideoArticleDto videoarticle) {
		videoRepository.insert(videoarticle);

	}

	@Override
	public void updateArticle(VideoArticleDto videoarticle) {
		videoRepository.update(videoarticle);

	}

	@Override
	public void deleteArticle(long id) {
		videoRepository.delete(id);
	}

	@Override
	public VideoArticleDto detailArticle(long id) {
		return videoRepository.selectById(id);
	}

	@Override
	public List<VideoArticleDto> searchByTitle(String title) {
		return videoRepository.searchByTitle(title);
	}

	@Override
	public List<VideoArticleDto> selectAll() {
		return videoRepository.selectAll();
	}

	@Override
	public List<VideoArticleDto> selectAllByviewcnt() {
		return videoRepository.selectAllByviewcnt();
	}
	

}
