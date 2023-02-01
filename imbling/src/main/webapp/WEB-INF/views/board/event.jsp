<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a href="event"class="btn btn-secondary">게시판홈</a>
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
                <a href="noticeWrite" class="btn btn-dark" style="margin-bottom: 10px;">글쓰기</a></button>
            </div>
        </div>
        <form method="get" name="noticeWrite">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="myTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>이벤트기간</th>
                        <th>제목</th>
                        <th>진행상황</th>
                        <th>작성자</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody style="align-content: center;">
                    <c:forEach var="board" items="${boards}">
                    <tr>
                        <td>${board.boardRegDate}</td>
                        <td><a href="noticeDetail?boardNo=${board.boardNo}&pageNo=${pageNo}&boardCategory=${board.boardCategory}">${board.boardTitle}</a></td>
<%--                        <td><a href="noticeDetail?boardCategory=${board.boardCategory}&boardNo=${board.boardNo}&pageNo=${pageNo}">${board.boardContent}</a></td>--%>
                        <td>${board.boardRegDate}</td>
                        <td>${board.userId}</td>
                        <td>${board.boardCount}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        </form>
    </div>
    <!-- ****************************** end of 이벤트리스트 ************************** -->

</div>
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
<script type="text/javascript">

    $(document).ready( function () {
        $('#myTable').DataTable();
    } );

</script>

</body>
</html>