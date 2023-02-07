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
#dataTable2 tbody tr:hover { background-color: lightgray; 
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
            
            <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>별점</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${reviews}" var="review"> 
               	<c:if test="${!review.reviewDeleted}">
               	<tr id="boardRow${review.reviewNo}" data-boardno="${review.reviewNo}" style="cursor: pointer;">
               		<td>${review.reviewNo}</td>
                    <td>${review.reviewTitle}</td>
                    <td>${review.userId}</td>
                    <td><fmt:formatDate value="${review.reviewRegDate}" type="both" dateStyle="full" timeStyle="short" /></td>
                    <td><c:forEach begin="1" end="${review.reviewStar}">⭐️</c:forEach></td>
                    <td>${review.reviewCount}</td>
                </tr>
               	</c:if>
               	</c:forEach>
                </tbody>
            </table>
            <button type="button" class="btn btn-secondary" style="float:right" id="seeMoreReview">더보기</button>
            <br>
        </div>
    </div>
</div>
        <%-- =======================================모달창 상세보기==========================================       --%>
        <div class="modal fade" id="modalDetail" tabindex="-1" role="dialog"
             aria-hidden="true">
            <div class="modal-dialog" role="document"style="background-color: white">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalDetailLabel">1:1문의</h5>
                    <div> &nbsp;&nbsp;작성자: <span id="boardDetailUserId" style="color:#393E46"></span></div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="get">
                        <div class="form-group">
                            <label for="boardDetailTitle" class="col-form-label">제목:</label>
                            <input type="text" class="form-control" name="boardTitle" id="boardDetailTitle"
                                   value="" style="color:#393E46">
                            <input type="hidden" class="form-control" name="boardCategory" id="boardDetailCategory"
                                   value="">
                        </div>
                        <div class="form-group">
                            <label for="boardDetailContent" class="col-form-label">내용:</label>
                            <textarea class="form-control" id="boardDetailContent"
                                      name="boardContent" style="color: #393E46"></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
 <%-- =======================================모달창 상세보기==========================================       --%>
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
	
/* 	$('.modal-footer').on('click','button',function(event){
		$("#modalDetail").modal('hide');
	}); */
	
	$("table[id*='dataTable']").on('click',"tr[id *= 'boardRow']",function(event){// 상품 하나 카트에서 삭제하기
		var boardNo = $(this).data("boardno");
		$("#modalDetail").modal();
		$('.modal-body').html("<p>재고가 ??개 남은 상품 입니다.</p>");
	});
	
});

</script>
</body>
</html>