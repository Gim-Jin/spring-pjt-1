<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSAFIT - 회원가입</title>
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

        .form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            padding: 2rem;
            max-width: 600px;
            margin: 2rem auto;
        }

        .form-title {
            color: #212529;
            text-align: center;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 1rem;
        }

        .form-title::after {
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

        .btn-register {
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

        .btn-register:hover {
            background-color: #0b5ed7;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(13, 110, 253, 0.3);
        }

        .register-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #6c757d;
        }

        .register-footer a {
            color: #0d6efd;
            text-decoration: none;
            font-weight: 500;
        }

        .register-footer a:hover {
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

        .input-validation {
            font-size: 0.8rem;
            color: #dc3545;
            margin-top: 0.25rem;
            display: none;
        }

        .input-validation.show {
            display: block;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp"%>

    <div class="container">
        <div class="form-container animate__animated animate__fadeIn">
            <div class="form-icon">
                <i class="bi bi-person-plus-fill"></i>
            </div>
            <h2 class="form-title fw-bold">회원가입</h2>
            
            <form action="${pageContext.request.contextPath}/users/regist" method="post" id="registForm">
                <div class="form-group">
                    <label for="userEmail" class="form-label">이메일</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="이메일 주소를 입력하세요" required>
                    </div>
                    <div class="input-validation" id="emailValidation">유효한 이메일 주소를 입력해주세요.</div>
                </div>
                
                <div class="form-group">
                    <label for="userPassword" class="form-label">비밀번호</label>
                    <div class="input-group password-toggle">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="비밀번호를 입력하세요" required>
                        <i class="bi bi-eye-slash" id="togglePassword"></i>
                    </div>
                    <div class="input-validation" id="passwordValidation">비밀번호는 8자 이상이어야 하며, 숫자와 특수문자를 포함해야 합니다.</div>
                </div>
                
                <div class="form-group">
                    <label for="passwordConfirm" class="form-label">비밀번호 확인</label>
                    <div class="input-group password-toggle">
                        <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                        <input type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호를 다시 입력하세요" required>
                        <i class="bi bi-eye-slash" id="togglePasswordConfirm"></i>
                    </div>
                    <div class="input-validation" id="confirmValidation">비밀번호가 일치하지 않습니다.</div>
                </div>
                
                <div class="form-group">
                    <label for="userNickName" class="form-label">닉네임</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" id="userNickName" name="userNickName" placeholder="사용할 닉네임을 입력하세요" required>
                    </div>
                    <div class="input-validation" id="nicknameValidation">닉네임은 2자 이상 10자 이하여야 합니다.</div>
                </div>
                
                <div class="form-group">
                    <label for="userName" class="form-label">이름</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person-badge"></i></span>
                        <input type="text" class="form-control" id="userName" name="userName" placeholder="실명을 입력하세요" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="userAge" class="form-label">나이</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-calendar3"></i></span>
                        <input type="number" class="form-control" id="userAge" name="userAge" placeholder="나이를 입력하세요" required min="1" max="120">
                    </div>
                </div>
                
                <button type="submit" class="btn btn-register">가입하기</button>
                
                <div class="register-footer">
                    이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/users/login">로그인하기</a>
                </div>
            </form>
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
        
        document.getElementById('togglePasswordConfirm').addEventListener('click', function() {
            const passwordInput = document.getElementById('passwordConfirm');
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
        
        // 폼 유효성 검사
        const registForm = document.getElementById('registForm');
        
        registForm.addEventListener('submit', function(e) {
            let isValid = true;
            
            // 이메일 검사
            const email = document.getElementById('userEmail').value;
            const emailValidation = document.getElementById('emailValidation');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            if (!emailRegex.test(email)) {
                emailValidation.classList.add('show');
                isValid = false;
            } else {
                emailValidation.classList.remove('show');
            }
            
            // 비밀번호 검사
            const password = document.getElementById('userPassword').value;
            const passwordValidation = document.getElementById('passwordValidation');
            const passwordRegex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
            
            if (!passwordRegex.test(password)) {
                passwordValidation.classList.add('show');
                isValid = false;
            } else {
                passwordValidation.classList.remove('show');
            }
            
            // 비밀번호 확인 검사
            const confirmPassword = document.getElementById('passwordConfirm').value;
            const confirmValidation = document.getElementById('confirmValidation');
            
            if (password !== confirmPassword) {
                confirmValidation.classList.add('show');
                isValid = false;
            } else {
                confirmValidation.classList.remove('show');
            }
            
            // 닉네임 검사
            const nickname = document.getElementById('userNickName').value;
            const nicknameValidation = document.getElementById('nicknameValidation');
            
            if (nickname.length < 2 || nickname.length > 10) {
                nicknameValidation.classList.add('show');
                isValid = false;
            } else {
                nicknameValidation.classList.remove('show');
            }
            
            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html> 