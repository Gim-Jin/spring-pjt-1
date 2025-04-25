<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>review.detail</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
	rel="stylesheet">
<style>
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css")
	;

body {
	font-family: "Pretendard Variable", Pretendard, -apple-system,
		BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI",
		"Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic",
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
}

/* 로그인 버튼 정렬 */
.btn-custom {
	width: 100px;
	max-width: 10em;
}

.min-vh-custom {
	min-height: 86vh;
}
</style>
</head>

<body>

	<%@ include file="../header.jsp"%>
	<main class="container min-vh-custom mt-5 pt-5">
		<section>
			<h1 class="mb-4 text-center">운동영상 리뷰</h1>
		</section>
		<hr>
		<div class="d-flex justify-content-between align-items-center">
			<form method="get" action="main">
				<input type="hidden" name="action" value="detail">
				<input type="hidden" name="id" value="${sessionScope.videoId}">
				<button class="btn btn-primary btn-custom">목록</button>
			</form>
				<div class="d-flex gap-2">
			<form method="get" action="main">
				<input type="hidden" name="action" value="editform">
				<input type="hidden" name="videoId" value="${sessionScope.videoId}">
				<input type="hidden" name="reviewId" value="${sessionScope.reviewId}">
					<button class="btn btn-primary btn-custom">글수정</button>
			</form>
			<form method="get" action="main">
				<input type="hidden" name="action" value="remove">
				<input type="hidden" name="videoId" value="${sessionScope.videoId}">
				<input type="hidden" name="reviewId" value="${sessionScope.reviewId}">
					<button class="btn btn-danger btn-custom">글삭제</button>
			</form>
				</div>
		</div>
		<section class="bg-light p-5 rounded shadow-sm text-center">
			<h2 class="mb-5">${sessionScope.review.title}</h2>
			<div class="mt-3">작성자 : ${sessionScope.review.writer}</div>
			<div class="mt-3">작성일 : ${sessionScope.review.formattedWriteDate}</div>
			<div class="mt-3">조회수 : ${sessionScope.review.views}</div>
			<hr>
			<div class="mt-4">${sessionScope.review.content}</div>
		</section>
	</main>
	<%@ include file="../footer.jsp"%>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe1e9I1lRhbuPWxnb7NbkEjZL1iEcfXgzI1GpG9RSdA81MsrHsX5l8/"></script>
</body>
</html>