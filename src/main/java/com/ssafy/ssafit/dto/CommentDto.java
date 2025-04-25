package com.ssafy.ssafit.dto;

import java.time.LocalDateTime;

public class CommentDto {

	private long commentId;

	private long userId;

	private long videoArticleId;

	private String commentContent;

	private LocalDateTime writeDate;

	private String userNickName;
	
	public CommentDto() {
		// TODO Auto-generated constructor stub
	}

	public CommentDto(long commentId, long userId, long videoArticleId, String commentContent, LocalDateTime writeDate, String userNickName) {
		super();
		this.commentId = commentId;
		this.userId = userId;
		this.videoArticleId = videoArticleId;
		this.commentContent = commentContent;
		this.writeDate = writeDate;
		this.userNickName = userNickName;
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

	

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public LocalDateTime getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(LocalDateTime writeDate) {
		this.writeDate = writeDate;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	@Override
	public String toString() {
		return "CommentDto [commentId=" + commentId + ", userId=" + userId + ", videoArticleId=" + videoArticleId
				+ ", commentContent=" + commentContent + ", writeDate=" + writeDate + ", userNickName=" + userNickName
				+ "]";
	}

	







}
