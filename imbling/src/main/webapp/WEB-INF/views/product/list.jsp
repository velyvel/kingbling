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
						<!-- search -->
						<div class="shop__sidebar__search">
							<form name="search-form" id="search-form">
								<input type="search" name="keyword" placeholder="Search...">
								<button type="button" id="search-btn">
									<span class="icon_search"></span>
								</button>
							</form>
						</div>
						<!-- end of search -->
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
														<li><a class="product-category"
															data-category-no="${category.categoryNo}">
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

			$('#product-list').on('click', 'img.heart-btn', function(event) {
				
				event.preventDefault();
				event.stopPropagation();
				
				var productNo = $(this).data('product-no3');
				var categoryNo = $(this).data('category-no3');
				var productName = $('#product-name').val();
				var productPrice = $('#product-price').val();
				var productImage = $('#product-image').val();
				
				// $('.heart-btn[data-product-no3=' + productNo + ']').attr( "src", "/resources/dist/img/icon/full-heart.png");
				
				$.ajax({
					url : '/add-to-heart',
				    type : 'post',
				    dataType : 'text',       // 반환 데이터 타입 (html, xml, json, text 등등)
				    data : {"productNo":productNo,"categoryNo":categoryNo,"productName":productName,"productImage":productImage,"productPrice":productPrice},
				    success : function(result) { // 결과 성공 콜백함수
				    	$('.heart-btn[data-product-no3=' + productNo + ']').attr( "src", "/resources/dist/img/icon/full-heart.png");
				    	alert('관심상품으로 등록되었습니다.');
				    },
				    error : function(request, status, error) { // 결과 에러 콜백함수
				    	var loginuser = $('#user-id').val();
				    	
				    	if (loginuser == null) {
				    		alert('로그인 후 가능한 서비스입니다.');	
				    	} /* else if (){
				    		alert('이미 관심상품 목록에 포함된 상품입니다.');	
				    	} */ else {
				    		alert('알수없는 오류가 발생하여 페이지를 초기화합니다.');
				    		$('#product-list').load("/product/product-list");
				    	}
				    }
				})
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
			
			$.numberWithCommas = function(x) {
				return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			}
			
			// 검색
			$('#search-form').on('click', '#search-btn', function(event) {
				
				event.preventDefault();
				
				const searchValue = $('input[name=keyword]').val();
				if (searchValue.length == 0) {
					alert("검색어를 입력하세요.");
					return;
				}
				
				const formData = $('form[name=search-form]').serialize();
				
				$.ajax({
					"url" : "/product/search",
					"method" : "get",
					"data" : formData,
					"success" : function(result) {
						if(result.length >= 1) {
							$('#product-list').empty(); // 테이블 초기화
							result.forEach(function(item) {
								var str = "<div class='col-lg-4 col-md-6 col-sm-6'>";
								str += "<div class='product__item'>";
								str += "<div class='product__item__pic set-bg product-image' data-product-no2='" + item.productNo + "' data-category-no2='" + item.category.categoryNo + "' style='background-image:url(" + item.productImage + ")'>";
								str += "<ul class='product__hover'>";
								str += "<li><img src='/resources/dist/img/icon/empty-heart.png' class='heart-btn' data-product-no3='" + item.productNo + "' data-category-no3='" + item.categoryNo + "'></li>"
								str += "</ul>";
								str += "</div>";
								str += "<input type='hidden' value='" + item.productImage + "' id='product-image'/>";
								str += "<div class='product__item__text'>"
								str += "<h6>" + item.productName + "</h6>";
								str += "<input type='hidden' value='" + item.productName + "' id='product-name'/>";
								str += "<a class='add-cart product-name' data-product-no='" + item.productNo + "' data-category-no='" + item.categoryNo + "'>+ 상세페이지 보기</a>"
								str += "<h5 class='product-price'>₩" + item.productPrice.toLocaleString("ko-KR") + "</h5>";
								str += "<input type='hidden' value='" + item.productPrice + "' id='product-price'/>";
								str += "</div>";
								str += "</div>"; 
								str += "</div>";
								str += "</div>"; 
							
								
								$('#product-list').append(str);
							});
						} else {
							alert("일치하는 상품이 없습니다.");
						}
						
					},
					"error" : function(err) {
						alert("검색에 실패했습니다.");
					}
				})
			});
			
			
			
		});
	</script>


</body>
</html>