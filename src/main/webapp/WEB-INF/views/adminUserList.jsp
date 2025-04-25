<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SSAFIT - 사용자 관리</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <div class="admin-content" style="margin-left: 250px; padding: 20px;">
        <div class="admin-header">
            <h4 class="admin-title">사용자 관리</h4>
        </div>

        <div class="admin-card">
            <div class="admin-card-header">
                <span>등록된 사용자 목록</span>
            </div>
            <div class="admin-card-body">
                <table class="admin-recent-table table table-hover">
                    <thead class="table-light">
                        <tr>
                           
                            <th>이메일</th>
                            <th>닉네임</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.userEmail}</td>
                                <td>${user.userNickName}</td>
                                <td>
                                    <a href="/admin/users/${user.userEmail}" class="text-primary me-2">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                    <a href="/admin/users/${user.userEmail}/modify" class="text-warning me-2">
                                        <i class="bi bi-pencil-square"></i>
                                    </a>
                                    <a href="/admin/users/${user.userEmail}/delete" class="text-danger" onclick="return confirm('정말 삭제하시겠습니까?');">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 