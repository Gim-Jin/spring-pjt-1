# SSAFIT - 운동 영상 공유 플랫폼

## 프로젝트 개요
SSAFIT는 운동 영상을 공유하고 관리할 수 있는 플랫폼입니다. 사용자들은 다양한 운동 영상을 검색하고 시청할 수 있으며, 관리자는 영상과 사용자를 관리할 수 있습니다.

## 주요 기능

### 1. 사용자 기능 (UserController)
#### 1.1 회원가입 및 로그인
- **회원가입**
  - URL: `/users/regist`
  - 이메일, 비밀번호, 닉네임으로 회원가입
  - 회원가입 후 메인 페이지로 이동

- **로그인**
  - URL: `/users/login`
  - 이메일과 비밀번호로 로그인
  - 세션에 사용자 정보 저장 (이메일, 닉네임, 역할, ID)
  - 로그인 성공 시 메인 페이지로 이동

- **로그아웃**
  - URL: `/users/logout`
  - 세션 무효화
  - 메인 페이지로 이동

### 2. 영상 기능 (VideoArticleController)
#### 2.1 영상 목록
- **전체 영상 조회**
  - URL: `/index` 또는 `/`
  - 모든 영상 목록 표시
  - YouTube URL에서 비디오 ID 추출

- **조회수 정렬**
  - URL: `/index/views`
  - 조회수 기준으로 영상 정렬

- **부위별 조회**
  - URL: `/video/list?category={부위}`
  - 운동 부위별 영상 필터링
  - 선택된 부위 정보 표시

- **제목 검색**
  - URL: `/search/{title}`
  - 제목으로 영상 검색

#### 2.2 영상 상세
- **상세 정보**
  - URL: `/articles/{id}`
  - 영상 상세 정보 표시
  - 댓글 목록 표시

#### 2.3 댓글 기능
- **댓글 작성**
  - URL: `/articles/{id}/comment`
  - 로그인한 사용자만 작성 가능
  - 작성자 ID 자동 설정

- **댓글 수정**
  - URL: `/articles/{articleId}/comments/{commentId}/update`
  - 댓글 내용 수정

- **댓글 삭제**
  - URL: `/articles/{articleId}/comments/{commentId}/delete`
  - 댓글 삭제 후 영상 상세 페이지로 이동

### 3. 관리자 기능 (AdminController)
#### 3.1 관리자 인증
- **관리자 로그인**
  - URL: `/admin/login`
  - 관리자 전용 로그인 페이지
  - 세션에 관리자 역할 저장

- **관리자 로그아웃**
  - URL: `/admin/logout`
  - 세션 무효화
  - 로그인 페이지로 이동

#### 3.2 사용자 관리
- **사용자 목록**
  - URL: `/admin/users`
  - 모든 사용자 목록 표시

- **사용자 상세**
  - URL: `/admin/users/{email}`
  - 특정 사용자 상세 정보 표시

- **사용자 수정**
  - URL: `/admin/users/{email}/modify`
  - 닉네임만 수정 가능
  - 이메일 수정 불가

- **사용자 삭제**
  - URL: `/admin/users/{email}/delete`
  - 사용자 계정 삭제

#### 3.3 영상 관리
- **영상 목록**
  - URL: `/admin/articles`
  - 모든 영상 목록 표시

- **영상 등록**
  - URL: `/admin/articles/registform`
  - 새로운 영상 정보 입력
  - 등록 후 목록으로 이동

- **영상 수정**
  - URL: `/admin/articles/edit`
  - 영상 정보 수정
  - 수정 후 목록으로 이동

- **영상 삭제**
  - URL: `/admin/articles/delete?id={id}`
  - 영상 삭제
  - 삭제 후 목록으로 이동

### 4. 예외 처리 (GlobalExceptionHandler)
- 모든 예외를 처리하는 글로벌 예외 핸들러
- 에러 메시지를 모델에 추가
- 에러 페이지로 이동

## 데이터베이스 구조
### 주요 테이블
- User (사용자 정보)
- VideoArticle (영상 정보)
- Comment (댓글 정보)
- Admin (관리자 정보)

## 설치 및 실행 방법
1. 프로젝트 클론
2. MySQL 데이터베이스 설정
3. application.properties 파일 설정
4. Maven 빌드
5. Spring Boot 실행 
