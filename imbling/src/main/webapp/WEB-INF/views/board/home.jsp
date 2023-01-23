<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <%--    <jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />--%>
    <!-- Css Styles ,font -->
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />

    <title>공지사항 홈</title>
</head>


<body>

<div class="container">
    <jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
    <jsp:include page="/WEB-INF/views/modules/header.jsp" />
    <!-- ****************************** 바로가기메뉴 ************************** -->
    <a href="home"class="btn btn-secondary">게시판홈</a>
    <a href="notice"class="btn btn-secondary">공지사항</a>
    <a href="review"class="btn btn-secondary">상품후기</a>
    <br><br>
    <!-- ****************************** end of 바로가기메뉴 ************************** -->

    <!-- ******************************  메인이벤트 ************************** -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div style="float: right;">
                <a href="#"class="btn btn-secondary">편집하기</a>
            </div>
            <h5>새로운 이벤트</h5>
        </div>
        <div class="card-body">
            <div class="blog__details__pic">
                <img src="/resources/dist/img/carousel-1.jpeg" alt="">
            </div>
        </div>
    </div>
    <!-- ****************************** end of 메인이벤트 ************************** -->
    <!-- ****************************** 이벤트리스트 ************************** -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div>
                <h5>이벤트리스트</h5>
            </div>
            <div class="btn-group dropright">
                <button type="button" class="btn btn-secondary">
                   조회하기
                </button>
                <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="sr-only">Toggle Dropright</span>
                </button>
                <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">전체조회</a>
                        <a class="dropdown-item" href="#">진행 중인 이벤트</a>
                        <a class="dropdown-item" href="#">마감된 이벤트</a>
                </div>
            </div>
            <%--    c:if 활용하여 adminuser일 때만 편집 가능하도록 구현--%>
            <div style="float: right;">
                <a href="#"class="btn btn-secondary">편집하기</a>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>제목</th>
                        <th>내용</th>
                        <th>이벤트 기간</th>
                        <th>진행상황</th>
                    </tr>
                    </thead>
                    <tbody style="align-content: center;">
                    <tr>
                        <td>새해 덕담 이벤트</td>
                        <td>덕담 나누고 복주머니 받아가고 두마리토끼 잡아가세영</td>
                        <td>2023.01.01~2023.01.31</td>
                        <td>
<%--                            <div class="my-2"></div>--%>
                            <a href="#" class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                <span class="text">진행중</span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>새해 덕담 이벤트</td>
                        <td>덕담 나누고 복주머니 받아가고 두마리토끼 잡아가세영</td>
                        <td>2023.01.01~2023.01.31</td>
                        <td>
                            <a href="#" class="btn btn-danger btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-trash"></i>
                                        </span>
                                <span class="text">종료됨</span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>새해 덕담 이벤트</td>
                        <td>덕담 나누고 복주머니 받아가고 두마리토끼 잡아가세영</td>
                        <td>2023.01.01~2023.01.31</td>
                        <td>
                            <a href="#" class="btn btn-danger btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-trash"></i>
                                        </span>
                                <span class="text">종료됨</span>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>새해 덕담 이벤트</td>
                        <td>덕담 나누고 복주머니 받아가고 두마리토끼 잡아가세영</td>
                        <td>2023.01.01~2023.01.31</td>
                        <td>
                            <a href="#" class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
                                <span class="text">진행중</span>
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <nav aria-label="...">
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <!-- ****************************** end of 이벤트리스트 ************************** -->

</div>
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
<script type="text/javascript">
</script>

</body>
</html>