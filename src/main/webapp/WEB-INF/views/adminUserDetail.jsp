<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SSAFIT - 사용자 상세 정보</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <div class="admin-content" style="margin-left: 250px; padding: 20px;">
        <div class="admin-header d-flex justify-content-between align-items-center mb-4">
            <h4 class="admin-title">사용자 상세 정보</h4>
            <a href="/admin/users" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left"></i> 목록으로 돌아가기
            </a>
        </div>

        <div class="admin-card">
            <div class="admin-card-header">
                <span>기본 정보</span>
            </div>
            <div class="admin-card-body">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label fw-bold">이메일</label>
                            <p class="form-control-plaintext">${user.userEmail}</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label fw-bold">닉네임</label>
                            <p class="form-control-plaintext">${user.userNickName}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="admin-card mt-4">
            <div class="admin-card-header d-flex justify-content-between align-items-center">
                <span>관리</span>
                <div>
                    <a href="/admin/users/${user.userEmail}/modify" class="btn btn-warning me-2">
                        <i class="bi bi-pencil-square"></i> 수정
                    </a>
                    <a href="/admin/users/${user.userEmail}/delete" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">
                        <i class="bi bi-trash"></i> 삭제
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 