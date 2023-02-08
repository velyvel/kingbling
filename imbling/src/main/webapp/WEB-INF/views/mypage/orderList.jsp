<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
​
<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
<jsp:include page="/WEB-INF/views/modules/header.jsp" />

<!-- ****************************** main ************************** -->
    <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">주문 목록</h6>
    </div>
    <input type="hidden" value="${selectedValue}" id="selectedDefault" />
    <div class="card-body">
		<div>
			<select id="selectedValue" class="custom-select" size="3">
			  <option value="전체보기" >전체보기</option>
			  <option value="주문완료">주문완료</option>
  			  <!-- <option value="상품준비중">상품준비중</option> -->
			  <option value="배송중">배송중</option>
			  <option value="배송완료">배송완료</option>
  			  <option value="구매확정">구매확정</option>
  			  <option value="주문취소">주문취소</option>
  			  <!-- <option value="반품교환신청">반품/교환신청</option> -->
			</select>
		</div>
        <div class="table-responsive" id="orderList">
			<br>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>주문번호</th>
                    <th>주문자</th>
                    <th>주문일자</th>
                    <th>주문상태</th>
                    <th>리뷰쓰기</th>
                    <th>결제정보</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="order">
                <tr id="orderRow${order.orderNo}" data-orderno="${order.orderNo}" style="cursor: pointer;">
                    <td>${order.orderNo}</td>
                    <td>${order.userId}</td>
                    <td><fmt:formatDate value="${order.orderDate}" type="both" dateStyle="full" timeStyle="short" /></td>
                    <td>${order.orderState} &nbsp;</td>
                    <c:choose>
                        <c:when test="${order.orderState == '배송완료'}">
                            <td> <a class="btn btn-outline-primary" href="/board/writeReview?orderNo=${order.orderNo}">리뷰쓰기</a>
                            </td>
                        </c:when>
                        <c:otherwise>
                        	<c:choose>
		                        <c:when test="${order.orderState == '구매확정'}">
		                            <td>내가 쓴 리뷰 보기</td>
		                        </c:when>
		                        <c:otherwise>
		                            <td>배송 완료 후 리뷰쓰기</td>
		                        </c:otherwise>
		                    </c:choose>
                        </c:otherwise>
                    </c:choose>
                    <td>${order.orderPay}</td>
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
	var selectedDefault = $('#selectedDefault').val();
	
	$(".current").html(selectedDefault);
	
	$('.card-body .option').on("click",function(event){
		var selectedValue = $(this).data("value");
		location.href="/mypage/orderList?selectedValue="+selectedValue;
	});

	$("#orderList").on('click',"tr[id *= 'orderRow']",function(event){
		var orderNo = $(this).data("orderno");
		location.href="/mypage/orderList-detail?orderNo="+orderNo;
	});
	

});
</script>


</body>
</html>