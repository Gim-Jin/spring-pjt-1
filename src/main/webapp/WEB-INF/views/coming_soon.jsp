<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSAFIT - ${title} 준비 중</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css");

        body {
            font-family: "Pretendard Variable", Pretendard, -apple-system,
                BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI",
                "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic",
                "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
            padding-top: 80px;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .coming-soon-container {
            text-align: center;
            padding: 5rem 0;
            flex: 1;
        }
        
        .coming-soon-icon {
            font-size: 6rem;
            color: #0d6efd;
            margin-bottom: 2rem;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.1);
                opacity: 0.8;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
        
        .coming-soon-title {
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: #212529;
        }
        
        .coming-soon-text {
            color: #6c757d;
            max-width: 600px;
            margin: 0 auto 2rem;
            line-height: 1.7;
        }
        
        .btn-subscribe {
            background-color: #0d6efd;
            color: white;
            border-radius: 50px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-subscribe:hover {
            background-color: #0b5ed7;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
            color: white;
        }
        
        .subscription-form {
            max-width: 500px;
            margin: 0 auto;
        }
        
        .form-control {
            border-radius: 50px;
            padding: 0.75rem 1.5rem;
            border: 1px solid #ced4da;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
            border-color: #86b7fe;
        }
        
        .btn-back {
            margin-top: 2rem;
        }
        
        .features-list {
            margin-top: 3rem;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
        }
        
        .feature-card {
            background-color: white;
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            width: 250px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }
        
        .feature-card:hover {
            transform: translateY(-10px);
        }
        
        .feature-icon {
            font-size: 2.5rem;
            color: #0d6efd;
            margin-bottom: 1rem;
        }
        
        .feature-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: #212529;
        }
        
        .feature-text {
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@ include file="/WEB-INF/header.jsp" %>
    
    <main class="coming-soon-container">
        <div class="container">
            <div class="coming-soon-icon">
                <i class="${icon}"></i>
            </div>
            <h1 class="coming-soon-title display-4">${title}는 준비 중입니다</h1>
            <p class="coming-soon-text lead">
                ${message}
                조금만 기다려주세요!
            </p>
            
            <div class="subscription-form mb-5">
                <form class="d-flex">
                    <input type="email" class="form-control me-2" placeholder="이메일을 입력하여 출시 소식 받기">
                    <button type="submit" class="btn btn-subscribe">구독하기</button>
                </form>
            </div>
            
            <a href="${pageContext.request.contextPath}/index" class="btn btn-outline-secondary btn-back">
                <i class="bi bi-arrow-left me-2"></i>홈으로 돌아가기
            </a>
            
            <c:if test="${type == 'community'}">
            <div class="features-list">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-chat-dots"></i>
                    </div>
                    <h4 class="feature-title">운동 토론</h4>
                    <p class="feature-text">다양한 운동 방법과 팁에 대해 토론하고 의견을 나눌 수 있는 포럼</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-trophy"></i>
                    </div>
                    <h4 class="feature-title">챌린지</h4>
                    <p class="feature-text">함께 도전하는 다양한 운동 챌린지로 동기부여 받기</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-people"></i>
                    </div>
                    <h4 class="feature-title">운동 메이트</h4>
                    <p class="feature-text">비슷한 목표를 가진 운동 파트너를 찾을 수 있는 매칭 시스템</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-graph-up"></i>
                    </div>
                    <h4 class="feature-title">성과 공유</h4>
                    <p class="feature-text">자신의 운동 성과와 변화를 기록하고 공유할 수 있는 공간</p>
                </div>
            </div>
            </c:if>
            
            <c:if test="${type == 'mypage'}">
            <div class="features-list">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-person-lines-fill"></i>
                    </div>
                    <h4 class="feature-title">프로필 관리</h4>
                    <p class="feature-text">개인 프로필 정보 설정 및 관리</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-activity"></i>
                    </div>
                    <h4 class="feature-title">활동 내역</h4>
                    <p class="feature-text">작성한 댓글과 참여한 활동 기록 확인</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-calendar-check"></i>
                    </div>
                    <h4 class="feature-title">운동 기록</h4>
                    <p class="feature-text">일별, 주별, 월별 운동 기록 및 통계 확인</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-gear"></i>
                    </div>
                    <h4 class="feature-title">계정 설정</h4>
                    <p class="feature-text">계정 보안 및 알림 설정 관리</p>
                </div>
            </div>
            </c:if>
            
            <c:if test="${type == 'favorites'}">
            <div class="features-list">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-collection-play"></i>
                    </div>
                    <h4 class="feature-title">찜한 영상</h4>
                    <p class="feature-text">사용자가 저장한 모든 영상을 한 곳에서 확인</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-folder"></i>
                    </div>
                    <h4 class="feature-title">맞춤 카테고리</h4>
                    <p class="feature-text">영상을 부위별, 난이도별로 분류하여 보관</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-clock-history"></i>
                    </div>
                    <h4 class="feature-title">시청 기록</h4>
                    <p class="feature-text">최근에 시청한 영상 기록 확인</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="bi bi-share"></i>
                    </div>
                    <h4 class="feature-title">공유 기능</h4>
                    <p class="feature-text">좋아하는 영상을 친구들과 쉽게 공유</p>
                </div>
            </div>
            </c:if>
        </div>
    </main>
    
    <!-- 푸터 포함 -->
    <%@ include file="/WEB-INF/footer.jsp" %>
    
    <!-- Bootstrap JS 및 Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 