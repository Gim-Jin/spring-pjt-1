<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSAFIT - 건강한 삶을 위한 운동 플랫폼</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
            background-size: cover;
            background-position: center;
            height: 80vh;
            display: flex;
            align-items: center;
            color: white;
        }
        
        .category-card {
            transition: transform 0.3s ease;
            cursor: pointer;
            height: 100%;
        }
        
        .category-card:hover {
            transform: translateY(-10px);
        }
        
        .video-card {
            transition: transform 0.3s ease;
        }
        
        .video-card:hover {
            transform: scale(1.03);
        }
        
        .video-card img {
            height: 180px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@ include file="/WEB-INF/header.jsp" %>
    
    <!-- 메인 영역 -->
    <main>
        <!-- 히어로 섹션 -->
        <section class="hero-section">
            <div class="container text-center">
                <h1 class="display-3 fw-bold mb-3">건강한 삶을 위한 첫 걸음</h1>
                <p class="lead mb-4">SSAFIT과 함께 운동하고 더 나은 삶을 경험하세요.</p>
                <div class="d-flex justify-content-center">
                    <a href="#exercise-section" class="btn btn-primary me-2 px-4 py-2">운동 시작하기</a>
                </div>
            </div>
        </section>
        
        <!-- 운동 카테고리 섹션 -->
        <section id="exercise-section" class="py-5 bg-light">
            <div class="container">
                <h2 class="text-center mb-5">운동 카테고리</h2>
                <div class="row g-4">
                    <!-- 상체 운동 -->
                    <div class="col-md-4">
                        <div class="card category-card shadow-sm">
                            <div class="card-body text-center p-4">
                                <div class="mb-3">
                                    <i class="bi bi-diamond-half text-primary" style="font-size: 3rem;"></i>
                                </div>
                                <h4 class="card-title">상체 운동</h4>
                                <p class="card-text text-muted">팔, 가슴, 어깨, 등을 강화하는 운동</p>
                                <a href="/video/list?category=상체" class="btn btn-outline-primary mt-3">영상 보기</a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 하체 운동 -->
                    <div class="col-md-4">
                        <div class="card category-card shadow-sm">
                            <div class="card-body text-center p-4">
                                <div class="mb-3">
                                    <i class="bi bi-diamond text-primary" style="font-size: 3rem;"></i>
                                </div>
                                <h4 class="card-title">하체 운동</h4>
                                <p class="card-text text-muted">다리, 엉덩이, 허벅지를 강화하는 운동</p>
                                <a href="/video/list?category=하체" class="btn btn-outline-primary mt-3">영상 보기</a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 전신 운동 -->
                    <div class="col-md-4">
                        <div class="card category-card shadow-sm">
                            <div class="card-body text-center p-4">
                                <div class="mb-3">
                                    <i class="bi bi-diamond-fill text-primary" style="font-size: 3rem;"></i>
                                </div>
                                <h4 class="card-title">전신 운동</h4>
                                <p class="card-text text-muted">전신 근육을 강화하는 종합적인 운동</p>
                                <a href="/video/list?category=전신" class="btn btn-outline-primary mt-3">영상 보기</a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 유산소 운동 -->
                    <div class="col-md-6">
                        <div class="card category-card shadow-sm">
                            <div class="card-body text-center p-4">
                                <div class="mb-3">
                                    <i class="bi bi-heart-pulse text-danger" style="font-size: 3rem;"></i>
                                </div>
                                <h4 class="card-title">유산소 운동</h4>
                                <p class="card-text text-muted">심폐 기능을 향상시키고 체지방을 줄이는 운동</p>
                                <a href="/video/list?category=유산소" class="btn btn-outline-primary mt-3">영상 보기</a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 스트레칭 -->
                    <div class="col-md-6">
                        <div class="card category-card shadow-sm">
                            <div class="card-body text-center p-4">
                                <div class="mb-3">
                                    <i class="bi bi-wind text-info" style="font-size: 3rem;"></i>
                                </div>
                                <h4 class="card-title">스트레칭</h4>
                                <p class="card-text text-muted">유연성을 높이고 근육 통증을 완화하는 운동</p>
                                <a href="/video/list?category=스트레칭" class="btn btn-outline-primary mt-3">영상 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 인기 영상 섹션 -->
        <section class="py-5">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>인기 영상</h2>
                    <a href="/video/list" class="btn btn-outline-primary">모든 영상 보기</a>
                </div>
                
                <div class="row g-4">
                    <!-- 인기 영상 카드 1 -->
                    <c:forEach var="article" items="${articles }">
                    <div class="col-md-4">
                        <div class="card video-card shadow-sm h-100">
                        
                            <img src="https://img.youtube.com/vi/${article.videoArticleUrl }/mqdefault.jpg" class="card-img-top" alt="전신 다이어트 최고의 운동">
                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-2">
                                    <span class="badge bg-primary">${article.videoArticlePart }</span>
                                    <small class="text-muted"><i class="bi bi-eye"></i>${article.videoArticleViews }</small>
                                </div>
                                <h5 class="card-title">${article.videoArticleTitle }</h5>
                    
                            </div>
                            <div class="card-footer bg-white">
                                <a href="/articles/${article.videoArticleId }" class="btn btn-sm btn-primary w-100">영상 보기</a>
                            </div>
                        </div>
                    </div>
                   </c:forEach>
                
                    
               
                </div>
                
            </div>
       
        </section>
        
        <!-- 커뮤니티 섹션 -->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <h2 class="mb-3">함께 운동하는 즐거움</h2>
                        <p class="lead mb-4">SSAFIT 커뮤니티에서 다양한 사람들과 운동 경험을 공유하세요.</p>
                        <ul class="list-unstyled mb-4">
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-primary me-2"></i> 운동 후기와 팁 공유</li>
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-primary me-2"></i> 함께하는 챌린지 참여</li>
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-primary me-2"></i> 효과적인 운동 루틴 찾기</li>
                            <li><i class="bi bi-check-circle-fill text-primary me-2"></i> 건강한 생활 습관 형성</li>
                        </ul>
                        <a href="${pageContext.request.contextPath}/community" class="btn btn-primary px-4">커뮤니티 방문하기</a>
                    </div>
                    <div class="col-lg-6 mt-4 mt-lg-0">
                        <img src="https://images.unsplash.com/photo-1593079831268-3381b0db4a77?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1450&q=80" 
                             class="img-fluid rounded shadow-lg" alt="커뮤니티 이미지">
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    <!-- 푸터 포함 -->
    <%@ include file="/WEB-INF/footer.jsp" %>
    
    <!-- Bootstrap JS 및 Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 