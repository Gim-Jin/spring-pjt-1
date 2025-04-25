<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSAFIT - 관리자 로그인</title>
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
            padding-top: 80px;
            background-color: #212529;
            color: #f8f9fa;
        }

        .admin-login-container {
            background-color: #343a40;
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.3);
            padding: 2rem;
            max-width: 500px;
            margin: 2rem auto;
            border: 1px solid #495057;
        }

        .admin-login-title {
            color: #f8f9fa;
            text-align: center;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 1rem;
        }

        .admin-login-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background-color: #dc3545;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            color: #e9ecef;
            margin-bottom: 0.5rem;
        }

        .form-control {
            background-color: #495057;
            border: 1px solid #6c757d;
            color: #f8f9fa;
        }

        .form-control:focus {
            background-color: #495057;
            border-color: #dc3545;
            box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25);
            color: #f8f9fa;
        }

        .form-control::placeholder {
            color: #adb5bd;
        }

        .btn-admin-login {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 0.75rem 0;
            border-radius: 5px;
            font-weight: 600;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }

        .btn-admin-login:hover {
            background-color: #c82333;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
        }

        .admin-login-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #adb5bd;
        }

        .admin-login-footer a {
            color: #dc3545;
            text-decoration: none;
            font-weight: 500;
        }

        .admin-login-footer a:hover {
            text-decoration: underline;
        }

        .form-icon {
            text-align: center;
            font-size: 3rem;
            color: #dc3545;
            margin-bottom: 1rem;
        }

        .password-toggle {
            position: relative;
        }

        .password-toggle i {
            position: absolute;
            top: 50%;
            right: 1rem;
            transform: translateY(-50%);
            cursor: pointer;
            color: #adb5bd;
        }

        .admin-notice {
            background-color: #2b3035;
            border-left: 4px solid #dc3545;
            padding: 1rem;
            margin-top: 1.5rem;
            border-radius: 5px;
        }

        .admin-notice h6 {
            color: #f8f9fa;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .admin-notice p {
            color: #adb5bd;
            margin-bottom: 0;
            font-size: 0.9rem;
        }

        .input-group-text {
            background-color: #343a40;
            color: #dc3545;
            border: 1px solid #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="admin-login-container animate__animated animate__fadeIn">
            <div class="form-icon">
                <i class="bi bi-shield-lock-fill"></i>
            </div>
            <h2 class="admin-login-title fw-bold">관리자 로그인</h2>
            
            <form action="/admin/login" method="post">
                <div class="form-group">
                    <label for="loginId" class="form-label">관리자 ID</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person-badge"></i></span>
                        <input type="text" class="form-control" id="loginId" name="loginId" placeholder="관리자 ID를 입력하세요" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password" class="form-label">비밀번호</label>
                    <div class="input-group password-toggle">
                        <span class="input-group-text"><i class="bi bi-key"></i></span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
                        <i class="bi bi-eye-slash" id="togglePassword"></i>
                    </div>
                </div>
                
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="rememberMe">
                    <label class="form-check-label" for="rememberMe" style="color: #adb5bd;">
                        로그인 상태 유지
                    </label>
                </div>
                
                <button type="submit" class="btn btn-admin-login">로그인</button>
                
                <div class="admin-notice">
                    <h6><i class="bi bi-exclamation-triangle-fill me-2"></i>주의</h6>
                    <p>관리자 전용 로그인 페이지입니다. 승인된 관리자 계정만 접근할 수 있습니다. 무단 접근 시도는 모두 기록됩니다.</p>
                </div>
            </form>
            
            <div class="admin-login-footer">
                <a href="${pageContext.request.contextPath}/users/login">일반 사용자 로그인으로 돌아가기</a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 비밀번호 표시/숨기기 토글
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordInput = document.getElementById('password');
            const icon = this;
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            } else {
                passwordInput.type = 'password';
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            }
        });
    </script>
</body>
</html> 