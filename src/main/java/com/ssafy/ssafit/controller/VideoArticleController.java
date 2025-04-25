package com.ssafy.ssafit.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssafy.ssafit.dto.CommentDto;
import com.ssafy.ssafit.dto.VideoArticleDto;
import com.ssafy.ssafit.service.CommentService;
import com.ssafy.ssafit.service.VideoArticleService;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;


import jakarta.servlet.http.HttpSession;

@Controller
public class VideoArticleController {

	private final VideoArticleService videoService;
	
	private final CommentService commentService;

	public VideoArticleController(VideoArticleService videoService, CommentService commentService) {
		this.videoService = videoService;
		this.commentService = commentService;
	}

	// 전체보기
	@GetMapping({ "/index", "/" })
	public String selectAllArticles(Model model) {
		List<VideoArticleDto> articles = videoService.selectAll();
		for (VideoArticleDto article : articles) {
			String url = article.getVideoArticleUrl();
			String videoId = url.substring(url.lastIndexOf("/") + 1);
			article.setVideoArticleUrl(videoId);
		}
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

		List<CommentDto> comments = commentService.selectAll(id);
		model.addAttribute("comments", comments);
		return "detail"; // detail.jsp 또는 detail.html
	}

	// 댓글쓰기
	@PostMapping("/articles/{id}/comment")
	public String registerComment(@PathVariable long id, @ModelAttribute CommentDto comment, HttpSession session) {


		
		comment.setUserId(Long.parseLong(session.getAttribute("id").toString()));
		commentService.createComment(comment);
		return "redirect:/articles/"+id;
	}

	@PostMapping("/articles/{articleId}/comments/{commentId}/delete")
	public String deleteComment(@PathVariable long articleId, @PathVariable long commentId) {
		commentService.delete(commentId);
		return "redirect:/articles/" + articleId;
	}

	@GetMapping("/articles/{articleId}/comments/{commentId}/edit")
	public String editCommentForm(@PathVariable long articleId, @PathVariable long commentId, Model model) {
		CommentDto comment = commentService.select(commentId);
		model.addAttribute("comment", comment);
		return "comment/editForm"; // JSP에서 수정 폼 렌더링
	}

	// 댓글 수정
	@PostMapping("/articles/{articleId}/comments/{commentId}/update")
	public String updateComment(@PathVariable long articleId, @PathVariable long commentId,
			@ModelAttribute CommentDto commentDto) {
		commentDto.setCommentId(commentId);
		commentDto.setVideoArticleId(articleId);
		commentService.updateComment(commentDto);
		return "redirect:/articles/" + articleId;
	}

	// 부위별 조회하기
	@GetMapping("/video/list")
	public String videoListByCategory(@RequestParam String category, Model model) {
		List<VideoArticleDto> articles = videoService.selectVideosByPart(category);
		// URL에서 비디오 ID 추출
		for (VideoArticleDto article : articles) {
			String url = article.getVideoArticleUrl();
			String videoId = url.substring(url.lastIndexOf("/") + 1);
			article.setVideoArticleUrl(videoId);
		}
		model.addAttribute("articles", articles);
		model.addAttribute("selectedPart", category);
		return "index";
	}

}
