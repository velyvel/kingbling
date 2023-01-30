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
            <form action="/mypage/cartOrder" method="post">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                    
	                    <div class="shopping__cart__table">
	                    <div style="background:#EAEAEA;border-radius:15px" id="toggle">
	                    <h5 style="padding:10px 10px 8px 15px;font-weight:700">주문 제품 보기<i class="fa fa-arrow-down" id="toggleIcon" style="float:right"></i></h5>
	                    </div>
	                    
						<div style="padding:10px 10px 15px 15px; display:none" id="productList">
							<table>
	                        <thead>
	                        <tr>
	                            <th>제품</th>
	                            <th>주문 수량</th>
	                            <th>주문 금액</th>
	                            <th></th>
	                        </tr>
	                        </thead>
	                        <tbody>
	                        <tr>
	                            <td class="product__cart__item">
	                                <div class="product__cart__item__pic">
	                                    <img src="/resources/dist/img/shopping-cart/cart-1.jpg" alt="">
	                                </div>
	                                <div class="product__cart__item__text">
	                                    <h6>T-shirt Contrast Pocket</h6>
	                                    <h5>300,000원</h5>
	                                </div>
	                            </td>
	                            <td class="cart__price">12</td>
	                            <td class="cart__price">300,000원</td>
	                        </tr>
	                        <tr>
	                            <td class="product__cart__item">
	                                <div class="product__cart__item__pic">
	                                    <img src="/resources/dist/img/shopping-cart/cart-2.jpg" alt="">
	                                </div>
	                                <div class="product__cart__item__text">
	                                    <h6>Diagonal Textured Cap</h6>
	                                    <h5>$98.49</h5>
	                                </div>
	                            </td>
	                            <td class="cart__price">20</td>
	                            <td class="cart__price">$ 32.50</td>
	                        </tr>
	                        <tr>
	                            <td class="product__cart__item">
	                                <div class="product__cart__item__pic">
	                                    <img src="/resources/dist/img/shopping-cart/cart-3.jpg" alt="">
	                                </div>
	                                <div class="product__cart__item__text">
	                                    <h6>Basic Flowing Scarf</h6>
	                                    <h5>$98.49</h5>
	                                </div>
	                            </td>
	                            <td class="cart__price">5</td>
	                            <td class="cart__price">$ 47.00</td>
	                        </tr>
	                        <tr>
	                            <td class="product__cart__item">
	                                <div class="product__cart__item__pic">
	                                    <img src="/resources/dist/img/shopping-cart/cart-4.jpg" alt="">
	                                </div>
	                                <div class="product__cart__item__text">
	                                    <h6>Basic Flowing Scarf</h6>
	                                    <h5>$98.49</h5>
	                                </div>
	                            </td>
	                            <td class="cart__price">10</td>
	                            <td class="cart__price">$ 30.00</td>
	                        </tr>
	                        </tbody>
	                    </table>
						</div>
	                </div>

                        <h6 class="checkout__title">주문 상세 정보</h6>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>이름<span>*</span></p>
                                    <input type="text">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>결제정보<span>*</span></p>
                                    <input type="text" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input" id="callBackDiv">
                            <p>배송주소<span>*</span>&nbsp&nbsp&nbsp
                            <button type="button" class="btn btn-secondary" id="goPopup"> 주소 찾기</button></p>
                            <input type="text" placeholder="주소 찾기 버튼을 눌러주세요" id="roadFullAddr" class="checkout__input__add"
                            style="color:black" readonly >
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
                                <li>01. Vanilla salted caramel <span>15개 300원</span></li>
                                <li>02. German chocolate <span>30개 170원</span></li>
                                <li>03. Sweet autumn <span>5개 170원</span></li>
                                <li>04. Cluten free mini dozen <span>7개 110원</span></li>
                            </ul>
                            <ul class="checkout__total__all">
                                <li>총 주문금액 <span>750원</span></li>
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
	});
	
	$("#toggle").on('click',function(event){
		
		if($("#toggleIcon").hasClass("fa fa-arrow-down")){
			$("#toggleIcon").removeClass();
			$("#toggleIcon").addClass("fa fa-arrow-up");
			$('#productList').show();
		}else{
			$("#toggleIcon").removeClass();
			$("#toggleIcon").addClass("fa fa-arrow-down");
			$('#productList').hide();
		}
		
	});

});


</script>

</body>
</html>