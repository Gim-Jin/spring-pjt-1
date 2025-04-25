<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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
<title>SSAFIT - 건강한 개발자 생활</title>
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
    padding-top: 80px; /* 헤더 고정으로 인한 패딩 */
}

.hero {
	height: 60vh;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: white;
	position: relative;
	overflow: hidden;
}

.hero-bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-size: cover;
	background-position: center;
	transition: opacity 1s ease-in-out;
}

.hero-slide {
	height: 60vh;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: white;
	background-size: cover;
	background-position: center;
	position: relative;
}

.carousel-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

.hero-content {
	position: relative;
	z-index: 2;
}

.hero h1 {
	font-size: 3.5rem;
	font-weight: bold;
	animation: fadeInDown 1.5s;
}

.hero p {
	font-size: 1.5rem;
	animation: fadeInUp 1.5s;
}

.carousel-indicators button {
	background-color: white;
}

.btn-primary {
	padding: 12px 24px;
	font-size: 1.2rem;
	border-radius: 50px;
	transition: all 0.3s ease-in-out;
}

.btn-primary:hover {
	transform: scale(1.1);
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

	<section id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#heroCarousel"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#heroCarousel"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#heroCarousel"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="hero-slide"
					style="background-image: url('https://gymgear.com/wp-content/uploads/2023/08/The-Gym-Pump-scaled.jpeg');">
					<div class="carousel-overlay"></div>
					<div class="container hero-content">
						<h1>코딩 핑계로 운동을 게을리 하신다고요?</h1>
						<p class="lead">제가 보기엔 코딩도 그렇게 열심히 하는 것 같지는 않은데요.</p>
						<a href="#exercise-section" class="btn btn-primary btn-lg">운동하기</a>
					</div>
				</div>
			</div>

			<div class="carousel-item">
				<div class="hero-slide"
					style="background-image: url('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGhlJTIwZ3ltfGVufDB8fDB8fHww');">
					<div class="carousel-overlay"></div>
					<div class="container hero-content">
						<h1>코딩도 체력이 있어야 할 수 있어요.</h1>
						<p class="lead">꾸준히 운동을 하다보면 코딩 체력도 늘거에요.</p>
						<a href="#exercise-section" class="btn btn-primary btn-lg">시작하기</a>
					</div>
				</div>
			</div>

			<div class="carousel-item">
				<div class="hero-slide"
					style="background-image: url('https://images.squarespace-cdn.com/content/v1/644927389a1ab06f2f12a9fe/d2cef23b-98a3-4e23-9835-e24209de58f5/IMG_4073.jpg');">
					<div class="carousel-overlay"></div>
					<div class="container hero-content">
						<h1>SSAFIT과 함께하는 운동이 더 즐겁다!</h1>
						<p class="lead">SSAFIT과 함께 건강한 코딩 생활을 만들어가요.</p>
						<a href="#exercise-section" class="btn btn-primary btn-lg">함께하기</a>
					</div>
				</div>
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#heroCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">이전</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#heroCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">다음</span>
		</button>
	</section>

	<section id="exercise-section" class="py-5">
		<div class="container">
			<h2 class="text-center mb-4 section-title">운동 부위 선택</h2>
			<p class="text-center mb-4">본인이 강화하고 싶은 부위를 선택해 보세요.</p>
			
			<div class="filter-buttons">
				<button class="btn btn-outline-primary active" onclick="filterSelection('all')">전체</button>
				<button class="btn btn-outline-primary" onclick="filterSelection('전신')">전신</button>
				<button class="btn btn-outline-primary" onclick="filterSelection('상체')">상체</button>
				<button class="btn btn-outline-primary" onclick="filterSelection('하체')">하체</button>
				<button class="btn btn-outline-primary" onclick="filterSelection('복부')">코어</button>
			</div>
			
			<div class="slider-container">
				<button class="slider-btn left" onclick="scrollLeftAct()"><i class="bi bi-chevron-left"></i></button>
				<div class="card-container">
					<c:forEach var="item" items="${sessionScope.videoList}" varStatus="status">
						<c:set var="videoId" value="${fn:substringAfter(item.url, '/embed/')}" />
						<c:set var="thumbnailUrl" value="https://img.youtube.com/vi/${videoId}/maxresdefault.jpg" />

						<a href="main?action=detail&id=${status.count}" class="text-decoration-none" target="_self">
							<div class="card service-card ${item.part}">
								<div class="position-relative">
									<img src="${thumbnailUrl}" class="card-img-top" alt="YouTube Thumbnail">
									<span class="badge-part">${item.part}</span>
								</div>
								<div class="card-body text-center">
									<h5 class="card-title">${item.part} 운동</h5>
									<p class="card-text">${item.title}</p>
									<div class="views-count">
										<i class="bi bi-eye"></i> ${item.viewCnt}
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
				<button class="slider-btn right" onclick="scrollRightAct()"><i class="bi bi-chevron-right"></i></button>
			</div>
		</div>
	</section>

	<section class="popular-section">
		<div class="container">
			<h2 class="text-center mb-4 section-title">인기 운동 영상</h2>
			<p class="text-center mb-4">SSAFIT 회원들이 가장 많이 본 운동 영상들입니다.</p>
			
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<c:forEach var="item" items="${sessionScope.videoList}" varStatus="status" begin="0" end="5">
					<c:set var="videoId" value="${fn:substringAfter(item.url, '/embed/')}" />
					<c:set var="thumbnailUrl" value="https://img.youtube.com/vi/${videoId}/maxresdefault.jpg" />
					
					<div class="col">
						<a href="main?action=detail&id=${status.count}" class="text-decoration-none">
							<div class="card h-100 service-card">
								<div class="position-relative">
									<img src="${thumbnailUrl}" class="card-img-top" alt="YouTube Thumbnail">
									<span class="badge-part">${item.part}</span>
								</div>
								<div class="card-body">
									<h5 class="card-title">${item.title}</h5>
									<p class="card-text">효과적인 ${item.part} 운동으로 건강한 몸을 만들어보세요.</p>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<small class="text-muted"><i class="bi bi-calendar-check"></i> 최근 업데이트</small>
										<small class="text-muted"><i class="bi bi-eye"></i> ${item.viewCnt}</small>
									</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
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