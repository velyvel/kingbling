<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
#dataTable tbody tr:hover { background-color: lightgray; 
color: white;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
<jsp:include page="/WEB-INF/views/modules/header.jsp" />

<!-- ****************************** main ************************** -->
    <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">내가 쓴 게시글 
        <c:choose>
        <c:when test="${sort=='inquery'}">- 1:1 문의</c:when>
        <c:otherwise>- 상품 후기</c:otherwise>
        </c:choose></h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                <c:choose>
                <c:when test="${sort=='inquery'}">
                	<th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </c:when>
                <c:otherwise>
                	<th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>별점</th>
                    <th>조회수</th>
                </c:otherwise>
                </c:choose>
                    
                </tr>
                </thead>
                <tbody>
                <c:choose>
                <c:when test="${sort=='inquery'}">
                <c:forEach items="${boards}" var="board"> 
               	<tr id="boardRow${board.boardNo}" data-boardno="${board.boardNo}" style="cursor: pointer;">
               		<td>${board.boardNo}</td>
                    <td>${board.boardTitle}</td>
                    <td>${board.userId}</td>
                    <td><fmt:formatDate value="${board.boardRegDate1}" type="both" dateStyle="full" timeStyle="short" /></td>
                    <td>${board.boardCount}</td>
                </tr>
               	</c:forEach>
                </c:when>
                <c:otherwise>
                <c:forEach items="${reviews}" var="review"> 
               	<tr id="boardRow${review.reviewNo}" data-boardno="${review.reviewNo}" style="cursor: pointer;">
               		<td>${review.reviewNo}</td>
                    <td>${review.reviewTitle}</td>
                    <td>${review.userId}</td>
                    <td><fmt:formatDate value="${review.reviewRegDate}" type="both" dateStyle="full" timeStyle="short" /></td>
                    <td><c:forEach items="${review.reviewStar}">⭐️</c:forEach></td>
                    <td>${review.reviewCount}</td>
                </tr>
               	</c:forEach>
                </c:otherwise>
                </c:choose>
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
	
	$("#dataTable").on('click',"tr[id *= 'boardRow']",function(event){// 상품 하나 카트에서 삭제하기
		var boardNo = $(this).data("boardno");
		location.href="/board/board-detail?boardNo="+boardNo;

	});
	
});
</script>
</body>
</html>