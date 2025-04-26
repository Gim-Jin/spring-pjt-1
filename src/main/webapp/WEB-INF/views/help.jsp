<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도움말 - SSAFIT</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            padding-top: 76px; /* 헤더 높이만큼 상단 패딩 추가 */
        }
        
        .help-section {
            padding: 80px 0;
        }
        
        .help-card {
            transition: transform 0.3s ease;
            height: 100%;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .help-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .help-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #0d6efd;
        }
        
        .accordion-button:not(.collapsed) {
            background-color: #f8f9fa;
            color: #0d6efd;
        }

        .section-anchor {
            display: block;
            height: 80px;
            margin-top: -80px;
            visibility: hidden;
        }
    </style>
</head>
<body>
    <!-- 헤더 포함 -->
    <%@ include file="/WEB-INF/header.jsp" %>
    
    <!-- 메인 컨텐츠 -->
    <main>
        <!-- 도움말 헤더 섹션 -->
        <section class="bg-light py-5 mt-3">
            <div class="container">
                <div class="row justify-content-center text-center">
                    <div class="col-lg-8">
                        <h1 class="mb-3">SSAFIT 도움말</h1>
                        <p class="lead mb-0">SSAFIT 서비스 이용에 관한 모든 정보를 확인하세요.</p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 주요 기능 안내 섹션 -->
        <section class="help-section">
            <div class="container">
                <h2 class="text-center mb-5">주요 기능 안내</h2>
                <div class="row g-4 justify-content-center">
                    <!-- 회원 관리 기능 -->
                    <div class="col-md-5">
                        <div class="card help-card shadow-sm">
                            <div class="card-body text-center p-4">
                                <i class="bi bi-person-circle help-icon"></i>
                                <h4 class="card-title">회원 기능</h4>
                                <p class="card-text">회원가입, 로그인, 로그아웃 등 사용자 계정 관련 기능을 안내합니다.</p>
                                <a href="#user-guide" class="btn btn-outline-primary mt-3">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 영상 관련 기능 -->
                    <div class="col-md-5">
                        <div class="card help-card shadow-sm">
                            <div class="card-body text-center p-4">
                                <i class="bi bi-play-circle help-icon"></i>
                                <h4 class="card-title">영상 기능</h4>
                                <p class="card-text">영상 검색, 시청, 댓글 작성 등 영상 관련 기능을 안내합니다.</p>
                                <a href="#video-guide" class="btn btn-outline-primary mt-3">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 상세 가이드 섹션 -->
        <section class="py-5 bg-light">
            <div class="container">
                <!-- 회원 기능 가이드 -->
                <span id="user-guide" class="section-anchor"></span>
                <div class="mb-5 pt-4">
                    <h3 class="mb-4">회원 기능 가이드</h3>
                    <div class="accordion" id="userAccordion">
                        <!-- 회원가입 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#userRegistration">
                                    회원가입 방법
                                </button>
                            </h2>
                            <div id="userRegistration" class="accordion-collapse collapse show" data-bs-parent="#userAccordion">
                                <div class="accordion-body">
                                    <p>SSAFIT 서비스를 이용하기 위해 회원가입을 진행합니다.</p>
                                    <ol>
                                        <li>메인 페이지 상단 우측의 '로그인' 버튼을 클릭합니다.</li>
                                        <li>로그인 페이지 하단의 '회원가입' 링크를 클릭합니다.</li>
                                        <li>이메일, 비밀번호, 닉네임을 입력하고 '가입하기' 버튼을 클릭합니다.</li>
                                        <li>회원가입이 완료되면 자동으로 메인 페이지로 이동합니다.</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 로그인 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#userLogin">
                                    로그인 방법
                                </button>
                            </h2>
                            <div id="userLogin" class="accordion-collapse collapse" data-bs-parent="#userAccordion">
                                <div class="accordion-body">
                                    <p>가입한 계정으로 SSAFIT 서비스에 로그인합니다.</p>
                                    <ol>
                                        <li>메인 페이지 상단 우측의 '로그인' 버튼을 클릭합니다.</li>
                                        <li>이메일과 비밀번호를 입력합니다.</li>
                                        <li>'로그인' 버튼을 클릭하면 메인 페이지로 이동합니다.</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 로그아웃 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#userLogout">
                                    로그아웃 방법
                                </button>
                            </h2>
                            <div id="userLogout" class="accordion-collapse collapse" data-bs-parent="#userAccordion">
                                <div class="accordion-body">
                                    <p>SSAFIT 서비스에서 로그아웃합니다.</p>
                                    <ol>
                                        <li>로그인 상태에서 상단 우측의 프로필 아이콘을 클릭합니다.</li>
                                        <li>드롭다운 메뉴에서 '로그아웃'을 선택합니다.</li>
                                        <li>로그아웃이 완료되면 메인 페이지로 이동합니다.</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 영상 기능 가이드 -->
                <span id="video-guide" class="section-anchor"></span>
                <div class="pt-4">
                    <h3 class="mb-4">영상 기능 가이드</h3>
                    <div class="accordion" id="videoAccordion">
                        <!-- 영상 검색 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#videoSearch">
                                    영상 검색 방법
                                </button>
                            </h2>
                            <div id="videoSearch" class="accordion-collapse collapse show" data-bs-parent="#videoAccordion">
                                <div class="accordion-body">
                                    <p>원하는 운동 영상을 검색하는 방법입니다.</p>
                                    <ol>
                                        <li>상단 검색창에 검색어를 입력합니다.</li>
                                        <li>엔터키를 누르거나 검색 아이콘을 클릭합니다.</li>
                                        <li>검색 결과에서 원하는 영상을 선택할 수 있습니다.</li>
                                    </ol>
                                    <p>추가로, 메인 페이지에서 운동 부위별로 필터링하여 영상을 찾을 수도 있습니다.</p>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 영상 상세 보기 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#videoDetail">
                                    영상 상세 보기
                                </button>
                            </h2>
                            <div id="videoDetail" class="accordion-collapse collapse" data-bs-parent="#videoAccordion">
                                <div class="accordion-body">
                                    <p>선택한 영상의 상세 정보를 확인하고 시청하는 방법입니다.</p>
                                    <ol>
                                        <li>영상 목록에서 원하는 영상을 클릭합니다.</li>
                                        <li>영상 플레이어에서 영상을 시청할 수 있습니다.</li>
                                        <li>영상 아래에는 영상 정보와 댓글 섹션이 있습니다.</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 댓글 작성 -->
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#videoComment">
                                    댓글 작성 및 관리
                                </button>
                            </h2>
                            <div id="videoComment" class="accordion-collapse collapse" data-bs-parent="#videoAccordion">
                                <div class="accordion-body">
                                    <p>영상에 댓글을 작성하고 관리하는 방법입니다.</p>
                                    <ol>
                                        <li>영상 상세 페이지 하단의 댓글 섹션으로 이동합니다.</li>
                                        <li>댓글 작성 폼에 내용을 입력합니다.</li>
                                        <li>'댓글 작성' 버튼을 클릭하여 등록합니다.</li>
                                        <li>본인이 작성한 댓글은 수정 및 삭제가 가능합니다.</li>
                                    </ol>
                                    <p>※ 댓글 작성은 로그인 후 이용 가능합니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 자주 묻는 질문 섹션 -->
        <section class="py-5">
            <div class="container">
                <h2 class="text-center mb-5">자주 묻는 질문(FAQ)</h2>
                <div class="accordion" id="faqAccordion">
                    <!-- FAQ 항목 1 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                SSAFIT 서비스는 무료인가요?
                            </button>
                        </h2>
                        <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                <p>네, SSAFIT의 모든 기본 서비스는 무료로 제공됩니다. 회원가입 후 모든 운동 영상을 시청하고 댓글 작성 등의 활동을 무료로 이용하실 수 있습니다.</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- FAQ 항목 2 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                비밀번호를 잊어버렸어요. 어떻게 해야 하나요?
                            </button>
                        </h2>
                        <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                <p>로그인 페이지에서 '비밀번호 찾기' 링크를 클릭하여 이메일 인증을 통해 비밀번호를 재설정할 수 있습니다. 이메일로 발송된 안내에 따라 새 비밀번호를 설정해 주세요.</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- FAQ 항목 3 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                운동 영상을 저장하여 오프라인에서 볼 수 있나요?
                            </button>
                        </h2>
                        <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                <p>현재 SSAFIT 서비스에서는 영상 저장 기능을 제공하지 않습니다. 영상은 온라인 스트리밍 방식으로만 시청 가능합니다. 향후 업데이트를 통해 관련 기능이 추가될 수 있습니다.</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- FAQ 항목 4 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
                                내가 작성한 댓글을 모아서 볼 수 있나요?
                            </button>
                        </h2>
                        <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                <p>마이페이지에서 본인이 작성한 모든 댓글을 확인할 수 있습니다. 상단 우측의 프로필 아이콘을 클릭한 후 '내 활동'을 선택하면 작성한 댓글 목록을 확인할 수 있습니다.</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- FAQ 항목 5 -->
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq5">
                                SSAFIT에 운동 영상을 직접 업로드할 수 있나요?
                            </button>
                        </h2>
                        <div id="faq5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                <p>일반 사용자는 직접 영상을 업로드할 수 없습니다. SSAFIT의 영상은 관리자에 의해 검증된 콘텐츠만 제공됩니다. 원하는 영상이 있다면 관리자에게 문의하시기 바랍니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 문의하기 섹션 -->
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h3 class="mb-4">더 궁금한 점이 있으신가요?</h3>
                        <p class="lead mb-4">문의사항이 있으시면 아래 연락처로 문의해 주세요.</p>
                        <div class="d-flex justify-content-center gap-3 mb-4">
                            <a href="mailto:contact@ssafit.com" class="btn btn-primary"><i class="bi bi-envelope me-2"></i>이메일 문의</a>
                            <a href="tel:123-4567-8901" class="btn btn-outline-primary"><i class="bi bi-telephone me-2"></i>전화 문의</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    <!-- 푸터 포함 -->
    <%@ include file="/WEB-INF/footer.jsp" %>
    
    <!-- Bootstrap JS 및 Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 