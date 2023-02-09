<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta -->
<jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />
<!-- Css Styles ,font -->
<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
<jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />
<meta charset="UTF-8">
<title>상품상세 페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
	<jsp:include page="/WEB-INF/views/modules/header.jsp" />

	<!-- ****************************** detail header ************************** -->
	<section class="shop-details">
		<div class="product__details__pic">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="product__details__breadcrumb">
							<a href="/">홈</a><a class="back-list">${product.category.categoryName}</a><span>${product.productName}</span>
						</div>
					</div>
				</div>

				<!-- ****************************** end detail header ************************** -->
				<!-- ****************************** show product detail ************************** -->
				<div class="row">
					<div class="col-lg-3 col-md-3"></div>
					<div class="col-lg-6 col-md-9">
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__pic__item">
									<img src="${product.productImage}" alt="" sizes="100px">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ****************************** end show product detail ************************** -->

		<!-- ****************************** show middle, 상품 상세 설명 ************************** -->
		<div class="product__details__content">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-8">
						<div class="product__details__text">
							<input type="hidden" value="${loginuser.userId}" id="user-id" />
							<h4>${product.productName}</h4>
							<span><i class="fa-solid fa-person"></i>${product.productCount}</span>
							<div class="rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star-o"></i> <span> - 5 Reviews</span>
							</div>
							<h3>
								<fmt:formatNumber value="${product.productPrice}"
									pattern="₩#,###" />
							</h3>
							<div class="product__details__option">
								<%-- ${product.properties[0].productSize} / ${product.properties[0].productColor} --%>
								<div class="product__details__option__size">
									<div>Size:</div>
									<select id="product-size">
										<c:forEach var="property" items="${product.properties}">
											<option value="${property.productSize}">${property.productSize}</option>
										</c:forEach>
									</select>
								</div>
								<div class="product__details__option__color">
									<div>Color:</div>
									<select id= "product-color">
										<c:forEach var="property" items="${product.properties}">
											<option value="${property.productColor}">${property.productColor}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="product__details__cart__option">
								<div class="quantity">
									<div class="pro-qty">
										<span class="fa fa-angle-up dec qtybtn" aria-hidden="true"
											data-product-no="${product.productNo}"></span>
											<input id="product-ea" type="text" value="5">
												<%-- <c:forEach var="product" items="${product}">
													<c:set var="i" value="${i+1}" />
													<c:if test="${product.properties[i].productSize }">
													</c:if>
												</c:forEach> --%>
										<input type="hidden" id="max-ea" value="${product.properties[0].productEA}"/>
										<span class="fa fa-angle-down inc qtybtn" aria-hidden="true"
											data-product-no="${product.productNo}"></span>
									</div>
								</div>
								<button id="doOrder" class="primary-btn">
									<i class="fa-regular fa-credit-card"></i> 결제하기
								</button>
								<button id="addToCart" class="primary-btn">
									<i class="fa-solid fa-cart-plus"></i> 장바구니
								</button>
								<input type="hidden" value="${productNo}" id="productNo" />

								<div class="product__details__option__size">
									<c:set var="isChecked" value="false" />
									<c:forEach var="productNo" items="${ hearts }">
										<c:if test="${ productNo == product.productNo }">
											<c:set var="isChecked" value="true" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${isChecked}">
											<a id="add-to-heart" class="primary-btn" style="border: 1px solid lightgray; background-color: white;">
												<img src="/resources/dist/img/icon/full-heart.png" />
											</a>
										</c:when>
										<c:otherwise>
											<a id="add-to-heart" class="primary-btn" style="border: 1px solid lightgray; background-color: white;">
												<img src="/resources/dist/img/icon/empty-heart.png" />
											</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="product__details__last__option">
								<h5>
									<span>Guaranteed Safe Checkout</span>
								</h5>
								<img src="/resources/dist/img/shop-details/details-payment.png"
									alt="">
							</div>
						</div>
					</div>
				</div>
				<!-- ****************************** end show middle 상품 상세 설명 ************************** -->
				<!-- ****************************** 상품정보 / 상품후기 / 문의사항 ************************** -->
				<div class="row">
					<div class="col-lg-12">
						<div class="product__details__tab">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#tabs-5" role="tab">상품정보</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-6" role="tab">상품후기</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#tabs-7" role="tab">문의사항</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-5" role="tabpanel">
									<div class="product__details__tab__content">
										<p class="note">상품설명</p>
										<div class="product__details__tab__content__item">
											<h5>Products Infomation</h5>
											<p>${product.productContent}</p>
										</div>
									</div>
								</div>
<%--			상품후기					--%>
								<div class="tab-pane" id="tabs-6" role="tabpanel">
									<div class="product__details__tab__content">
										<div class="product__details__tab__content__item">

											<div class="card shadow mb-4">
												<div class="card-header py-3">
													<span>후기</span>
												</div>
												<div class="card-body">
													<div class="table-responsive">
														<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">


															<thead>
															<tr>
																<th>상품명</th>
																<th>제목</th>
																<th>작성자</th>
																<th>조회수</th>
															</tr>
															</thead>
															<tbody>
															<c:forEach var="review" items="${reviews}">
																<tr>
																	<td>${review.productDto.productName}</td>
																	<td><a href="/board/reviewDetail?reviewNo=${review.reviewNo}">${review.reviewTitle}</a></td>
																	<td>${review.userId}</td>
																	<td>${review.reviewCount}</td>
																</tr>
															</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane" id="tabs-7" role="tabpanel">
									<div class="product__details__tab__content">
										<p class="note">Nam tempus turpis at metus scelerisque
											placerat nulla deumantos solicitud felis. Pellentesque diam
											dolor, elementum etos lobortis des mollis ut risus. Sedcus
											faucibus an sullamcorper mattis drostique des commodo
											pharetras loremos.</p>
										<div class="product__details__tab__content__item">
											<h5>Products Infomation</h5>
											<p>A Pocket PC is a handheld computer, which features
												many of the same capabilities as a modern PC. These handy
												little devices allow individuals to retrieve and store
												e-mail messages, create a contact file, coordinate
												appointments, surf the internet, exchange text messages and
												more. Every product that is labeled as a Pocket PC must be
												accompanied with specific software to operate the unit and
												must feature a touchscreen and touchpad.</p>
											<p>As is the case with any new technology product, the
												cost of a Pocket PC was substantial during it’s early
												release. For approximately $700.00, consumers could purchase
												one of top-of-the-line Pocket PCs in 2003. These days,
												customers are finding that prices have become much more
												reasonable now that the newness is wearing off. For
												approximately $350.00, a new Pocket PC can now be purchased.</p>
										</div>
										<div class="product__details__tab__content__item">
											<h5>Material used</h5>
											<p>Polyester is deemed lower quality due to its none
												natural quality’s. Made from synthetic materials, not
												natural like wool. Polyester suits become creased easily and
												are known for not being breathable. Polyester suits tend to
												have a shine to them compared to wool and cotton suits, this
												can make the suit look cheap. The texture of velvet is
												luxurious and breathable. Velvet is a great choice for
												dinner party jacket and can be worn all year round.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<!-- ****************************** 상품정보 / 상품후기 / 문의사항 ************************** -->

	<!-- modal -->
	<div class="modal fade" id="cart-modal" tabindex="-1" role="dialog"aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="font-weight:bold;">쇼핑을 계속 하시겠습니까?</h5>
					<%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button> --%>
				</div>
				<div class="modal-body"><i class="fa-regular fa-circle-check"></i> 상품이 장바구니에 추가되었습니다!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">계속 쇼핑하기</button>
					<a href="/mypage/cart"><button type="button" class="btn btn-primary">장바구니로 이동</button></a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="heart-delete-modal" tabindex="-1" role="dialog"aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="font-weight:bold;">해당 상품을 관심상품 목록에서 삭제하시겠습니까?</h5>
					<%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button> --%>
				</div>
				<div class="modal-body">이미 관심상품 목록에 등록된 상품입니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">계속 쇼핑하기</button>
					<button id="delete-heart-detail" type="button" class="btn btn-primary">관심상품 해제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of modal -->
	
	<!-- alert -->
	
	<div class="position-fixed bottom-0 right-0 p-3" style="z-index: 5; right: 0; top: 0;">
		<div id="max-alert" class="toast hide" role="alert"
			aria-live="assertive" aria-atomic="true" data-delay="3000" style="width: 1000px;">
			<div class="toast-header">
				<img src="/resources/dist/img/icon/warning.png" class="rounded mr-2"
					alt="..."> <strong class="mr-auto">WARNING</strong>
				<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="toast-body" id="max-body"></div>
		</div>
	</div>
	
	<div class="position-fixed bottom-0 right-0 p-3" style="z-index: 5; right: 0; top: 0;">
		<div id="heart-alert" class="toast hide" role="alert"
			aria-live="assertive" aria-atomic="true" data-delay="3000" style="width: 1000px;">
			<div class="toast-header">
				<img src="/resources/dist/img/icon/notification.png" class="rounded mr-2"
					alt="..."> <strong class="mr-auto">NOTIFY</strong>
				<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="toast-body" id="heart-body"></div>
		</div>
	</div>
	
	<!-- end of alert -->

	<!-- ****************************** 관련상품 넣어도 그만 안넣어도 그만 ************************** -->
	<!-- ****************************** end 관심상품 ************************** -->


	<!-- ****************************** footer ************************** -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
	<!-- ****************************** end footer ************************** -->


	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp"/>
	<script type="text/javascript">
	$(function(){
		
		// 상품 수량 변경은 main.js - .pro-qty에 있음.
		// 최소 수량 5개를 넘을 수 없고 상품재고(productEA) 이상 주문할 수 없음.
		
		// 장바구니에 상품데이터 넣고 장바구니 페이지로 이동 
		$("#addToCart").on('click', function(event) {
			var productSize = $('#product-size option').val();
			var productColor = $('#product-color option').val();
			var productEA = $('#product-ea').val();
			
			$.ajax({
				url:"/userOrder/addToCart",
			    type : 'post',
			    dataType : 'text',       // 반환 데이터 타입 (html, xml, json, text 등등)
			    data : {"productNo":${product.productNo},"productPrice":${product.productPrice},"productColor":productColor,"productSize":productSize,"productEA":productEA},
			    success : function(result) { // 결과 성공 콜백함수
			    	$('#cart-modal').modal();
	//		    	location.href="/mypage/cart";
			    },
			    error : function(request, status, error) { // 결과 에러 콜백함수
					var loginuser = $('#user-id').val();
			    	
			    	if (loginuser == null) {
			    		$("#max-alert").toast('show');
						$('#max-body').html("로그인이 필요한 서비스입니다.");
			    	} else {
			    		$("#max-alert").toast('show');
						$('#max-body').html("이미 장바구니 목록에 등록된 상품입니다.");
			    	}
			    }
			    });
		});
		
		// 바로 결제 
	 	$("#doOrder").on('click', function(event) {
			
			var productSize = $('#product-size option').val();
			var productColor = $('#product-color option').val();
			var productEA = $('#product-ea').val();
			
			location.href="/userOrder/doOrder?productNo=" + ${product.productNo} + "&productSize=" + productSize + "&productColor=" + productColor + "&productEA=" + productEA;
			
		});
		
		// 상품목록 클릭시 해당 카테고리 상품리스트 페이지로 이동
		$(".back-list").on('click', function(event) {
	
			var categoryNo = ${categoryNo};
			
			location.href = "/product/list?categoryNo=" + categoryNo;
	
		});
		
		// 관심상품 상품데이터 넣음
		$("#add-to-heart").on('click', function(event) {
	
			var categoryNo = ${categoryNo};
			 $.ajax({
				url : '/add-to-heart',
			    type : 'post',
			    dataType : 'text',       // 반환 데이터 타입 (html, xml, json, text 등등)
			    data : {"productNo":${product.productNo},"categoryNo":categoryNo,"productName":"${product.productName}","productImage":"${product.productImage}","productPrice":${product.productPrice}},
			    success : function(result) { // 결과 성공 콜백함수
			    	$('#add-to-heart img').attr( "src", "/resources/dist/img/icon/full-heart.png");
			    	$("#heart-alert").toast('show');
					$('#heart-body').html("관심상품으로 등록되었습니다.");
			    },
			    error : function(request, status, error) { // 결과 에러 콜백함수
			    	var loginuser = $('#user-id').val();
			    	
			    	if (loginuser == null) {
			    		$('#log-in').toast('show');
			    	} else {
			    		$('#heart-delete-modal').modal();
			    		$('#delete-heart-detail').on('click', function(event) {
			    			$('#heart-delete-modal').modal('hide');
			    			
			    			$.ajax({
								url : '/delete-heart',
								type : 'get',
								data : 'productNo=' + ${product.productNo},
								success : function(result) {
									$("#heart-alert").toast('show');
									$('#heart-body').html("해당 상품을 관심상품 목록에서 삭제했습니다.");
									$('#add-to-heart img').attr("src", "/resources/dist/img/icon/empty-heart.png");
								},
								error : function(request, status, error) {
									alert("관심상품 삭제 실패");
								}
			 				})
			    		});
			    	}
			    }
			});
		});
		
	});
	</script>
</body>
</html>