<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.ssafy.dto.Video"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
    // 🚀 쿠키 확인해서 init 요청을 한 적이 있는지 검사
    boolean isInitDone = false;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("initDone".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
                isInitDone = true;
                break;
            }
        }
    }

    // 🚀 쿠키가 없으면 init 요청을 보냄
    if (!isInitDone && session.getAttribute("videoList") == null) {
        response.sendRedirect("main?act=init");
    }
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSAFIT - 건강한 삶을 위한 운동 플랫폼</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css");

body {
	font-family: "Pretendard Variable", Pretendard, -apple-system,
		BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI",
		"Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic",
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    padding-top: 80px; /* 헤더 고정으로 인한 패딩 */
}

.hero-section {
    background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
    background-size: cover;
    background-position: center;
    color: white;
    padding: 7rem 0;
    text-align: center;
}

.feature-card {
    border: none;
    border-radius: 10px;
    overflow: hidden;
    transition: transform 0.3s ease;
}

.feature-card:hover {
    transform: translateY(-10px);
}

.feature-icon {
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

.category-card {
    position: relative;
    overflow: hidden;
    border-radius: 10px;
    height: 200px;
}

.category-card img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
}

.category-card:hover img {
    transform: scale(1.1);
}

.category-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    display: flex;
    align-items: center;
    justify-content: center;
}

.video-card {
    border: none;
    border-radius: 10px;
    overflow: hidden;
    transition: transform 0.3s ease;
}

.video-card:hover {
    transform: translateY(-5px);
}

.video-thumb {
    position: relative;
    padding-top: 56.25%; /* 16:9 비율 유지 */
}

.video-thumb img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.play-icon {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    opacity: 0;
    transition: opacity 0.3s ease;
    color: white;
    font-size: 3rem;
}

.video-thumb:hover .play-icon {
    opacity: 1;
}

.video-info {
    padding: 1rem;
}

.video-view-count {
    color: #6c757d;
}

.navbar {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.service-card {
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease;
	width: 300px;
}

.service-card:hover {
	transform: translateY(-10px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.filter-buttons {
	margin-bottom: 20px;
	text-align: center;
}

.filter-buttons button {
	margin: 5px;
    font-weight: 600;
    border-radius: 30px;
    padding: 8px 20px;
}

.filter-buttons button.active {
    background-color: #0d6efd;
    color: white;
}

.slider-container {
	position: relative;
	width: 100%;
	overflow: hidden;
	padding: 20px 0;
}

.card-container {
	display: flex;
	gap: 15px;
	overflow-x: scroll;
	scroll-behavior: smooth;
	padding: 10px;
    scroll-snap-type: x mandatory;
}

.card-container::-webkit-scrollbar {
	display: none;
}

.card {
	width: 300px;
	height: 320px;
	background: white;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	flex-shrink: 0;
    scroll-snap-align: start;
    border: none;
}

.card img {
	width: 100%;
	height: 180px;
	object-fit: cover;
    transition: transform 0.5s ease;
}

.card:hover img {
    transform: scale(1.05);
}

.card-body {
	padding: 15px;
	text-align: center;
}

.card-title {
    font-weight: 700;
    color: #0d6efd;
    margin-bottom: 8px;
}

.card-text {
    font-size: 1rem;
    color: #333;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 50px;
}

.slider-btn {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background: rgba(0, 0, 0, 0.6);
	color: white;
	border: none;
	padding: 12px 18px;
	cursor: pointer;
	border-radius: 50%;
	z-index: 10;
    transition: all 0.3s ease;
}

.slider-btn:hover {
    background: rgba(0, 0, 0, 0.8);
    transform: translateY(-50%) scale(1.1);
}

.slider-btn.left {
	left: 10px;
}

.slider-btn.right {
	right: 10px;
}

.section-title {
    position: relative;
    display: inline-block;
    padding-bottom: 10px;
    margin-bottom: 30px;
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 3px;
    background-color: #0d6efd;
}

.popular-section {
    background-color: #f8f9fa;
    padding: 50px 0;
    margin-top: 30px;
}

.badge-part {
    position: absolute;
    top: 10px;
    right: 10px;
    background-color: #0d6efd;
    color: white;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
}

.views-count {
    position: absolute;
    bottom: 10px;
    right: 10px;
    color: #6c757d;
    font-size: 0.8rem;
}

.views-count i {
    margin-right: 3px;
}
</style>
</head>

<body>
	<%@ include file="header.jsp"%>

	<section class="hero-section">
		<div class="container">
			<h1 class="display-4 fw-bold mb-4">건강한 삶의 시작, SSAFIT과 함께</h1>
			<p class="lead mb-5">집에서도, 헬스장에서도 당신의 운동을 효과적으로 도와드립니다</p>
			<div class="d-flex justify-content-center gap-3">
				<a href="${pageContext.request.contextPath}/video/list" class="btn btn-primary btn-lg px-4 py-2">운동 시작하기</a>
				<a href="${pageContext.request.contextPath}/user/register" class="btn btn-outline-light btn-lg px-4 py-2">회원가입</a>
			</div>
		</div>
	</section>

	<section class="py-5 bg-light">
		<div class="container">
			<h2 class="text-center mb-5">SSAFIT만의 특별한 기능</h2>
			<div class="row g-4">
				<div class="col-md-4">
					<div class="card h-100 shadow-sm feature-card">
						<div class="card-body text-center p-4">
							<div class="feature-icon text-primary">
								<i class="bi bi-collection-play"></i>
							</div>
							<h4>다양한 운동 콘텐츠</h4>
							<p class="text-muted">상체, 하체, 전신 등 다양한 운동 영상을 제공합니다. 당신의 목표에 맞는 운동을 찾아보세요.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card h-100 shadow-sm feature-card">
						<div class="card-body text-center p-4">
							<div class="feature-icon text-primary">
								<i class="bi bi-people"></i>
							</div>
							<h4>활성화된 커뮤니티</h4>
							<p class="text-muted">다른 사용자들과 경험을 공유하고, 운동 팁을 얻으세요. 함께하면 더 재미있습니다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card h-100 shadow-sm feature-card">
						<div class="card-body text-center p-4">
							<div class="feature-icon text-primary">
								<i class="bi bi-star"></i>
							</div>
							<h4>리뷰 및 피드백</h4>
							<p class="text-muted">영상에 대한 리뷰를 작성하고 다른 사용자들의 의견을 확인하세요. 최적의 운동을 선택하는데 도움이 됩니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5">
		<div class="container">
			<h2 class="text-center mb-5">운동 카테고리</h2>
			<div class="row g-4">
				<div class="col-md-4">
					<a href="${pageContext.request.contextPath}/video/list?category=상체" class="text-decoration-none">
						<div class="category-card">
							<img src="https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="상체 운동">
							<div class="category-overlay">
								<h3 class="text-white">상체 운동</h3>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="${pageContext.request.contextPath}/video/list?category=하체" class="text-decoration-none">
						<div class="category-card">
							<img src="https://images.unsplash.com/photo-1434682881908-b43d0467b798?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1474&q=80" alt="하체 운동">
							<div class="category-overlay">
								<h3 class="text-white">하체 운동</h3>
							</div>
						</div>
					</a>
				</div>
				<div class="col-md-4">
					<a href="${pageContext.request.contextPath}/video/list?category=전신" class="text-decoration-none">
						<div class="category-card">
							<img src="https://images.unsplash.com/photo-1549060279-7e168fcee0c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="전신 운동">
							<div class="category-overlay">
								<h3 class="text-white">전신 운동</h3>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5 bg-light">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center mb-4">
				<h2>인기 운동 영상</h2>
				<a href="${pageContext.request.contextPath}/video/list" class="btn btn-outline-primary">더 보기</a>
			</div>
			
			<div class="row g-4">
				<c:choose>
					<c:when test="${not empty popularVideos}">
						<c:forEach items="${popularVideos}" var="video">
							<div class="col-md-4">
								<div class="card video-card shadow-sm">
									<a href="${pageContext.request.contextPath}/video/detail?id=${video.id}" class="text-decoration-none">
										<div class="video-thumb">
											<img src="https://img.youtube.com/vi/${video.youtubeId}/maxresdefault.jpg" alt="${video.title}">
											<div class="play-icon">
												<i class="bi bi-play-circle-fill"></i>
											</div>
										</div>
									</a>
									<div class="video-info">
										<h5 class="card-title">${video.title}</h5>
										<p class="card-text text-muted">${video.channelName}</p>
										<div class="d-flex justify-content-between">
											<span class="video-view-count"><i class="bi bi-eye me-1"></i> ${video.viewCnt}</span>
											<span class="text-muted">${video.category}</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<!-- 임시 데이터 (데이터베이스에서 데이터를 가져오기 전까지 표시) -->
						<div class="col-md-4">
							<div class="card video-card shadow-sm">
								<a href="#" class="text-decoration-none">
									<div class="video-thumb">
										<img src="https://img.youtube.com/vi/gMaB-fG4u4g/maxresdefault.jpg" alt="전신 다이어트 운동">
										<div class="play-icon">
											<i class="bi bi-play-circle-fill"></i>
										</div>
									</div>
								</a>
								<div class="video-info">
									<h5 class="card-title">전신 다이어트 운동 루틴</h5>
									<p class="card-text text-muted">힙으뜸</p>
									<div class="d-flex justify-content-between">
										<span class="video-view-count"><i class="bi bi-eye me-1"></i> 1,240,568</span>
										<span class="text-muted">전신</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card video-card shadow-sm">
								<a href="#" class="text-decoration-none">
									<div class="video-thumb">
										<img src="https://img.youtube.com/vi/swRNeYw1JkY/maxresdefault.jpg" alt="상체 운동">
										<div class="play-icon">
											<i class="bi bi-play-circle-fill"></i>
										</div>
									</div>
								</a>
								<div class="video-info">
									<h5 class="card-title">상체 덤벨 운동 홈트레이닝</h5>
									<p class="card-text text-muted">권혁TV</p>
									<div class="d-flex justify-content-between">
										<span class="video-view-count"><i class="bi bi-eye me-1"></i> 987,123</span>
										<span class="text-muted">상체</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card video-card shadow-sm">
								<a href="#" class="text-decoration-none">
									<div class="video-thumb">
										<img src="https://img.youtube.com/vi/tzN6ypk6Sps/maxresdefault.jpg" alt="하체 운동">
										<div class="play-icon">
											<i class="bi bi-play-circle-fill"></i>
										</div>
									</div>
								</a>
								<div class="video-info">
									<h5 class="card-title">하체 근력 강화 운동</h5>
									<p class="card-text text-muted">피지컬갤러리</p>
									<div class="d-flex justify-content-between">
										<span class="video-view-count"><i class="bi bi-eye me-1"></i> 752,986</span>
										<span class="text-muted">하체</span>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</section>

	<section class="py-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 mb-4 mb-lg-0">
					<h2 class="mb-3">함께 성장하는 커뮤니티</h2>
					<p class="lead mb-4">SSAFIT 커뮤니티에서 다른 운동 동료들과 경험을 공유하고 동기부여를 받으세요. 질문하고, 답변하고, 자신의 성과를 자랑해보세요!</p>
					<div class="d-flex gap-3">
						<a href="${pageContext.request.contextPath}/board/list" class="btn btn-primary">커뮤니티 참여하기</a>
						<a href="${pageContext.request.contextPath}/board/write" class="btn btn-outline-dark">글 작성하기</a>
					</div>
				</div>
				<div class="col-lg-6">
					<img src="https://images.unsplash.com/photo-1556817411-31ae72fa3ea0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="커뮤니티" class="img-fluid rounded shadow">
				</div>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>

	<script>
		// 필터 버튼 활성화 효과
		const filterButtons = document.querySelectorAll('.filter-buttons button');
		filterButtons.forEach(button => {
			button.addEventListener('click', function() {
				filterButtons.forEach(btn => btn.classList.remove('active'));
				this.classList.add('active');
			});
		});

		function filterSelection(category) {
			let cards = document.querySelectorAll('.service-card');
			if (category === 'all') {
				cards.forEach(card => card.style.display = 'block');
			} else {
				cards.forEach(card => {
					if (card.classList.contains(category)) {
						card.style.display = 'block';
					} else {
						card.style.display = 'none';
					}
				});
			}
		}

		function scrollLeftAct() {
			document.querySelector('.card-container').scrollBy({ left: -320, behavior: 'smooth' });
		}

		function scrollRightAct() {
			document.querySelector('.card-container').scrollBy({ left: 320, behavior: 'smooth' });
		}
		
		// 부드러운 스크롤 효과
		document.querySelectorAll('a[href^="#"]').forEach(anchor => {
			anchor.addEventListener('click', function(e) {
				e.preventDefault();
				document.querySelector(this.getAttribute('href')).scrollIntoView({
					behavior: 'smooth'
				});
			});
		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html> 