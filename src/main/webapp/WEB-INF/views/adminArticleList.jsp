<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>SSAFIT - 영상 관리</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
    <div class="admin-content" style="margin-left: 250px; padding: 20px;">
        <div class="admin-header">
            <h4 class="admin-title">운동 영상 관리</h4>
            <a href="${pageContext.request.contextPath}/admin/articles/registform" class="admin-btn admin-btn-primary">
                <i class="bi bi-plus-circle"></i> 영상 등록
            </a>
        </div>

        <div class="admin-card">
            <div class="admin-card-header">
                <span>등록된 영상 목록</span>
            </div>
            <div class="admin-card-body">
                <table class="admin-recent-table table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>제목</th>
                            <th>부위</th>
                            <th>채널명</th>
                            <th>조회수</th>
                            <th>영상 링크</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="article" items="${articles}">
                            <tr>
                                <td>${article.videoArticleTitle}</td>
                                <td><span class="badge bg-primary">${article.videoArticlePart}</span></td>
                                <td>${article.videoArticleChannel}</td>
                                <td>${article.videoArticleViews}</td>
                                <td>
                                    <a href="${article.videoArticleUrl}" target="_blank" class="btn btn-sm btn-outline-info">
                                        보기
                                    </a>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/articles/edit?id=${article.videoArticleId}" class="text-primary me-2">
                                        <i class="bi bi-pencil-square"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/articles/delete?id=${article.videoArticleId}" class="text-danger" onclick="return confirm('정말 삭제하시겠습니까?');">
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
