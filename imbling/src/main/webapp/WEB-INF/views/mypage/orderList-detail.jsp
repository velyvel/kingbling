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
            <form action="/mypage/cartOrder" method="post">
                <div class="row">
                    <div class="col-lg-8 col-md-6">

                        <h6 class="checkout__title">주문 상세 정보</h6>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>이름<span>  (수정 할 수 없습니다.)</span></p>
                                    <input type="text" value="${order.userId}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>주문일자<span>  (수정 할 수 없습니다.)</span></p>
                                    <input type="text" value="${order.orderDate}" readonly>
                                </div>
                                <div class="checkout__input">
                                    <p>결제정보<span>  (수정 할 수 없습니다.)</span></p>
                                    <input type="text" value="${order.orderPay}" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input" id="callBackDiv">
                            <p>배송주소<span></span>&nbsp&nbsp&nbsp
                            <button type="button" class="btn btn-secondary" id="goPopup"> 주소 찾기</button></p>
                            <input type="text" placeholder="주소 찾기 버튼을 눌러주세요" id="roadFullAddr" class="checkout__input__add"
                            style="color:black" value="${order.orderAddr}" readonly >
                        </div>
                        <div class="checkout__input">
                            <p>배송요청사항<span></span></p>
                            <input type="text" value="${order.orderDeliveryRequire}"
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
                            	<li>0i. ${orders.propertyNo} <span>${orders.orderDetailEA}개 <fmt:formatNumber value="${orders.orderDetailTotalPrice}" pattern="#,###원" /></span></li>
                            	</c:forEach>
                            </ul>
                            <ul class="checkout__total__all">
                                <li>총 주문금액 <span><fmt:formatNumber value="${orderTotalPrice}" pattern="#,###원" /></span></li>
                            </ul>
                            <button type="submit" class="site-btn">주문 정보 수정</button>
                            <button type="button" class="cancel-btn">주문 취소</button>
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
	})

});


</script>

</body>
</html>