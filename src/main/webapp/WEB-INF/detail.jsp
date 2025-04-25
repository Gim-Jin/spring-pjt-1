<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

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

.navbar {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.min-vh-custom {
	min-height: 86vh;
}
</style>
</head>

<body>
	<%@ include file="../header.jsp"%>

	<main class="pt-1 mt-5 min-vh-custom">
		<section class="d-flex flex-column align-items-center my-5">
			<div class="fs-3 mb-3">운동 영상 리뷰</div>

			<div
				class="w-75 d-flex justify-content-center border-top border-bottom border-secondary py-3">
				<iframe width="560" height="315" src="${video.url}"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			</div>

			<div class="d-flex align-items-center justify-content-around w-100">
				<form class="w-75 d-flex justify-content-center mt-3" method="post"
					action="main">
					<input type="hidden" name="action" value="writeform">
					<input type="hidden" name="videoId" value="${video.id}">
					<button class="btn btn-outline-primary">글쓰기</button>
				</form>
				<div class="input-group w-75">
					<form class="w-75 d-flex justify-content-center mt-3" method="post"
						action="main">
						<input type="hidden" name="action" value="search">
						<button class="btn btn-outline-secondary">검색</button>
						<input type="text" class="form-control" name="value"
							placeholder="제목, 내용으로 검색">
					</form>
				</div>
			</div>
			<div
				class="row mt-3 py-3 w-75 border-top border-bottom border-secondary">
				<div class="col">번호</div>
				<div class="col-6">제목</div>
				<div class="col">작성자</div>
				<div class="col">조회수</div>
				<div class="col">작성시간</div>
			</div>
			<c:forEach var="item" items="${requestScope.reviews}"
				varStatus="status">
				<div class="row mt-3 w-75">
					<div class="col">${status.count}</div>
					<a class="col-6 text-dark text-decoration-none"
						href="main?action=review&videoId=${requestScope.video.id}&reviewId=${item.id}"
						target="_self">${item.title}</a>
					<div class="col">${item.writer}</div>
					<div class="col">${item.views}</div>
					<div class="col">${item.formattedWriteDate}</div>
				</div>
			</c:forEach>
		</section>
	</main>
	<%@ include file="../footer.jsp"%>

	<!-- Bootstrap JS CDN -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe1e9I1lRhbuPWxnb7NbkEjZL1iEcfXgzI1GpG9RSdA81MsrHsX5l8/"></script>
</body>

</html>