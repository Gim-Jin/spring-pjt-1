<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<footer class="bg-dark text-white py-5 mt-5">
	<div class="container">
		<div class="row">
			<div class="col-md-4 mb-4 mb-md-0">
				<div class="d-flex align-items-center mb-3">
					<img src="${pageContext.request.contextPath}/assets/images/logo-white.png" alt="SSAFIT 로고" height="40" class="me-2">
					<h5 class="mb-0 text-white">SSAFIT</h5>
				</div>
				<p class="text-muted">당신의 건강한 라이프스타일을 위한<br>최고의 운동 플랫폼</p>
				<div class="social-icons mt-3">
					<a href="#" class="text-white me-3"><i class="bi bi-facebook fs-5"></i></a>
					<a href="#" class="text-white me-3"><i class="bi bi-instagram fs-5"></i></a>
					<a href="#" class="text-white me-3"><i class="bi bi-youtube fs-5"></i></a>
					<a href="#" class="text-white"><i class="bi bi-twitter-x fs-5"></i></a>
				</div>
			</div>
			<div class="col-md-2 mb-4 mb-md-0">
				<h6 class="text-uppercase mb-3">사이트맵</h6>
				<ul class="list-unstyled">
					<li class="mb-2"><a href="${pageContext.request.contextPath}/" class="text-muted text-decoration-none">홈</a></li>
					<li class="mb-2"><a href="${pageContext.request.contextPath}/video/list" class="text-muted text-decoration-none">운동 영상</a></li>
					<li class="mb-2"><a href="${pageContext.request.contextPath}/community" class="text-muted text-decoration-none">커뮤니티</a></li>
					<li><a href="${pageContext.request.contextPath}/about" class="text-muted text-decoration-none">소개</a></li>
				</ul>
			</div>
			<div class="col-md-2 mb-4 mb-md-0">
				<h6 class="text-uppercase mb-3">카테고리</h6>
				<ul class="list-unstyled">
					<li class="mb-2"><a href="${pageContext.request.contextPath}/video/list?part=상체" class="text-muted text-decoration-none">상체 운동</a></li>
					<li class="mb-2"><a href="${pageContext.request.contextPath}/video/list?part=하체" class="text-muted text-decoration-none">하체 운동</a></li>
					<li class="mb-2"><a href="${pageContext.request.contextPath}/video/list?part=전신" class="text-muted text-decoration-none">전신 운동</a></li>
					<li><a href="${pageContext.request.contextPath}/video/list?part=스트레칭" class="text-muted text-decoration-none">스트레칭</a></li>
				</ul>
			</div>
			<div class="col-md-2 mb-4 mb-md-0">
				<h6 class="text-uppercase mb-3">고객 지원</h6>
				<ul class="list-unstyled">
					<li class="mb-2"><a href="${pageContext.request.contextPath}/faq" class="text-muted text-decoration-none">자주 묻는 질문</a></li>
					<li class="mb-2"><a href="${pageContext.request.contextPath}/contact" class="text-muted text-decoration-none">문의하기</a></li>
					<li class="mb-2"><a href="${pageContext.request.contextPath}/terms" class="text-muted text-decoration-none">이용약관</a></li>
					<li><a href="${pageContext.request.contextPath}/privacy" class="text-muted text-decoration-none">개인정보처리방침</a></li>
				</ul>
			</div>
			<div class="col-md-2">
				<h6 class="text-uppercase mb-3">뉴스레터</h6>
				<p class="text-muted small">최신 운동 팁과 건강 정보를 받아보세요</p>
				<form action="${pageContext.request.contextPath}/newsletter/subscribe" method="post">
					<div class="input-group mb-3">
						<input type="email" class="form-control form-control-sm bg-dark text-white border-secondary" 
							   placeholder="이메일 주소" aria-label="Email" required>
						<button class="btn btn-outline-light btn-sm" type="submit">구독</button>
					</div>
				</form>
			</div>
		</div>
		<hr class="my-4 border-secondary">
		<div class="row align-items-center">
			<div class="col-md-6 text-center text-md-start">
				<p class="small text-muted mb-0">&copy; 2023 SSAFIT. All rights reserved.</p>
			</div>
			<div class="col-md-6 text-center text-md-end">
				<p class="small text-muted mb-0">
					<a href="${pageContext.request.contextPath}/terms" class="text-muted text-decoration-none me-3">이용약관</a>
					<a href="${pageContext.request.contextPath}/privacy" class="text-muted text-decoration-none">개인정보처리방침</a>
				</p>
			</div>
		</div>
	</div>
</footer>

<!-- Bootstrap JS와 의존성 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- 커스텀 스크립트 -->
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script> 