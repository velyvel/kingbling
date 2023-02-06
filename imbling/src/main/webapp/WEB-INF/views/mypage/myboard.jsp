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
        <h6 class="m-0 font-weight-bold text-primary">내가 쓴 게시글</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
        <input type="hidden" value="${loginuser.userId}" id="userId" />
        <h5>내가 쓴 글 - 1:1 문의</h5>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th data-orderable="false">글 번호</th>
                    <th data-orderable="false">글 제목</th>
                    <th data-orderable="false">작성자</th>
                    <th data-orderable="false">작성일</th>
                    <th data-orderable="false">조회수</th>
                </tr>
                </thead>
                <tbody>
               	<c:forEach items="${boards}" var="board"> 
               	<c:if test="${!board.boardDeleted}">
               	<tr id="boardRow${board.boardNo}" data-boardno="${board.boardNo}" style="cursor: pointer;">
               		<td>${board.boardNo}</td>
                    <td>${board.boardTitle}</td>
                    <td>${board.userId}</td>
                    <td><fmt:formatDate value="${board.boardRegDate1}" type="both" dateStyle="full" timeStyle="short" /></td>
                    <td>${board.boardCount}</td>
                </tr>
               	</c:if>
               	</c:forEach>
                </tbody>
            </table>
            <button type="button" class="btn btn-secondary" style="float:right" id="seeMoreInquery">더보기</button>
            <br>
            <h5>내가 쓴 글 - 상품 후기</h5>
            
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
                <c:choose>
                <c:when test="${not empty reviews}">
                <c:forEach items="${reviews}" var="review"> 
               	<c:if test="${!review.reviewDeleted}">
               	<tr id="boardRow${board.boardNo}" data-boardno="${board.boardNo}" style="cursor: pointer;">
               		<td>${review.reviewNo}</td>
                    <td>${review.reviewTitle}</td>
                    <td>${review.userId}</td>
                    <td>${review.reviewRegDate}</td>
                    <td>${review.reviewCount}</td>
                </tr>
               	</c:if>
               	</c:forEach>
                </c:when>
                <c:otherwise>
                <tr class="odd">
                	<td valign="top" style="text-align:center" colspan="5" class="dataTables_empty">데이터가 없습니다.</td>
                </tr>
                </c:otherwise>
                </c:choose>
                </tbody>
            </table>
            <button type="button" class="btn btn-secondary" style="float:right" id="seeMoreReview">더보기</button>
            <br>
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
 	$('.pagination').hide();
	$('.dataTables_info').hide();
	$('.dataTables_filter').hide();
	$('.dataTables_length').hide();
	$('.sorting_disabled').removeClass('sorting_desc');
	
	const userId = $('#userId').val();
	
	$(".table-responsive").on('click','#seeMoreInquery',function(event){
		location.href = "/mypage/myboardInquery?userId="+userId;
	});
	$(".table-responsive").on('click','#seeMoreReview',function(event){
		location.href = "/mypage/myboardReview?userId="+userId;
	});
	
});

</script>
</body>
</html>