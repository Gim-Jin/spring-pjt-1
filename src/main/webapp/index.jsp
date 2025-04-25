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
<title>SSAFIT</title>
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
	/* 어두운 배경 */
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
	transition: transform 0.3s ease-in-out;
	width: 300px;
}

.service-card:hover {
	transform: translateY(-10px);
}

.filter-buttons {
	margin-bottom: 20px;
	text-align: center;
}

.filter-buttons button {
	margin: 5px;
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
	/* 카드 간격 */
	overflow-x: scroll;
	scroll-behavior: smooth;
	padding: 10px;
}

.card-container::-webkit-scrollbar {
	display: none;
	/* 스크롤바 숨기기 */
}

.card {
	width: 300px;
	/* 카드 너비 통일 */
	height: 300px;
	/* 카드 높이 통일 */
	background: white;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	/* 그림자 효과 */
	overflow: hidden;
	flex-shrink: 0;
}

.card img {
	width: 100%;
	height: 150px;
	object-fit: cover;
	/* 이미지 비율 유지하면서 채우기 */
}

.card-body {
	padding: 10px;
	text-align: center;
}

.slider-btn {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background: rgba(0, 0, 0, 0.6);
	color: white;
	border: none;
	padding: 10px 15px;
	cursor: pointer;
	border-radius: 50%;
	z-index: 10;
}

.slider-btn.left {
	left: 5px;
}

.slider-btn.right {
	right: 5px;
}
</style>
</head>

<body>
	<%@ include file="header.jsp"%>

	<section id="heroCarousel" class="carousel slide carousel-fade"
		data-bs-ride="carousel">
		<!-- 인디케이터 (버튼) -->
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
			<!-- 슬라이드 1 -->
			<div class="carousel-item active">
				<div class="hero-slide"
					style="background-image: url('https://gymgear.com/wp-content/uploads/2023/08/The-Gym-Pump-scaled.jpeg');">
					<div class="carousel-overlay"></div>
					<div class="container hero-content">
						<h1>코딩 핑계로 운동을 게을리 하신다고요?</h1>
						<p class="lead">제가 보기엔 코딩도 그렇게 열심히 하는 것 같지는 않은데요.</p>
						<a href="index.jsp" class="btn btn-primary btn-lg">운동하기</a>
					</div>
				</div>
			</div>

			<!-- 슬라이드 2 -->
			<div class="carousel-item">
				<div class="hero-slide"
					style="background-image: url('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGhlJTIwZ3ltfGVufDB8fDB8fHww');">
					<div class="carousel-overlay"></div>
					<div class="container hero-content">
						<h1>코딩도 체력이 있어야 할 수 있어요.</h1>
						<p class="lead">꾸준히 운동을 하다보면 코딩 체력도 늘거에요.</p>
						<a href="index.jsp" class="btn btn-primary btn-lg">시작하기</a>
					</div>
				</div>
			</div>

			<!-- 슬라이드 3 -->
			<div class="carousel-item">
				<div class="hero-slide"
					style="background-image: url('https://images.squarespace-cdn.com/content/v1/644927389a1ab06f2f12a9fe/d2cef23b-98a3-4e23-9835-e24209de58f5/IMG_4073.jpg');">
					<div class="carousel-overlay"></div>
					<div class="container hero-content">
						<h1>SSAFIT과 함께하는 운동이 더 즐겁다!</h1>
						<p class="lead">SSAFIT과 함께 건강한 코딩 생활을 만들어가요.</p>
						<a href="index.jsp" class="btn btn-primary btn-lg">함께하기</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 이전/다음 버튼 -->
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

	<section class="py-5">
		<div class="container">
			<h2 class="text-center mb-4">운동 부위 선택</h2>
			<p class="text-center mb-4">본인이 강화하고 싶은 부위를 선택해 보세요.</p>
			<div class="filter-buttons">
				<button class="btn btn-outline-primary"
					onclick="filterSelection('all')">전체</button>
				<button class="btn btn-outline-primary"
					onclick="filterSelection('전신')">전신</button>
				<button class="btn btn-outline-primary"
					onclick="filterSelection('상체')">상체</button>
				<button class="btn btn-outline-primary"
					onclick="filterSelection('하체')">하체</button>
				<button class="btn btn-outline-primary"
					onclick="filterSelection('복부')">코어</button>
			</div>
			<div class="slider-container">
				<button class="slider-btn left" onclick="scrollLeftAct()">&#10094;</button>
				<div class="card-container">
					<c:forEach var="item" items="${sessionScope.videoList}"
						varStatus="status">

						<c:set var="videoId"
							value="${fn:substringAfter(item.url, '/embed/')}" />
						<c:set var="thumbnailUrl"
							value="https://img.youtube.com/vi/${videoId}/maxresdefault.jpg" />

						<a href="main?action=detail&id=${status.count}" target="_self">
							<div class="card service-card ${item.part}">
								<img src="${thumbnailUrl}" class="card-img-top"
									alt="YouTube Thumbnail">
								<div class="card-body text-center">
									<h5 class="card-title">${item.part}</h5>
									<p class="card-text">${item.title}</p>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
				<button class="slider-btn right" onclick="scrollRightAct()">&#10095;</button>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>

	<!-- 그래도 기본 애니메이션이 궁금해서 물어본 JS스크립트^^ -->
	<script>


    setInterval(changeBackground, 5000); // 5초마다 변경

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
  </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>