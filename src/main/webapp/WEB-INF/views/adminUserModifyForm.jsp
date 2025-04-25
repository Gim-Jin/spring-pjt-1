<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SSAFIT - 사용자 정보 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <div class="admin-content" style="margin-left: 250px; padding: 20px;">
        <div class="admin-header d-flex justify-content-between align-items-center mb-4">
            <h4 class="admin-title">사용자 정보 수정</h4>
            <a href="/admin/users/${user.userEmail}" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left"></i> 돌아가기
            </a>
        </div>

        <div class="admin-card">
            <div class="admin-card-header">
                <span>기본 정보</span>
            </div>
            <div class="admin-card-body">
                <form action="<c:url value='/admin/users/${user.userEmail}/modify' />" method="post">
                <input type="hidden" name="userId" value="${user.userId }">
                <input type="hidden" name="userEmail" value="${user.userEmail }">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">이메일</label>
                                <p class="form-control-plaintext">${user.userEmail}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="userNickName" class="form-label fw-bold">닉네임</label>
                                <input type="text" class="form-control" id="userNickName" name="userNickName" 
                                    value="${user.userNickName}" required>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end mt-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-check-lg">저장</i> 
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 