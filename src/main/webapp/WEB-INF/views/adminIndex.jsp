<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSAFIT - 관리자 대시보드</title>
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
            background-color: #f8f9fa;
        }

        .admin-sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background-color: #212529;
            color: #f8f9fa;
            padding-top: 20px;
            z-index: 1000;
            transition: all 0.3s;
        }

        .admin-logo {
            padding: 15px 20px;
            border-bottom: 1px solid #343a40;
            margin-bottom: 20px;
        }

        .admin-logo h3 {
            color: #fff;
            font-weight: 700;
            margin: 0;
        }

        .admin-logo span {
            color: #dc3545;
        }

        .admin-nav {
            padding: 0;
            list-style: none;
        }

        .admin-nav-item {
            margin-bottom: 5px;
        }

        .admin-nav-link {
            display: flex;
            align-items: center;
            padding: 10px 20px;
            color: #adb5bd;
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }

        .admin-nav-link:hover, .admin-nav-link.active {
            color: #fff;
            background-color: #343a40;
            border-left-color: #dc3545;
        }

        .admin-nav-link i {
            margin-right: 10px;
            font-size: 1.1rem;
        }

        .admin-nav-divider {
            height: 1px;
            margin: 15px 20px;
            background-color: #343a40;
        }

        .admin-content {
            margin-left: 250px;
            padding: 20px;
            transition: all 0.3s;
        }

        .admin-header {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            padding: 15px 20px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-title {
            font-weight: 700;
            margin: 0;
        }

        .admin-user-info {
            display: flex;
            align-items: center;
        }

        .admin-user-img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #6c757d;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            font-weight: 700;
            margin-right: 10px;
        }

        .admin-user-name {
            font-weight: 600;
        }

        .admin-user-role {
            color: #6c757d;
            font-size: 0.875rem;
        }

        .admin-card {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            margin-bottom: 20px;
            overflow: hidden;
        }

        .admin-card-header {
            background-color: #f8f9fa;
            padding: 15px 20px;
            border-bottom: 1px solid #dee2e6;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .admin-card-body {
            padding: 20px;
        }

        .admin-dashboard-numbers {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .admin-dashboard-item {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            padding: 20px;
            display: flex;
            align-items: center;
            transition: all 0.3s;
        }

        .admin-dashboard-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }

        .admin-dashboard-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-right: 15px;
            color: #fff;
        }

        .admin-dashboard-info {
            flex: 1;
        }

        .admin-dashboard-number {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .admin-dashboard-label {
            color: #6c757d;
            font-size: 0.875rem;
        }

        .admin-recent-table {
            width: 100%;
        }

        .admin-recent-table th {
            padding: 10px;
            background-color: #f8f9fa;
            font-weight: 600;
        }

        .admin-recent-table td {
            padding: 12px 10px;
            border-bottom: 1px solid #dee2e6;
        }

        .admin-recent-table tr:last-child td {
            border-bottom: none;
        }

        .admin-recent-table .badge {
            font-weight: 500;
            padding: 5px 10px;
        }

        .admin-footer {
            margin-left: 250px;
            background-color: #fff;
            padding: 15px 20px;
            text-align: center;
            color: #6c757d;
            font-size: 0.875rem;
            border-top: 1px solid #dee2e6;
        }

        .admin-btn {
            display: inline-flex;
            align-items: center;
            padding: 8px 15px;
            border-radius: 5px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s;
        }

        .admin-btn-primary {
            background-color: #0d6efd;
            color: #fff;
            border: none;
        }

        .admin-btn-primary:hover {
            background-color: #0a58ca;
            color: #fff;
        }

        .admin-btn-danger {
            background-color: #dc3545;
            color: #fff;
            border: none;
        }

        .admin-btn-danger:hover {
            background-color: #c82333;
            color: #fff;
        }

        .admin-btn i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <!-- 사이드바 -->
    <div class="admin-sidebar">
        <div class="admin-logo">
            <h3><span>SSA</span>FIT</h3>
        </div>
        
        <ul class="admin-nav">
            <li class="admin-nav-item">
                <a href="${pageContext.request.contextPath}/admin/index" class="admin-nav-link active">
                    <i class="bi bi-speedometer2"></i> 대시보드
                </a>
            </li>
            <li class="admin-nav-item">
                <a href="${pageContext.request.contextPath}/admin/users" class="admin-nav-link">
                    <i class="bi bi-people"></i> 회원 관리
                </a>
            </li>
            <li class="admin-nav-item">
                <a href="${pageContext.request.contextPath}/admin/articles" class="admin-nav-link">
                    <i class="bi bi-film"></i> 운동 영상 관리
                </a>
            </li>
            <li class="admin-nav-item">
                <a href="#" class="admin-nav-link">
                    <i class="bi bi-chat-left-text"></i> 댓글 관리
                </a>
            </li>
            
            <div class="admin-nav-divider"></div>
            
            <li class="admin-nav-item">
                <a href="#" class="admin-nav-link">
                    <i class="bi bi-gear"></i> 설정
                </a>
            </li>
            <li class="admin-nav-item">
                <a href="${pageContext.request.contextPath}/admin/logout" class="admin-nav-link">
                    <i class="bi bi-box-arrow-right"></i> 로그아웃
                </a>
            </li>
        </ul>
    </div>
    
    <!-- 메인 컨텐츠 -->
    <div class="admin-content">
        <div class="admin-header">
            <h4 class="admin-title">관리자 대시보드</h4>
            <div class="admin-user-info">
                <div class="admin-user-img">A</div>
                <div>
                    <div class="admin-user-name">관리자</div>
                    <div class="admin-user-role">최고 관리자</div>
                </div>
            </div>
        </div>
        
        <div class="admin-dashboard-numbers">
            <div class="admin-dashboard-item">
                <div class="admin-dashboard-icon" style="background-color: #0d6efd;">
                    <i class="bi bi-people-fill"></i>
                </div>
                <div class="admin-dashboard-info">
                    <div class="admin-dashboard-number">150</div>
                    <div class="admin-dashboard-label">총 회원 수</div>
                </div>
            </div>
            
            <div class="admin-dashboard-item">
                <div class="admin-dashboard-icon" style="background-color: #dc3545;">
                    <i class="bi bi-film"></i>
                </div>
                <div class="admin-dashboard-info">
                    <div class="admin-dashboard-number">48</div>
                    <div class="admin-dashboard-label">총 영상 수</div>
                </div>
            </div>
            
            <div class="admin-dashboard-item">
                <div class="admin-dashboard-icon" style="background-color: #198754;">
                    <i class="bi bi-chat-left-text-fill"></i>
                </div>
                <div class="admin-dashboard-info">
                    <div class="admin-dashboard-number">284</div>
                    <div class="admin-dashboard-label">총 댓글 수</div>
                </div>
            </div>
            
            <div class="admin-dashboard-item">
                <div class="admin-dashboard-icon" style="background-color: #6c757d;">
                    <i class="bi bi-eye-fill"></i>
                </div>
                <div class="admin-dashboard-info">
                    <div class="admin-dashboard-number">12.5K</div>
                    <div class="admin-dashboard-label">총 조회수</div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-lg-6">
                <div class="admin-card">
                    <div class="admin-card-header">
                        <span>최근 가입 회원</span>
                        <a href="${pageContext.request.contextPath}/admin/users" class="admin-btn admin-btn-primary">
                            <i class="bi bi-people"></i> 회원 관리
                        </a>
                    </div>
                    <div class="admin-card-body">
                        <table class="admin-recent-table">
                            <thead>
                                <tr>
                                    <th>이름</th>
                                    <th>이메일</th>
                                    <th>등록일</th>
                                    <th>관리</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>홍길동</td>
                                    <td>hong@example.com</td>
                                    <td>2023-05-15</td>
                                    <td>
                                        <a href="#" class="text-primary me-2"><i class="bi bi-pencil-square"></i></a>
                                        <a href="#" class="text-danger"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>김철수</td>
                                    <td>kim@example.com</td>
                                    <td>2023-05-14</td>
                                    <td>
                                        <a href="#" class="text-primary me-2"><i class="bi bi-pencil-square"></i></a>
                                        <a href="#" class="text-danger"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>이영희</td>
                                    <td>lee@example.com</td>
                                    <td>2023-05-13</td>
                                    <td>
                                        <a href="#" class="text-primary me-2"><i class="bi bi-pencil-square"></i></a>
                                        <a href="#" class="text-danger"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>박지민</td>
                                    <td>park@example.com</td>
                                    <td>2023-05-12</td>
                                    <td>
                                        <a href="#" class="text-primary me-2"><i class="bi bi-pencil-square"></i></a>
                                        <a href="#" class="text-danger"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>정민수</td>
                                    <td>jung@example.com</td>
                                    <td>2023-05-11</td>
                                    <td>
                                        <a href="#" class="text-primary me-2"><i class="bi bi-pencil-square"></i></a>
                                        <a href="#" class="text-danger"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-6">
                <div class="admin-card">
                    <div class="admin-card-header">
                        <span>최근 등록된 영상</span>
                        <a href="${pageContext.request.contextPath}/admin/articles" class="admin-btn admin-btn-primary">
                            <i class="bi bi-film"></i> 영상 관리
                        </a>
                    </div>
                    <div class="admin-card-body">
                        <table class="admin-recent-table">
                            <thead>
                                <tr>
                                    <th>제목</th>
                                    <th>부위</th>
                                    <th>등록일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>초보자를 위한 전신 운동</td>
                                    <td><span class="badge bg-primary">전신</span></td>
                                    <td>2023-05-15</td>
                                    <td>1,546</td>
                                </tr>
                                <tr>
                                    <td>확실한 복근 만들기</td>
                                    <td><span class="badge bg-success">복부</span></td>
                                    <td>2023-05-14</td>
                                    <td>2,210</td>
                                </tr>
                                <tr>
                                    <td>상체 근력 강화 운동</td>
                                    <td><span class="badge bg-info">상체</span></td>
                                    <td>2023-05-13</td>
                                    <td>1,890</td>
                                </tr>
                                <tr>
                                    <td>하체 집중 트레이닝</td>
                                    <td><span class="badge bg-warning">하체</span></td>
                                    <td>2023-05-12</td>
                                    <td>1,357</td>
                                </tr>
                                <tr>
                                    <td>다이어트를 위한 유산소 운동</td>
                                    <td><span class="badge bg-danger">전신</span></td>
                                    <td>2023-05-11</td>
                                    <td>2,456</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="admin-card">
            <div class="admin-card-header">
                <span>사이트 통계</span>
                <a href="#" class="admin-btn admin-btn-primary">
                    <i class="bi bi-graph-up"></i> 상세 통계
                </a>
            </div>
            <div class="admin-card-body">
                <canvas id="statisticsChart" height="100"></canvas>
            </div>
        </div>
        
        <div class="admin-card">
            <div class="admin-card-header">
                <span>빠른 작업</span>
            </div>
            <div class="admin-card-body">
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <a href="${pageContext.request.contextPath}/admin/articles/registform" class="btn btn-outline-primary w-100 d-flex flex-column align-items-center p-3">
                            <i class="bi bi-plus-circle mb-2" style="font-size: 2rem;"></i>
                            <span>영상 등록</span>
                        </a>
                    </div>
                    <div class="col-md-3 mb-3">
                        <a href="#" class="btn btn-outline-success w-100 d-flex flex-column align-items-center p-3">
                            <i class="bi bi-people mb-2" style="font-size: 2rem;"></i>
                            <span>사용자 관리</span>
                        </a>
                    </div>
                    <div class="col-md-3 mb-3">
                        <a href="#" class="btn btn-outline-info w-100 d-flex flex-column align-items-center p-3">
                            <i class="bi bi-chat-dots mb-2" style="font-size: 2rem;"></i>
                            <span>댓글 관리</span>
                        </a>
                    </div>
                    <div class="col-md-3 mb-3">
                        <a href="#" class="btn btn-outline-secondary w-100 d-flex flex-column align-items-center p-3">
                            <i class="bi bi-gear mb-2" style="font-size: 2rem;"></i>
                            <span>사이트 설정</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="admin-footer">
        &copy; 2025 SSAFY 13 Daejeon class 3 Kim Square. All Rights Reserved.
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // 차트 초기화
        const ctx = document.getElementById('statisticsChart').getContext('2d');
        const statisticsChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
                datasets: [
                    {
                        label: '신규 회원',
                        data: [12, 19, 15, 28, 25, 30],
                        backgroundColor: 'rgba(13, 110, 253, 0.2)',
                        borderColor: 'rgba(13, 110, 253, 1)',
                        borderWidth: 2,
                        tension: 0.3
                    },
                    {
                        label: '방문자 수',
                        data: [50, 65, 60, 120, 150, 180],
                        backgroundColor: 'rgba(220, 53, 69, 0.2)',
                        borderColor: 'rgba(220, 53, 69, 1)',
                        borderWidth: 2,
                        tension: 0.3
                    },
                    {
                        label: '영상 조회수',
                        data: [300, 450, 380, 650, 830, 1200],
                        backgroundColor: 'rgba(25, 135, 84, 0.2)',
                        borderColor: 'rgba(25, 135, 84, 1)',
                        borderWidth: 2,
                        tension: 0.3
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'top',
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>
</html> 