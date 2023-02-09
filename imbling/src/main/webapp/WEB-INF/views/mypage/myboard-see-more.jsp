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
        <input type="hidden" value="${loginuser.userId}" id="userId" />
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                <c:choose>
                <c:when test="${sort=='inquery'}">
                	<th>글 번호</th>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>처리상태</th>
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
               		<td>${board.boardNo}
               		<input type="hidden" id="category${board.boardNo}" data-category="1:1문의"  >
               		</td>
                    <td id="title${board.boardNo}" data-title="${board.boardTitle}" >${board.boardTitle}
                    <input type="hidden" id="content${board.boardNo}" data-content="${board.boardContent}"  >
                    </td>
                    <td>${board.userId}</td>
                    <td id="regDate${board.boardNo}" data-regdate="${board.boardRegDate1}" >
                    <fmt:formatDate value="${board.boardRegDate1}" type="both" dateStyle="full" timeStyle="short" /></td>
                    <td></td>
                    <td id="boardCount${board.boardNo}" data-boardcount="${board.boardCount}" >${board.boardCount}</td>
                </tr>
               	</c:forEach>
                </c:when>
                <c:otherwise>
                <c:forEach items="${reviews}" var="review"> 
               	<tr id="boardRow${review.reviewNo}" data-boardno="${review.reviewNo}" style="cursor: pointer;">
               		<td id="boardNo${review.reviewNo}">${review.reviewNo}</td>
                    <td>${review.reviewTitle}</td>
                    <td>${review.userId}</td>
                    <td><fmt:formatDate value="${review.reviewRegDate}" type="both" dateStyle="full" timeStyle="short" /></td>
                    <td><c:forEach begin="1" end="${review.reviewStar}">⭐️</c:forEach></td>
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
 <!-- 모달 시작 -->	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <span class="modal-title fs-5" id="exampleModalLabel"></span>
      </div>
        <form method="get">
        <div class="form-group" style="padding:5px">
            <label for="boardDetailTitle" class="col-form-label">제목:</label>
            <input type="text" class="form-control" name="boardTitle" id="boardDetailTitle"
                   value="" style="color:#393E46" readonly />
        </div>
        <div class="form-group"  style="padding:5px">
            <label for="boardDetailContent" class="col-form-label">내용:</label>
            <textarea class="form-control" id="boardDetailContent" readonly
                      name="boardContent" style="color: #393E46"></textarea>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
    </form>
    </div>
  </div>
</div>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="display:none"> 
</button>
<!-- 모달 끝 -->

<!-- ****************************** footer ************************** -->
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
<!-- ****************************** end footer ************************** -->

<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
<script type="text/javascript">
$(function(){
	
	const userId = $('#userId').val();
	
 	$('.modal-footer').on('click','button',function(event){
		$("#myModal").modal('hide');
	}); 
	
	$("table[id*='dataTable']").on('click',"tr[id *= 'boardRow']",function(event){
		var boardNo = $(this).data("boardno");
		
		if($("#category"+boardNo).data("category")=='1:1문의'){
			$("#myModal").modal();
			$('#exampleModalLabel').html("<h5>"+$("#category"+boardNo).data("category")+"</h5>");
			$('#exampleModalLabel').append("<h7>작성자 : "+userId+"</h7>");
			$('#boardDetailTitle').val($("#title"+boardNo).data("title"));
			$('#boardDetailContent').text($("#content"+boardNo).data("content"));
		}else{
			location.href="/board/reviewDetail?reviewNo="+boardNo;
		}
		
		
		
	});
	
});
</script>
</body>
</html>