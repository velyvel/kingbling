<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />
    <!-- Css Styles ,font -->
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
<jsp:include page="/WEB-INF/views/modules/header.jsp" />

<!-- ****************************** cart ************************** -->
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="shopping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th>주문 제품</th>
                            <th>주문 수량</th>
                            <th>주문 금액</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${carts}" var="cart">
                           <tr>
                            <td class="product__cart__item">
                                <div class="product__cart__item__pic">
                                    <img src="/resources/dist/img/shopping-cart/cart-1.jpg" alt="">
                                </div>
                                <div class="product__cart__item__text">
                                    <h6>${cart.product.productName}</h6>
                                    <h5><fmt:formatNumber value="${cart.product.productPrice}"
									pattern="₩#,###" /></h5>
                                </div>
                            </td>
                            <td class="quantity__item">
                                <div class="quantity">
                                    <div class="pro-qty-2">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="cart__price">300,000원</td>
                            <td class="cart__close"><i class="fa fa-close"></i></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="continue__btn">
                            <a href="#">쇼핑 계속 하기</a>
                        </div>
                    </div>
<!--                     <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="continue__btn update__btn">
                            <a href="#"><i class="fa fa-spinner"></i>장바구니 새로고침</a>
                        </div>
                    </div> -->
                </div>
            </div>
            <div class="col-lg-4">
<!--                 <div class="cart__discount">
                    <h6>Discount codes</h6>
                    <form action="#">
                        <input type="text" placeholder="Coupon code">
                        <button type="submit">Apply</button>
                    </form>
                </div> -->
                <div class="cart__total">
                    <h6>장바구니 주문 총계</h6>
                    <ul>
                        <li>주문 총액 <span>$ 169.50</span></li>
                    </ul>
                    <a href="#" class="primary-btn">주문하기</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->

<!-- ****************************** footer ************************** -->
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
<!-- ****************************** end footer ************************** -->





<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />



</body>
</html>