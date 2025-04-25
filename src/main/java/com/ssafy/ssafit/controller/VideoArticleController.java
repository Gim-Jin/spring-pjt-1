package com.ssafy.ssafit.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.ssafit.dto.VideoArticleDto;
import com.ssafy.ssafit.service.VideoArticleService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class VideoArticleController {

	private final VideoArticleService videoService;

	public VideoArticleController(VideoArticleService videoService) {
		this.videoService = videoService;
	}

//	@GetMapping("/admin/registform")
//	public String articleRegistForm() {
//	    return "admin/articleRegistForm";
//	}
//
//	
//	//글쓰기(관리자만)
//	@PostMapping("/regist")
//	public String createArticle(@ModelAttribute VideoArticleDto videoarticle ) {
//		videoService.createArticle(videoarticle);
//		return "redirect:/admin/articles";
//	}

	// 전체보기
	@GetMapping("/index")
	public String selectAllArticles(Model model) {
		List<VideoArticleDto> articles = videoService.selectAll();
		model.addAttribute("articles", articles);
		return "index";
	}

	// 정렬
	@GetMapping("/index/views")
	public String selectAllByViewcnt(Model model) {
		List<VideoArticleDto> articles = videoService.selectAllByviewcnt();
		model.addAttribute("articles", articles);
		return "index"; // 기존 뷰 재사용 가능
	}

	// 검색 제목
	@GetMapping("/search/{title}")
	public String searchByTitle(@PathVariable String title, Model model) {
		List<VideoArticleDto> articles = videoService.searchByTitle(title);
		model.addAttribute("articles", articles);
		return "index"; // 검색 결과도 index 페이지 재활용
	}

	// 상세보기
	@GetMapping("/articles/{id}")
	public String getArticleDetails(@PathVariable long id, Model model) {
		VideoArticleDto article = videoService.detailArticle(id);
		model.addAttribute("article", article);
		return "article/detail"; // detail.jsp 또는 detail.html
	}

}
