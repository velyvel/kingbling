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
								회원정보 조회 및 수정 <input type="submit"> <input
									style="float: right;" type="button" id="deleteId"
									value="계정 삭제 ">


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
						<input type="hidden" id="userId" value="${loginuser.userId}"
							name="userId">

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

			<!-- ****************************** 모달  ************************** -->

			<div class="modal fade" id="deleteIdModal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">계정 삭제 userId
								: ${loginuser.userId}</h5>

							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<div class="form-group">
								<label for="recipient-name" class="col-form-label">1.
									회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</label>
								<p>
									- 회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.<br> - 거래정보가 있는 경우, 전자상거래
									등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한
									기록은 5년동안 보존됩니다.<br> - 유효기간이 경과되지 않은 미사용 쿠폰관련 정보는 유효기간
									만료일까지 보관되며, 탈퇴 후에도 유효기간 내 사용하실 수 있습니다.<br> - 유효기간 내 사용하지
									못한 미사용 쿠폰은 구매금액의 70%를 임블캐시로 적립해 드리나, 탈퇴시 적립 받을 수 없습니다.<br>
									- 회원탈퇴 후 쿠팡 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자
									본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.<br> - 상품문의 및 후기, 댓글
									삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.<br> - 이미
									결제가 완료된 건은 탈퇴로 취소되지 않습니다.<br>


								</p>
								<input type="checkbox" id="agreeDelete" value="agreeDelete ">동의합니다
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">탈퇴를 위한
									계정의 비밀번호를 작성해 주세요 :</label> <input type="hidden" name="userId"
									value=${loginuser.userId } id="userId"> <input
									type="password" name="userPassword" id="userPassword">

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">취소하기</button>
								<input id="submitBtn" type="button" class="btn btn-primary"
									value="계정 삭제 " disabled>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ****************************** 모달  ************************** -->

	</section>


	<!-- ****************************** footer ************************** -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
	<!-- ****************************** end footer ************************** -->





	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	<!-- <script src="https://code.jquery.com/jquery-3.6.1.js"></script> 인쿨루드에 있음  -->
	<script type="text/javascript">
		$(function() {
			
			$('#deleteId').on('click', function(event) {
				//console.log("message: ")

				event.preventDefault();
				const yn = confirm("계정을 삭제하겠습니까?");
				if (!yn)
					return;

				$('#deleteIdModal').modal('show')

			});
			
			$('#agreeDelete').on('click', function(event) {
				var checked =$("#agreeDelete").is(':checked');
				
				$("#submitBtn").attr("disabled", !checked);

			});
			$('#submitBtn').on('click', function(event) {
				
				$.ajax({
					url : "/mypage/deleteIdModal",
					"method" : "post",
					"data" : 'userId=' + $("#userId").val()+'&userPassword='+ $("#userPassword").val() ,
					"success" : function(data, status, xhr) {
//						console.log("message: ", data)
						if(data=="success"){
							alert('계정이 삭제되었습니다.')
							location.href = '/home';

						}else if(data="wrongIdOrPw"){
							alert('비밀번호가 틀렸습니다.')

						}
					},
					"error" : function(xhr, status, err) {
					}
				})

			});

		});
	</script>



</body>
</html>