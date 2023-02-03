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
<meta charset="UTF-8">
<title>상품리스트</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
	<jsp:include page="/WEB-INF/views/modules/header.jsp" />
	<h2>상품리스트</h2>
	<!-- ****************************** 다자인 허전하니까 뭐 넣을거긴 함 ************************** -->
	<!-- ****************************** end ************************** -->

	<!-- ****************************** product list ************************** -->
	<section class="shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">

					<!-- ****************************** product sidebar ************************** -->
					<div class="shop__sidebar">
						<div class="shop__sidebar__search">
							<form action="#">
								<input type="text" placeholder="Search...">
								<button type="submit">
									<span class="icon_search"></span>
								</button>
							</form>
						</div>
						<div class="shop__sidebar__accordion">
							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-heading">
										<a data-toggle="collapse" data-target="#collapseOne">Categories</a>
									</div>
									<div id="collapseOne" class="collapse show"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="shop__sidebar__categories">
												<ul class="nice-scroll">
													<c:forEach var="category" items="${categories}">
														<li><a class="product-category" data-category-no="${category.categoryNo}">
																${category.categoryName}</a></li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- ****************************** end product sidebar ************************** -->

				<!-- ****************************** product-option ************************** -->
				<div class="col-lg-9">
					<!-- product category -->
					<div class="shop__product__option">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__left">
									<p>Showing 1–12 of 126 results</p>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6">
								<div class="shop__product__option__right">
									<p>Sort by</p>
									<select id="sort-select">
										<option value="productCount">조회수</option>
										<option value="">인기상품</option>
										<option value="">상품리뷰</option>
										<option value="productRegdate">신상품</option>
										<option value="productPriceAsc">낮은가격</option>
										<option value="productPriceDesc">높은가격</option>
									</select>
								</div>
							</div>
						</div>
					</div>
					<!--  end of product category -->

					<!-- product list by category -->
					<div id="product-list" class="row"></div>
					<!--  end of product list by category -->

					<!-- paging -->
					<div class="row">
						<div class="col-lg-12">
							<div class="product__pagination">
								<a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a>
								<span>...</span> <a href="#">21</a>
							</div>
						</div>
					</div>
					<!-- end of paging -->
				</div>
			</div>
		</div>
	</section>
	<!-- ****************************** end product list ************************** -->

	<!-- ****************************** footer ************************** -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
	<!-- ****************************** end footer ************************** -->

	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	<script type="text/javascript">
		$(function() {
			
			$('#product-list').load("product-list?categoryNo="+ ${ categoryNo == -1 ? categories[0].categoryNo : categoryNo });
			
			// 카테고리 클릭시 그 카테고리에 해당하는 상품리스트 조회 
			$('.product-category').on('click', function(event) {
				var categoryNo = $(this).data('category-no');

				$.ajax({
					"url" : "product-list",
					"method" : "get",
					"data" : "categoryNo=" + categoryNo,
					"success" : function(data, status, xhr) {
						$('#product-list').load("product-list?categoryNo="+ categoryNo);
					},
					"error" : function(data, status, err) {
						alert('error');
					}
				})
			});
			

			$('#product-list').on('click', 'a.heart-btn', function(event) {
				var productNo3 = $(this).data('product-no3');
				
				location.href = "/mypage/heart?productNo=" + productNo3;
			});
			
			// 상품명 또는 상품이미지 클릭시 상품상세페이지로 이동
			$('#product-list').on('click', 'a.product-name', function(event) {
				var productNo = $(this).data('product-no');
				var categoryNo = $(this).data('category-no');

				location.href = "/product/detail?productNo=" + productNo + "&categoryNo=" + categoryNo;
			});
			
			$('#product-list').on('click', 'div.product-image', function(event) {
				var productNo2 = $(this).data('product-no2');
				var categoryNo2 = $(this).data('category-no2');

				location.href = "/product/detail?productNo=" + productNo2 + "&categoryNo=" + categoryNo2;
			});
			
			// 정렬 옵션 클릭시 해당하는 기준으로 상품리스트 정렬 
			$("#sort-select").on('change', function(event) {
				option = $(this).find("option:selected");
				const sort = option.attr('value');
				
				const categoryNo = ${ categoryNo == -1 ? categories[0].categoryNo : categoryNo };

				$('#product-list').load("product-list?categoryNo="+ categoryNo + "&sort=" + sort);
				
			});
			
			
		});
	</script>


</body>
</html>