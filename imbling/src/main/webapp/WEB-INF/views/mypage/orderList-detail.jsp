<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />
    <!-- Css Styles ,font -->
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <meta charset="UTF-8">
    <title>임블리 사이트</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
<jsp:include page="/WEB-INF/views/modules/header.jsp" />

<!-- ****************************** carousel ************************** -->
<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <form action="/userOrder/updateOrderInfo" method="post">
                <div class="row">
                    <div class="col-lg-8 col-md-6">

                        <h6 class="checkout__title">주문 상세 정보</h6>
                        <input type="hidden" name="orderNo" value="${order.orderNo}">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>이름<span>  </span></p>
                                    <input type="text" value="${order.userId}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>주문일자<span>  </span></p>
                                    <input type="text" value="${order.orderDate}" readonly>
                                </div>
                                <div class="checkout__input">
                                    <p>결제정보<span>  </span></p>
                                    <input type="text" value="${order.orderPay}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input" id="callBackDiv">
                            <p>배송주소<span></span>&nbsp&nbsp&nbsp
                            <button type="button" class="btn btn-secondary" id="goPopup"> 주소 찾기</button></p>
                            <input type="text" placeholder="주소 찾기 버튼을 눌러주세요" id="roadFullAddr" class="checkout__input__add"
                            style="color:black" name="orderAddr" value="${order.orderAddr}" readonly >
                        </div>
                        <div class="checkout__input">
                            <p>배송요청사항<span></span></p>
                            <input type="text" style="color:black" value="${order.orderDeliveryRequire}" name="orderDeliveryRequire"
                                   placeholder="배송 기사님께 전달할 메세지를 입력해주세요.">
                        </div>

                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4 class="order__title">주문상품</h4>
                            <div class="checkout__order__products">상품 <span>총 금액</span></div>
                            <ul class="checkout__total__products">
                            	<c:forEach items="${order.orders}" var="orders">
                            	<c:set var="i" value="${i+1}" />
                            	<li>0${i}. ${orders.productName} <span>${orders.orderDetailEA}개 <fmt:formatNumber value="${orders.orderDetailTotalPrice}" pattern="#,###원" /></span></li>
                            	</c:forEach>
                            </ul>
                            <ul class="checkout__total__all">
                                <li>총 주문금액 <span><fmt:formatNumber value="${orderTotalPrice}" pattern="#,###원" /></span></li>
                            </ul>
                            <c:choose>
                            <c:when test="${order.orderState=='주문취소'}">
                            <a> 취소된 주문입니다. </a>
                            </c:when>
                            <c:otherwise>
                            	<c:choose>
                            	<c:when test="${order.orderState=='주문완료'}">
	                            <button type="submit" class="site-btn">주문 정보 수정</button>
	                            <button type="button" class="cancel-btn">주문 취소</button>
	                            </c:when>
	                            <c:otherwise>
	                            <a> 주문 정보 수정/취소 가능 상태가 아닙니다. </a>
	                            </c:otherwise>
                            	</c:choose>
                            </c:otherwise>
                            </c:choose>
                            
                            
                            
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->


<!-- ****************************** footer ************************** -->
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
<!-- ****************************** end footer ************************** -->

<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

<script type="text/javascript">
$(function(){
	$("#goPopup").on('click',function(event){
		window.open("/userOrder/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	});
	
	$('.site-btn').on('click',function(event){
		const ok = confirm("주문 정보를 수정합니다.");
		if (!ok){
		return false;
		}
		return true;
	});
	
	$('.cancel-btn').on('click',function(event){
		const ok = confirm("주문을 취소하시겠습니까?");
		if (!ok){
		return false;
		}
		location.href="/userOrder/cancelOrder?orderNo="+${order.orderNo};
	});

});


</script>

</body>
</html>