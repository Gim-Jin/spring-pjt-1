<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSAFIT - 운동 영상 등록</title>
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
        }

        .admin-card-body {
            padding: 20px;
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

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .video-preview {
            margin-top: 20px;
            position: relative;
            padding-bottom: 56.25%; /* 16:9 비율 */
            height: 0;
            overflow: hidden;
            border-radius: 5px;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
            display: none;
        }

        .video-preview iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 0;
        }

        .video-preview-placeholder {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #e9ecef;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color: #6c757d;
        }

        .video-preview-placeholder i {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .btn-admin-submit {
            background-color: #0d6efd;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-admin-submit:hover {
            background-color: #0a58ca;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
        }

        .btn-admin-cancel {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-admin-cancel:hover {
            background-color: #5a6268;
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
                <a href="${pageContext.request.contextPath}/admin/index" class="admin-nav-link">
                    <i class="bi bi-speedometer2"></i> 대시보드
                </a>
            </li>
            <li class="admin-nav-item">
                <a href="${pageContext.request.contextPath}/admin/users" class="admin-nav-link">
                    <i class="bi bi-people"></i> 회원 관리
                </a>
            </li>
            <li class="admin-nav-item">
                <a href="${pageContext.request.contextPath}/admin/articles" class="admin-nav-link active">
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
            <h4 class="admin-title">운동 영상 등록</h4>
            <div class="admin-user-info">
                <div class="admin-user-img">A</div>
                <div>
                    <div class="admin-user-name">관리자</div>
                    <div class="admin-user-role">최고 관리자</div>
                </div>
            </div>
        </div>
        
        <div class="admin-card">
            <div class="admin-card-header">
                운동 영상 정보 입력
            </div>
            <div class="admin-card-body">
                <form action="/admin/articles/regist" method="post" id="videoForm">
                    <div class="form-group">
                        <label for="title" class="form-label">영상 제목</label>
                        <input type="text" class="form-control" id="title" name="videoArticleTitle" placeholder="영상 제목을 입력하세요" required>
                        <input type="text" class="form-control" id="title" name="videoArticleChannel" placeholder="영상 채널명 입력하세요" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="url" class="form-label">YouTube 임베드 URL</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-youtube"></i></span>
                            <input type="text" class="form-control" id="url" name="videoArticleUrl" placeholder="예: https://www.youtube.com/embed/VIDEO_ID" required>
                            <button class="btn btn-outline-primary" type="button" id="previewBtn">미리보기</button>
                        </div>
                        <div class="form-text">YouTube 영상의 임베드 URL을 입력하세요. (예: https://www.youtube.com/embed/VIDEO_ID)</div>
                    </div>
                    
                    <div class="video-preview" id="videoPreview">
                        <iframe id="videoFrame" src="" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    </div>
                    
                    <div class="video-preview" id="videoPlaceholder">
                        <div class="video-preview-placeholder">
                            <i class="bi bi-film"></i>
                            <p>URL을 입력하고 미리보기 버튼을 클릭하면 영상이 표시됩니다.</p>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="part" class="form-label">운동 부위</label>
                        <select class="form-select" id="part" name="videoArticlePart" required>
                            <option value="" selected disabled>운동 부위를 선택하세요</option>
                            <option value="전신">전신</option>
                            <option value="상체">상체</option>
                            <option value="하체">하체</option>
                            <option value="복부">복부</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="description" class="form-label">영상 설명</label>
                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="영상에 대한 설명을 입력하세요"></textarea>
                    </div>
                    
                    <div class="d-flex justify-content-end mt-4">
                        <a href="/admin/articles" class="btn btn-admin-cancel me-2">취소</a>
                        <button type="submit" class="btn btn-admin-submit">등록하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="admin-footer">
        &copy; 2025 SSAFY 13 Daejeon class 3 Kim Square. All Rights Reserved.
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const previewBtn = document.getElementById('previewBtn');
            const urlInput = document.getElementById('url');
            const videoPreview = document.getElementById('videoPreview');
            const videoPlaceholder = document.getElementById('videoPlaceholder');
            const videoFrame = document.getElementById('videoFrame');
            
            // 페이지 로드 시 플레이스홀더 표시
            videoPlaceholder.style.display = 'block';
            
            previewBtn.addEventListener('click', function() {
                const url = urlInput.value.trim();
                
                if (url) {
                    videoFrame.src = url;
                    videoPreview.style.display = 'block';
                    videoPlaceholder.style.display = 'none';
                } else {
                    alert('YouTube 임베드 URL을 입력하세요.');
                }
            });
            
            // 폼 제출 전 유효성 검사
            document.getElementById('videoForm').addEventListener('submit', function(e) {
                const title = document.getElementById('title').value.trim();
                const url = urlInput.value.trim();
                const part = document.getElementById('part').value;
                
                if (!title) {
                    e.preventDefault();
                    alert('영상 제목을 입력하세요.');
                    return;
                }
                
                if (!url) {
                    e.preventDefault();
                    alert('YouTube 임베드 URL을 입력하세요.');
                    return;
                }
                
                if (!url.includes('youtube.com/embed/')) {
                    e.preventDefault();
                    alert('유효한 YouTube 임베드 URL을 입력하세요. (예: https://www.youtube.com/embed/VIDEO_ID)');
                    return;
                }
                
                if (!part) {
                    e.preventDefault();
                    alert('운동 부위를 선택하세요.');
                    return;
                }
            });
        });
    </script>
</body>
</html> 