<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />
    <!-- Css Styles ,font -->
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />
    <meta charset="UTF-8">
    <title>임블리 사이트</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
<jsp:include page="/WEB-INF/views/modules/header.jsp" />

<!-- ****************************** main ************************** -->
    <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">내가 쓴 게시글</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
               	<c:forEach items="${boards}" var="board"> 
               	<tr>
               		<td>${board.boardNo}</td>
                    <td>${board.boardTitle}</td>
                    <td>${board.userNo}</td>
                    <td>${board.boardRegDate}</td>
                    <td>${board.boardCount}</td>
                </tr>
               	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- ****************************** footer ************************** -->
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
<!-- ****************************** end footer ************************** -->

<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
<script type="text/javascript">
$(function(){
});

</script>
</body>
</html>