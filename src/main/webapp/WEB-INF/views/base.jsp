<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} - SSAFIT</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- 커스텀 스타일시트 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <!-- 페이지별 추가 스타일시트 -->
    <c:if test="${not empty param.styles}">
        ${param.styles}
    </c:if>
</head>
<body class="d-flex flex-column min-vh-100">
    <!-- 헤더 인클루드 -->
    <jsp:include page="header.jsp" />
    
    <!-- 메인 콘텐츠 -->
    <main class="flex-grow-1">
        <c:if test="${not empty param.content}">
            <jsp:include page="${param.content}" />
        </c:if>
    </main>
    
    <!-- 푸터 인클루드 -->
    <jsp:include page="footer.jsp" />
    
    <!-- 페이지별 추가 스크립트 -->
    <c:if test="${not empty param.scripts}">
        ${param.scripts}
    </c:if>
</body>
</html> 