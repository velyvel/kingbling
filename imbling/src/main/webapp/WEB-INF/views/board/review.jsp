<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <%--    <jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />--%>
    <!-- Css Styles ,font -->
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />

    <title>상품후기</title>
</head>


<body>

<div class="container">
    <jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
    <jsp:include page="/WEB-INF/views/modules/header.jsp" />
<!-- ****************************** 바로가기메뉴 ************************** -->
    <a href="event"class="btn btn-secondary">게시판홈</a>
    <a href="notice"class="btn btn-secondary">공지사항</a>
    <a href="review"class="btn btn-secondary">상품후기</a>
    <br><br>
<!-- ****************************** end of 바로가기메뉴 ************************** -->
<!-- ****************************** 상품후기 상단바 ************************** -->
    <div>
        <section class="breadcrumb-blog set-bg" data-setbg="/resources/dist/img/breadcrumb-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>상품후기</h2>
                    </div>
                </div>
            </div>
        </section>
<!-- ****************************** end of 상품후기 상단바 ************************** -->
<!-- ****************************** 베스트리뷰 ************************** -->
        <section class="blog spad">
            <div class="container">
                <h2>베스트 상품후기</h2>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="/resources/dist/img/blog/blog-1.jpg"></div>
                            <div class="blog__item__text">
                                <span><img src="/resources/dist/img/icon/calendar.png" alt="">작성날짜</span>
                                <h5>상품이름</h5>
                                <span>가격</span>
                                <span>내용</span>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="/resources/dist/img/blog/blog-2.jpg"></div>
                            <div class="blog__item__text">
                                <span><img src="/resources/dist/img/icon/calendar.png" alt=""> 21 February 2020</span>
                                <h5>Eternity Bands Do Last Forever</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic set-bg" data-setbg="/resources/dist/img/blog/blog-3.jpg"></div>
                            <div class="blog__item__text">
                                <span><img src="/resources/dist/img/icon/calendar.png" alt=""> 28 February 2020</span>
                                <h5>The Health Benefits Of Sunglasses</h5>
                                <a href="#">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <hr>
<!-- ****************************** end of 베스트리뷰 ************************** -->
<!-- ****************************** 후기리스트 ************************** -->
        <h2>후기리스트</h2>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <span>후기</span>
                <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                               aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <%--    c:if 활용하여 adminuser일 때만 편집 가능하도록 구현--%>
                <div style="float: right;">
                    <a href="writeReview"class="btn btn-secondary">후기 작성하기</a>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>상품명</th>
                            <th>제목</th>
                            <th>별점</th>
                            <th>작성자</th>
                            <th>조회수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="review" items="${reviews}">
                            <tr>
                                <td>
                                    ${review.productDto.productName},,,,,,,,,,,${review.productDto.productNo}
                                </td>
                                <td><a href="reviewDetail?reviewNo=${review.reviewNo}">${review.reviewTitle}</a></td>
                                    <c:choose>
                                        <c:when test="${review.reviewStar == 5}">
                                            <td>⭐️⭐️⭐️⭐️⭐️</td>
                                        </c:when>
                                        <c:when test="${review.reviewStar == 4}">
                                            <td>⭐️⭐️⭐️⭐️️</td>
                                        </c:when>
                                        <c:when test="${review.reviewStar == 3}">
                                            <td>⭐️⭐️⭐️️</td>
                                        </c:when>
                                        <c:when test="${review.reviewStar == 2}">
                                            <td>⭐️⭐️</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>⭐️</td>
                                        </c:otherwise>
                                    </c:choose>
                                <td>${review.userId}</td>
                                <td>
                                    ${review.reviewCount}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
<!-- ****************************** end of ************************** -->
    </div>
</div>
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<script type="text/javascript">
</script>

</body>
</html>