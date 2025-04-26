<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSAFIT - 운동 영상 상세</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css");

body {
	font-family: "Pretendard Variable", Pretendard, -apple-system,
		BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI",
		"Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic",
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    padding-top: 80px;
}

.navbar {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.min-vh-custom {
	min-height: 86vh;
}

.video-container {
    position: relative;
    overflow: hidden;
    width: 100%;
    max-width: 900px;
    margin: 0 auto;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.video-responsive {
    position: relative;
    padding-bottom: 56.25%; /* 16:9 비율 */
    height: 0;
    overflow: hidden;
}

.video-responsive iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: 0;
}

.video-info {
    background-color: #f8f9fa;
    border-radius: 10px;
    padding: 20px;
    margin: 20px 0;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

.video-title {
    font-weight: 700;
    color: #212529;
    margin-bottom: 10px;
}

.video-meta {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    color: #6c757d;
}

.video-meta span {
    margin-right: 15px;
    display: flex;
    align-items: center;
}

.video-meta i {
    margin-right: 5px;
}

.badge-part {
    background-color: #0d6efd;
    color: white;
    font-weight: 600;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 0.8rem;
    margin-right: 10px;
}

.reviews-container {
    margin-top: 30px;
    width: 100%;
    max-width: 900px;
}

.review-header {
    position: relative;
    display: inline-block;
    padding-bottom: 10px;
    margin-bottom: 20px;
    font-weight: 700;
}

.review-header::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 50px;
    height: 3px;
    background-color: #0d6efd;
}

.btn-write {
    background-color: #0d6efd;
    color: white;
    border-radius: 50px;
    padding: 8px 25px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.btn-write:hover {
    background-color: #0b5ed7;
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
}

.form-control:focus {
    box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
    border-color: #86b7fe;
}

.no-reviews {
    text-align: center;
    padding: 30px;
    color: #6c757d;
    font-style: italic;
}

.comment-list {
    max-height: 500px;
    overflow-y: auto;
    margin-bottom: 20px;
}

.comment-item {
    padding: 15px;
    border-bottom: 1px solid #eee;
    background-color: white;
    transition: background-color 0.2s ease;
}

.comment-item:hover {
    background-color: #f8f9fa;
}

.comment-header {
    display: flex;
    justify-content: space-between;
    margin-bottom: 8px;
}

.comment-author {
    font-weight: 600;
    color: #343a40;
}

.comment-date {
    font-size: 0.85rem;
    color: #6c757d;
}

.comment-content {
    color: #495057;
}

.comment-form {
    background-color: #f8f9fa;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

.loading-spinner {
    display: none;
    text-align: center;
    padding: 20px;
}
</style>
</head>

<body>
	<%@ include file="../header.jsp"%>

	<main class="container py-5 min-vh-custom">
		<section class="d-flex flex-column align-items-center">
			<h2 class="text-center mb-4 fw-bold">운동 영상 상세</h2>
            
            <div class="video-container">
                <div class="video-responsive">
                    <iframe src="${article.videoArticleUrl}" title="YouTube video player" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>
            
            <div class="video-info w-100 max-width-900">
                <h3 class="video-title">${article.videoArticleTitle}</h3>
                <div class="video-meta">
                    <span class="badge-part">${article.videoArticlePart}</span>
                    <span><i class="bi bi-eye"></i> ${article.videoArticleViews}회</span>
                </div>
                <p>${article.videoArticleTitle}에 대한 상세 설명입니다. 이 영상은 ${article.videoArticlePart} 운동에 효과적인 동작들을 포함하고 있습니다.</p>
            </div>

			<div class="reviews-container">
                <div class="mb-4">
                    <h4 class="review-header mb-0">리뷰 목록</h4>
                </div>
                
                <!-- 댓글 목록 (리스트 형태로 변경) -->
                <div class="comment-list" id="commentList">
                    <c:if test="${empty comments}">
                        <div class="no-reviews">작성된 리뷰가 없습니다. 첫 번째 리뷰를 작성해보세요!</div>
                    </c:if>
                    
                    <c:forEach items="${comments}" var="comment">
                        <div class="comment-item">
                            <div class="comment-header">
                                <span class="comment-author">${comment.userNickName}</span>
                                <span class="comment-date">${comment.writeDate}</span>
                            </div>
                            <div class="comment-content">${comment.commentContent}</div>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 로딩 스피너 -->
                <div class="loading-spinner" id="loadingSpinner">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">로딩 중...</span>
                    </div>
                </div>
                
                <!-- 댓글 입력 폼 -->
                <div class="comment-form">
                    <form method="post" action="${pageContext.request.contextPath}/articles/${article.videoArticleId}/comment" id="commentForm">
                        <input type="hidden" name="videoArticleId" value="${article.videoArticleId}">
                        <div class="mb-3">
                            <label for="commentContent" class="form-label">댓글 작성</label>
                            <textarea class="form-control" id="commentContent" name="commentContent" rows="3" placeholder="댓글을 입력하세요" required></textarea>
                        </div>
                        <div class="text-end">
                            <button type="submit" class="btn btn-primary">등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
		</section>
	</main>

	<%@ include file="../footer.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 무한 스크롤 구현
        document.addEventListener('DOMContentLoaded', function() {
            const commentList = document.getElementById('commentList');
            const loadingSpinner = document.getElementById('loadingSpinner');
            
            let page = 1;
            let isLoading = false;
            let hasMoreComments = true;
            
            // 스크롤 이벤트 리스너
            commentList.addEventListener('scroll', function() {
                const { scrollTop, scrollHeight, clientHeight } = commentList;
                
                // 스크롤이 하단에 도달했는지 확인
                if (scrollTop + clientHeight >= scrollHeight - 5 && !isLoading && hasMoreComments) {
                    loadMoreComments();
                }
            });
            
            // 추가 댓글 로딩 함수
            function loadMoreComments() {
                isLoading = true;
                loadingSpinner.style.display = 'block';
                
                // 다음 페이지 댓글 로딩 (AJAX 요청)
                fetch(`/api/articles/${article.videoArticleId}/comments?page=${page}`)
                    .then(response => response.json())
                    .then(data => {
                        loadingSpinner.style.display = 'none';
                        
                        if (data.length === 0) {
                            hasMoreComments = false;
                            return;
                        }
                        
                        // 댓글 목록에 추가
                        data.forEach(comment => {
                            const commentItem = document.createElement('div');
                            commentItem.className = 'comment-item';
                            commentItem.innerHTML = `
                                <div class="comment-header">
                                    <span class="comment-author">${comment.userNickName}</span>
                                    <span class="comment-date">${comment.writeDate}</span>
                                </div>
                                <div class="comment-content">${comment.commentContent}</div>
                            `;
                            commentList.appendChild(commentItem);
                        });
                        
                        page++;
                        isLoading = false;
                    })
                    .catch(error => {
                        console.error('댓글을 불러오는 중 오류가 발생했습니다:', error);
                        loadingSpinner.style.display = 'none';
                        isLoading = false;
                    });
            }
        });
    </script>
</body>

</html>