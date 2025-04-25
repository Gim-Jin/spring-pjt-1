<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSAFIT - 로그인</title>
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
            background-color: #f8f9fa;
        }

        .login-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            padding: 2rem;
            max-width: 500px;
            margin: 2rem auto;
        }

        .login-title {
            color: #212529;
            text-align: center;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 1rem;
        }

        .login-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background-color: #0d6efd;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }

        .form-control:focus {
            border-color: #86b7fe;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .btn-login {
            background-color: #0d6efd;
            color: white;
            border: none;
            padding: 0.75rem 0;
            border-radius: 50px;
            font-weight: 600;
            width: 100%;
            margin-top: 1rem;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background-color: #0b5ed7;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
        }

        .login-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #6c757d;
        }

        .login-footer a {
            color: #0d6efd;
            text-decoration: none;
            font-weight: 500;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }

        .form-icon {
            text-align: center;
            font-size: 3rem;
            color: #0d6efd;
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
            color: #6c757d;
        }

        .social-login {
            margin-top: 2rem;
            text-align: center;
        }

        .social-login-divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
        }

        .social-login-divider::before,
        .social-login-divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #dee2e6;
        }

        .social-login-divider span {
            padding: 0 1rem;
            color: #6c757d;
            font-size: 0.9rem;
        }

        .social-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 48px;
            height: 48px;
            border-radius: 50%;
            margin: 0 0.5rem;
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }

        .social-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .admin-login-link {
            text-align: center;
            margin-top: 2rem;
            font-size: 0.9rem;
        }

        .admin-login-link a {
            color: #6c757d;
            text-decoration: none;
        }

        .admin-login-link a:hover {
            color: #0d6efd;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp"%>

    <div class="container">
        <div class="login-container animate__animated animate__fadeIn">
            <div class="form-icon">
                <i class="bi bi-person-circle"></i>
            </div>
            <h2 class="login-title fw-bold">로그인</h2>
            
            <form action="${pageContext.request.contextPath}/users/login" method="post">
                <div class="form-group">
                    <label for="userEmail" class="form-label">이메일</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일 주소를 입력하세요" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="userPassword" class="form-label">비밀번호</label>
                    <div class="input-group password-toggle">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요" required>
                        <i class="bi bi-eye-slash" id="togglePassword"></i>
                    </div>
                </div>
                
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">
                        로그인 상태 유지
                    </label>
                </div>
                
                <button type="submit" class="btn btn-login">로그인</button>
                
                <div class="login-footer">
                    계정이 없으신가요? <a href="${pageContext.request.contextPath}/users/regist">회원가입하기</a>
                </div>
            </form>
            
            <div class="social-login">
                <div class="social-login-divider">
                    <span>또는</span>
                </div>
                
                <div>
                    <a href="#" class="social-btn" style="background-color: #fee500;">
                        <i class="bi bi-chat-fill text-dark"></i>
                    </a>
                    <a href="#" class="social-btn" style="background-color: #4267B2;">
                        <i class="bi bi-facebook text-white"></i>
                    </a>
                    <a href="#" class="social-btn" style="background-color: #DB4437;">
                        <i class="bi bi-google text-white"></i>
                    </a>
                    <a href="#" class="social-btn" style="background-color: #1DA1F2;">
                        <i class="bi bi-twitter text-white"></i>
                    </a>
                </div>
            </div>
            
            <div class="admin-login-link">
                <a href="${pageContext.request.contextPath}/admin/login">관리자 로그인</a>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp"%>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 비밀번호 표시/숨기기 토글
        document.getElementById('togglePassword').addEventListener('click', function() {
            const passwordInput = document.getElementById('userPassword');
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