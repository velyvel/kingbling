<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
            <form action="#">
                <div class="row">
                    <div class="col-lg-8 col-md-6">

                        <h6 class="checkout__title">주문 상세 정보</h6>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>이름<span></span></p>
                                    <input type="text">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>주문일자<span></span></p>
                                    <input type="text" readonly>
                                </div>
                                <div class="checkout__input">
                                    <p>결제정보<span></span></p>
                                    <input type="text" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>배송주소<span>*</span></p>
                            <input type="text" placeholder="기본 주소" class="checkout__input__add">
                            <input type="text" placeholder="상세주소">
                        </div>
                        <div class="checkout__input">
                            <p>배송요청사항<span></span></p>
                            <input type="text"
                                   placeholder="배송 기사님께 전달할 메세지를 입력해주세요.">
                        </div>

                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4 class="order__title">주문상품</h4>
                            <div class="checkout__order__products">상품 <span>총 금액</span></div>
                            <ul class="checkout__total__products">
                                <li>01. Vanilla salted caramel <span>$ 300.0</span></li>
                                <li>02. German chocolate <span>$ 170.0</span></li>
                                <li>03. Sweet autumn <span>$ 170.0</span></li>
                                <li>04. Cluten free mini dozen <span>$ 110.0</span></li>
                            </ul>
                            <ul></ul>
                            <ul class="checkout__total__all">
                                <li>총 주문금액 <span>$750.99</span></li>
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



</body>
</html>