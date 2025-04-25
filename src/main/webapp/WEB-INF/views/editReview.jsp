<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>리뷰 수정하기</title>
  <!-- Bootstrap CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

  <style>
    @import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css");

    body {
      font-family: "Pretendard Variable", Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
    }

    .navbar {
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* 입력 필드 크기 조정 */
    .input-custom {
      box-sizing: border-box;
      width: 100%;
      padding: 8px;
      /* 원하는 패딩값 설정 */
    }

    /* 로그인 버튼 정렬 */
    .btn-custom {
      width: 100%;
      max-width: 10em;
    }

    .min-vh-custom {
      min-height: 86vh;
    }

    .vh-custom {
      height: 50vh
    }

    /* 내용 입력창의 높이 조절을 위해 */
    .content-input {
      height: 200px;
      /* 또는 원하는 높이 */
    }
  </style>
</head>

<body>

  <%@ include file="../header.jsp" %>

  <main class="pt-5 mt-5 container min-vh-custom">
    <section class="bg-light p-5 rounded shadow-sm text-center">
      <h1 class="mb-4">리뷰 수정 하기</h1>

      <form method="post" action="main">
      <input type="hidden" name="action" value="edit">
        <div class="d-flex flex-column align-items-center">
          <div class="d-flex flex-column justify-content-center align-items-start w-100">
            <p class="mb-1">제목</p>
            <input class="form-control input-custom mb-2" type="text" name="title" placeholder="제목" value="${sessionScope.review.title}">
          </div>
          <div class="d-flex flex-column justify-content-center align-items-start w-100">
            <p class="mb-1">내용</p>
            <textarea class="form-control input-custom content-input mb-2" name="content">${sessionScope.review.content}</textarea>
          </div>
          <div class="d-flex justify-content-center align-items-center">
            <button class="btn btn-primary btn-custom mx-2">수정</button>
            <button class="btn btn-danger btn-custom mx-2" onclick="event.preventDefault(); history.back()">취소</button>
          </div>
        </div>
      </form>
    </section>
  </main>

	<%@ include file="../footer.jsp"%>

	<!-- Bootstrap JS CDN -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe1e9I1lRhbuPWxnb7NbkEjZL1iEcfXgzI1GpG9RSdA81MsrHsX5l8/"></script>
</body>

</html>