<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="jakarta.tags.core"%>
<!DOCTYPE html>
<header>
	<nav class="navbar navbar-expand-lg navbar-light bg-white py-3 fixed-top shadow-sm">
		<div class="container">
			<a class="navbar-brand fw-bold" href="index.jsp">
				<span class="text-primary">SSA</span><span class="text-dark">FIT</span>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">
					<li class="nav-item">
						<a class="nav-link fw-medium" href="index.jsp">
							<i class="bi bi-house-door"></i> 홈
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link fw-medium" href="#exercise-section">
							<i class="bi bi-activity"></i> 운동
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link fw-medium" href="#">
							<i class="bi bi-people"></i> 커뮤니티
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link fw-medium" href="#">
							<i class="bi bi-question-circle"></i> 도움말
						</a>
					</li>
				</ul>
				
				<form class="d-flex mx-auto me-2">
					<div class="input-group">
						<input class="form-control" type="search" placeholder="운동 영상 검색" aria-label="Search">
						<button class="btn btn-outline-primary" type="submit">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</form>
				
				<ul class="navbar-nav ms-auto">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<li class="nav-item">
								<a class="nav-link fw-medium" href="#">
									<i class="bi bi-person-plus"></i> 회원가입
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link fw-medium" href="#">
									<i class="bi bi-box-arrow-in-right"></i> 로그인
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									<i class="bi bi-person-circle"></i> ${sessionScope.user.name}님
								</a>
								<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item" href="#"><i class="bi bi-person"></i> 마이페이지</a></li>
									<li><a class="dropdown-item" href="#"><i class="bi bi-heart"></i> 찜한 영상</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#"><i class="bi bi-box-arrow-right"></i> 로그아웃</a></li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</header>