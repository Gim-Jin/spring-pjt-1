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

.table-reviews {
    background-color: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

.table-reviews th {
    background-color: #f8f9fa;
    font-weight: 600;
    text-align: center;
    padding: 15px;
}

.table-reviews td {
    padding: 15px;
    vertical-align: middle;
}

.review-title {
    font-weight: 500;
    color: #212529;
    transition: color 0.3s ease;
}

.review-title:hover {
    color: #0d6efd;
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

.search-container {
    max-width: 400px;
}

.form-control:focus {
    box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
    border-color: #86b7fe;
}

.btn-search {
    background-color: #0d6efd;
    color: white;
}

.no-reviews {
    text-align: center;
    padding: 30px;
    color: #6c757d;
    font-style: italic;
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
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4 class="review-header mb-0">리뷰 목록</h4>
                    <div class="d-flex gap-2">
                        <form class="search-container" method="post" action="main">
                            <div class="input-group">
                                <input type="hidden" name="action" value="search">
                                <input type="text" class="form-control" name="value" placeholder="제목, 내용으로 검색">
                                <button class="btn btn-search" type="submit">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </form>
                        <form method="post" action="main">
                            <input type="hidden" name="action" value="writeform">
                            <input type="hidden" name="videoId" value="${article.videoArticleId}">
                            <button class="btn btn-write">
                                <i class="bi bi-pencil-square me-1"></i> 리뷰 작성
                            </button>
                        </form>
                    </div>
                </div>
            
                <div class="table-responsive">
                    <table class="table table-hover table-reviews">
                        <thead>
                            <tr>
                                <th style="width: 10%">번호</th>
                                <th style="width: 40%">제목</th>
                                <th style="width: 15%">작성자</th>
                                <th style="width: 15%">조회수</th>
                                <th style="width: 20%">작성시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty requestScope.reviews}">
                                    <tr>
                                        <td colspan="5" class="no-reviews">
                                            <i class="bi bi-chat-square-dots me-2"></i> 아직 작성된 리뷰가 없습니다. 첫 리뷰를 작성해보세요!
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="item" items="${reviews}" varStatus="status">
                                        <tr>
                                            <td class="text-center">${status.count}</td>
                                            <td>
                                                <a class="review-title text-decoration-none" 
                                                    href="main?action=review&videoId=${requestScope.video.id}&reviewId=${item.id}">
                                                    ${item.title}
                                                </a>
                                            </td>
                                            <td class="text-center">${item.writer}</td>
                                            <td class="text-center">${item.views}</td>
                                            <td class="text-center">${item.formattedWriteDate}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
                
                <div class="d-flex justify-content-center mt-4">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
			</div>
		</section>
	</main>
    
	<%@ include file="../footer.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>