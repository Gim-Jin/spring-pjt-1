<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<header class="sticky-top">
	<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
		<div class="container">
			<a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}/">
				<img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="SSAFIT 로고" height="40" class="me-2">
				<span class="fw-bold text-primary fs-4">SSAFIT</span>
			</a>
			
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/">홈</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/video/list">운동 영상</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
						   data-bs-toggle="dropdown" aria-expanded="false">
							카테고리
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/video/list?part=상체">상체 운동</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/video/list?part=하체">하체 운동</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/video/list?part=전신">전신 운동</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/video/list?part=스트레칭">스트레칭</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/community">커뮤니티</a>
					</li>
				</ul>
				
				<form class="d-flex mx-auto" action="${pageContext.request.contextPath}/video/search" method="GET">
					<div class="input-group">
						<input class="form-control" type="search" name="keyword" placeholder="운동 영상 검색" aria-label="Search">
						<button class="btn btn-outline-primary" type="submit">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</form>
				
				<div class="d-flex align-items-center ms-lg-3 mt-3 mt-lg-0">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<a href="${pageContext.request.contextPath}/user/login" class="btn btn-outline-primary me-2">로그인</a>
							<a href="${pageContext.request.contextPath}/user/register" class="btn btn-primary">회원가입</a>
						</c:when>
						<c:otherwise>
							<div class="dropdown me-3">
								<a class="text-decoration-none dropdown-toggle" href="#" role="button" id="userDropdown" 
								   data-bs-toggle="dropdown" aria-expanded="false">
									<i class="bi bi-person-circle fs-5 me-1"></i>
									<span>${sessionScope.user.username}</span>
								</a>
								<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
									<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/mypage">마이페이지</a></li>
									<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/history">운동 기록</a></li>
									<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/favorites">즐겨찾기</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</nav>
</header> 