<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SSAFIT - 건강한 삶을 위한 운동 영상 플랫폼</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('${pageContext.request.contextPath}/assets/images/hero-bg.jpg') center/cover no-repeat;
            height: 500px;
        }
        .video-card {
            transition: transform 0.3s;
        }
        .video-card:hover {
            transform: translateY(-5px);
        }
        .feature-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <!-- 헤더 include -->
    <jsp:include page="header.jsp" />

    <!-- 히어로 섹션 -->
    <section class="hero-section d-flex align-items-center text-white">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-4">당신의 건강한 삶을 위한 최고의 선택</h1>
            <p class="lead mb-5">SSAFIT과 함께 전문적인 운동 영상으로 건강한 라이프스타일을 만들어보세요</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="${pageContext.request.contextPath}/video/list" class="btn btn-primary btn-lg">운동 시작하기</a>
                <a href="${pageContext.request.contextPath}/user/register" class="btn btn-outline-light btn-lg">회원가입</a>
            </div>
        </div>
    </section>

    <!-- 인기 영상 섹션 -->
    <section class="py-5">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold">인기 운동 영상</h2>
                <a href="${pageContext.request.contextPath}/video/list" class="btn btn-outline-primary">전체보기</a>
            </div>
            
            <div class="row g-4">
                <c:choose>
                    <c:when test="${not empty popularVideos}">
                        <c:forEach items="${popularVideos}" var="video">
                            <div class="col-lg-3 col-md-6">
                                <div class="card h-100 shadow-sm video-card">
                                    <a href="${pageContext.request.contextPath}/video/detail/${video.videoId}">
                                        <img src="https://img.youtube.com/vi/${video.youtubeId}/mqdefault.jpg" class="card-img-top" alt="${video.title}">
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title">${video.title}</h5>
                                        <p class="card-text text-muted small">${video.channelName}</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <span class="badge bg-primary">${video.part}</span>
                                            <div class="text-muted small">
                                                <i class="bi bi-eye"></i> ${video.viewCnt}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <!-- 샘플 데이터 (비디오 데이터가 없을 경우) -->
                        <div class="col-lg-3 col-md-6">
                            <div class="card h-100 shadow-sm video-card">
                                <img src="https://img.youtube.com/vi/2pLT-olgUJs/mqdefault.jpg" class="card-img-top" alt="상체 운동">
                                <div class="card-body">
                                    <h5 class="card-title">15분 상체 덤벨 운동</h5>
                                    <p class="card-text text-muted small">Fitness Channel</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge bg-primary">상체</span>
                                        <div class="text-muted small">
                                            <i class="bi bi-eye"></i> 1.2K
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card h-100 shadow-sm video-card">
                                <img src="https://img.youtube.com/vi/swRNeYw1JkY/mqdefault.jpg" class="card-img-top" alt="전신 유산소">
                                <div class="card-body">
                                    <h5 class="card-title">20분 전신 유산소 운동</h5>
                                    <p class="card-text text-muted small">Home Workout</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge bg-primary">전신</span>
                                        <div class="text-muted small">
                                            <i class="bi bi-eye"></i> 3.4K
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card h-100 shadow-sm video-card">
                                <img src="https://img.youtube.com/vi/EGhN7EDBVpQ/mqdefault.jpg" class="card-img-top" alt="하체 운동">
                                <div class="card-body">
                                    <h5 class="card-title">하체 근력 강화 운동</h5>
                                    <p class="card-text text-muted small">Strength Training</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge bg-primary">하체</span>
                                        <div class="text-muted small">
                                            <i class="bi bi-eye"></i> 2.8K
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card h-100 shadow-sm video-card">
                                <img src="https://img.youtube.com/vi/foMQX9ZExsE/mqdefault.jpg" class="card-img-top" alt="스트레칭">
                                <div class="card-body">
                                    <h5 class="card-title">10분 전신 스트레칭</h5>
                                    <p class="card-text text-muted small">Daily Stretch</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge bg-primary">스트레칭</span>
                                        <div class="text-muted small">
                                            <i class="bi bi-eye"></i> 4.5K
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>
    
    <!-- 카테고리 섹션 -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center fw-bold mb-5">카테고리별 운동</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/video/list?part=상체" class="text-decoration-none">
                        <div class="card border-0 bg-primary text-white text-center p-4 h-100">
                            <div class="card-body">
                                <i class="bi bi-lightning-charge-fill display-1 mb-3"></i>
                                <h3 class="card-title">상체 운동</h3>
                                <p class="card-text">등, 가슴, 어깨 등 상체 근육을 타겟으로 하는 운동</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/video/list?part=하체" class="text-decoration-none">
                        <div class="card border-0 bg-success text-white text-center p-4 h-100">
                            <div class="card-body">
                                <i class="bi bi-lightning-fill display-1 mb-3"></i>
                                <h3 class="card-title">하체 운동</h3>
                                <p class="card-text">다리, 허벅지, 종아리 근육을 강화하는 운동</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/video/list?part=전신" class="text-decoration-none">
                        <div class="card border-0 bg-danger text-white text-center p-4 h-100">
                            <div class="card-body">
                                <i class="bi bi-person-fill display-1 mb-3"></i>
                                <h3 class="card-title">전신 운동</h3>
                                <p class="card-text">전신 근육을 고르게 발달시키는 통합 운동</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/video/list?part=스트레칭" class="text-decoration-none">
                        <div class="card border-0 bg-info text-white text-center p-4 h-100">
                            <div class="card-body">
                                <i class="bi bi-hearts display-1 mb-3"></i>
                                <h3 class="card-title">스트레칭</h3>
                                <p class="card-text">유연성을 높이고 근육의 피로를 풀어주는 스트레칭</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 소개 섹션 -->
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <h2 class="fw-bold mb-4">SSAFIT이란?</h2>
                    <p class="lead mb-4">SSAFIT은 건강한 삶을 위한 최고의 운동 영상 플랫폼입니다.</p>
                    <p class="mb-4">언제 어디서나 접근 가능한 고품질의 운동 영상을 통해 전문가의 지도 아래 효과적인 운동을 할 수 있습니다. 다양한 운동 카테고리와 난이도로 초보자부터 전문가까지 모두에게 적합한 컨텐츠를 제공합니다.</p>
                    <div class="row g-4 mt-3">
                        <div class="col-md-6">
                            <div class="d-flex">
                                <div class="feature-icon bg-primary text-white me-3">
                                    <i class="bi bi-camera-video-fill fs-3"></i>
                                </div>
                                <div>
                                    <h5>고품질 영상</h5>
                                    <p class="text-muted">전문가가 제작한 고품질 운동 영상</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex">
                                <div class="feature-icon bg-success text-white me-3">
                                    <i class="bi bi-people-fill fs-3"></i>
                                </div>
                                <div>
                                    <h5>커뮤니티</h5>
                                    <p class="text-muted">운동 동료들과 함께하는 커뮤니티</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex">
                                <div class="feature-icon bg-warning text-white me-3">
                                    <i class="bi bi-graph-up-arrow fs-3"></i>
                                </div>
                                <div>
                                    <h5>운동 기록</h5>
                                    <p class="text-muted">나만의 운동 기록 관리</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="d-flex">
                                <div class="feature-icon bg-info text-white me-3">
                                    <i class="bi bi-award-fill fs-3"></i>
                                </div>
                                <div>
                                    <h5>인증된 트레이너</h5>
                                    <p class="text-muted">전문 트레이너의 검증된 운동법</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="ratio ratio-16x9 shadow-lg rounded overflow-hidden">
                        <iframe src="https://www.youtube.com/embed/gMaB-fG4u4g" title="SSAFIT 소개 영상" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- 푸터 include -->
    <jsp:include page="footer.jsp" />
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 