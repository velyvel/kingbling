<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form action="/mypage/edit" method="post">
					<div class="row">
						<div class="col-lg-12 col-md-6">

							<h6 class="checkout__title">
								회원정보 조회 및 수정 <input type="submit">
							</h6>


							<div class="checkout__input">
								<p>
									아이디 <span>*</span>
								</p>
								${loginuser.userId}
							</div>
							<div class="checkout__input">
								<p>
									이름 <span>*</span>
								</p>
								<input type="text" value="${loginuser.userName}" name="userName">
							</div>

							<div class="checkout__input">
								<p>
									주소 <span>*</span>
								</p>
								<input type="text" value="${loginuser.userAddress}"
									name="userAddress">
							</div>
							<div class="checkout__input">
								<p>
									이메일 <span>*</span>
								</p>
								<input type="text" value="${loginuser.userEmail}"
									name="userEmail">
							</div>

							<div class="checkout__input">
								<p>
									전화번호 <span>*</span>
								</p>
								<input type="text" value="${loginuser.userPhone}"
									name="userPhone">
							</div>

						</div>
						<input type="hidden" id="userId" value="${loginuser.userId}" name="userId">

					</div>
				</form>
				<!-- <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">Your order</h4>
                                <div class="checkout__order__products">Product <span>Total</span></div>
                                <ul class="checkout__total__products">
                                    <li>01. Vanilla salted caramel <span>$ 300.0</span></li>
                                    <li>02. German chocolate <span>$ 170.0</span></li>
                                    <li>03. Sweet autumn <span>$ 170.0</span></li>
                                    <li>04. Cluten free mini dozen <span>$ 110.0</span></li>
                                </ul>
                                <ul class="checkout__total__all">
                                    <li>Subtotal <span>$750.99</span></li>
                                    <li>Total <span>$750.99</span></li>
                                </ul>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                ut labore et dolore magna aliqua.</p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div> -->
			</div>
			</form>
		</div>
		</div>
	</section>


	<!-- ****************************** footer ************************** -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
	<!-- ****************************** end footer ************************** -->





	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#btn-checkId').on('click', function(event) {
			
			
			$.ajax({
				"url" : '/member/checkId',//해당 컨트롤러에서 리턴값으로success를 받
				"method" : "get",
				"data" : 'userId='+ $("#userId").val(),//지정된 변
				"success" : function(data, status, xhr) {
					if (data == "success") {
						//alert($("#userId").val()+"아이디 확 ")
						$("#IdExistence").html("사용 가능합니다 ")
						/*  $("#submit").attr("disabled","able")submit*/ 
					} else if(data == "noId") {
						//alert('noId')//컨트롤러 오작
						$("#IdExistence").html("사용 불가능합니다 ")

					}
				},
				"error" : function(xhr, status, err) {
					alert('삭제실패 1')
				}
			})
			
			
		});
	});
	</script>


</body>
</html>