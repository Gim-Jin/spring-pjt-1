package com.ssafy.ssafit.dto;

import java.time.LocalDateTime;

public class CommentDto {

	private long commentId;

	private long userId;

	private long videoArticleId;

	private String reviewContent;

	private LocalDateTime writeDate;


	public CommentDto() {
		// TODO Auto-generated constructor stub
	}

	public CommentDto(long commentId, long userId, long videoArticleId, String reviewContent, LocalDateTime writeDate) {
		super();
		this.commentId = commentId;
		this.userId = userId;
		this.videoArticleId = videoArticleId;
		this.reviewContent = reviewContent;
		this.writeDate = writeDate;
		
	}

	public long getCommentId() {
		return commentId;
	}

	public void setCommentId(long commentId) {
		this.commentId = commentId;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public long getVideoArticleId() {
		return videoArticleId;
	}

	public void setVideoArticleId(long videoArticleId) {
		this.videoArticleId = videoArticleId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public LocalDateTime getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}


	@Override
	public String toString() {
		return "CommentDto [commentId=" + commentId + ", userId=" + userId + ", videoArticleId=" + videoArticleId
				+ ", reviewContent=" + reviewContent + ", writeDate=" + writeDate + ", viewCnt=" + "]";
	}

}
