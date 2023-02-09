<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />

<title>상품 목록</title>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!--  product sidebar  -->
		<jsp:include page="/WEB-INF/views/modules/admin/admin-sidebar.jsp" />
		<!--  end product sidebar  -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<jsp:include page="/WEB-INF/views/modules/admin/admin-topbar.jsp" />



				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->


					<h1 class="h3 mb-2 text-gray-800">상품 목록</h1>
					<p class="mb-4">전체 상품 목록을 조회할 수 있는 페이지 입니다.</p>
					<!-- 상품 분류 -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">상품 분류</h6>
						</div>
						<div class="card-body">
							<table class="table table-bordered" style="magin: 20px;">
								<thead>
									<tr>
										<th width="10%">상품분류</th>
										<td>
											<!-- <select aria-controls="dataTable"  class="custom-select custom-select-sm form-control form-control-sm">
												<option value="">인기상품순</option>
												<option value="">리뷰많은순</option>
												<option value="">신상품순</option>
												<option value="">낮은가격순</option>
												<option value="">높은가격순</option>
											</select> -->
											<div class="dropdown">
												<button class="btn btn-sm dropdown-toggle" type="button"
													id="dropdownMenuButton" data-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">
													Dropdown button</button>
												<div class="dropdown-menu"
													aria-labelledby="dropdownMenuButton">
													<a class="dropdown-item" href="#">Action</a> <a
														class="dropdown-item" href="#">Another action</a> <a
														class="dropdown-item" href="#">Something else here</a>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>상품재고</th>
										<td></td>
									</tr>
									<tr>
										<th>등록일자</th>
										<td></td>
									</tr>
									<tr></tr>
								</thead>
							</table>
						</div>
					</div>
					<br>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">상품 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>check</th>
											<th>상품코드</th>
											<th>상품이미지</th>
											<th>상품명</th>
											<th>상품가격</th>
											<th>재고</th>
											<th>구분</th>
											<th>색상</th>
											<th>사이즈</th>
											<th>등록일자</th>
											<th>기능(수정, 삭제, 품절)</th>
										</tr>
									</thead>
									<tbody id="product-list">

										<c:forEach var="product" items="${products}">
											<c:forEach var="property" items="${product.properties}">

												<tr data-productno="${product.adminProductNo}">
													<!-- 체크박스 --><td></td>
													<!-- 상품코드 --><td class="product__item"><h6>${product.adminProductNo}</h6></td>
													<td
														style="background-size: cover; word-break: break-all; table-layout: fixed;"
														width=50px height=50px><img
														src="${product.adminProductImage}"
														alt="${product.adminProductImage}"
														style="width: 150px; height: 150px"></td>
													<td class="product__item__text" style="padding: 20px">
														<h6>${product.adminProductName}</h6> <%-- <a class="add-cart product-name"
			data-product-no="${product.productNo}"
			data-category-no="${ categoryNo }">+ 상세페이지 보기</a> --%>
													</td>
													<td><fmt:formatNumber
															value="${product.adminProductPrice}" pattern="₩#,###" /></td>
													<!-- 재고 -->
													<td><h6>${property.productEA}</h6></td>
													<!-- 구분 -->
													<td><h6>${product.category.categoryName}</h6></td>
													<!-- 색상 -->
													<td><h6>${property.productColor}</h6></td>
													<!-- 사이즈 -->
													<td><h6>${property.productSize}</h6></td>
													<!-- 등록일자 -->
													<td><fmt:formatDate value="${ product.adminProductRegdate }" type="both" dateStyle="full" timeStyle="short" /></td>
													<!-- 기능 -->
													<td><button>수정</button><button>품절</button>
													<button class="delete_product_button" data-productno="${product.adminProductNo}">삭제</button></td>

												</tr>


											</c:forEach>
										</c:forEach>




										<%-- <c:forEach var="product" items="${products}">
											<tr>
												<td></td>
												<td class="product__item">
													<!--  -->
												<td
													style="background-size: cover; word-break: break-all; table-layout: fixed;"
													width=50px height=50px><img
													src="${product.adminProductImage}"
													alt="${product.adminProductImage}"
													style="width: 150px; height: 150px"></td>
												<td class="product__item__text" style="padding: 20px">
													<h6>${product.adminProductName}</h6> <a class="add-cart product-name"
			data-product-no="${product.productNo}"
			data-category-no="${ categoryNo }">+ 상세페이지 보기</a>
												</td>
												<td><fmt:formatNumber
														value="${product.adminProductPrice}" pattern="₩#,###" /></td>


												<!-- 재고 -->
												<td><h6>${product.properties[0].productEA}</h6></td>
												<!-- 구분 -->
												<td><h6>${product.category.categoryName}</h6></td>
												<!-- 색상 -->
												<td><h6>${product.properties[0].productColor}</h6></td>
												<!-- 사이즈 -->
												<td><h6>${product.properties[0].productSize}</h6></td>
												<!-- 등록일자 -->
												<td><h6>${ product.adminProductRegdate }</h6></td>
												<!-- 기능 -->
												<td></td>

											</tr>
										</c:forEach> --%>

									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
				<!-- /.container-fluid -->

				<!-- 복사중 @@@ -->
				<section class="shop spad">
					<div class="row ">
						<div class="col-lg-12">



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
											<div class="shop__product__option__right"></div>
										</div>
									</div>
								</div>
								<!-- 								 end of product category -->

								<!-- 								product list by category -->
								<div id="product-list" class="row"></div>
								<!--  								 end of product list by category -->

								<!-- 								paging -->
								<div class="row">
									<div class="col-lg-12">
										<div class="product__pagination">
											<a class="active" href="#">1</a> <a href="#">2</a> <a
												href="#">3</a> <span>...</span> <a href="#">21</a>
										</div>
									</div>
								</div>
								<!-- end of paging -->
							</div>
						</div>
					</div>
				</section>
				<!-- ****************************** end product list ************************** -->
			</div>
			<!-- End of Main Content -->

		</div>
		<!-- End of Main Content -->
		<!-- Footer -->
		<footer class="sticky-footer bg-white">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright &copy; Your Website 2020</span>
				</div>
			</div>
		</footer>
		<!-- End of Footer -->
	</div>
	<!-- End of Page Wrapper -->

	<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
	<script type="text/javascript">
		 		$(function() {
		
/* 		 $('#product-list').load("product-list?categoryNo="+ ${categories[0].categoryNo}); */
		
		 // 상품삭제 
		 $('.delete_product_button').on('click', function(event) {
			 const productNo = $(this).data("productno");
			 
			const ok = confirm(productNo + " 번 글을 삭제할까요?");
			if (!ok) return;
			
			// location.href = '${product.productNo}/delete.action?';
			$.ajax({
				 "url" : "/admin/delete-product",
				 "method" : "get",
				 "data" : "productNo=" + productNo,
				 "success" : function(result, status, xhr) {
					 console.log(result);
					 $('tr[data-productno=' + productNo + ']').remove();
				 },
				 "error" : function(xhr, status, err) {
				 	alert('error');
				 }
			});
		});
/* 		 $('#product-list').on('click', 'button.delete-product', function(event) {
		 var propertyNo = $(this).data('product-no1');

		 $.ajax({
		 "url" : "/delete-product",
		 "method" : "get",
		 "data" : "propertyNo=" + propertyNo,
		 "success" : function(result) {
			 console.log(result);
		 "error" : function(request, status, err) {
		 alert('error');
		 }
		 })
		 }); */
		
/* 		 // 상품명 또는 상품이미지 클릭시 상품상세페이지로 이동
		 $('#product-list').on('click', 'a.product-name', function(event) {
		 var productNo = $(this).data('product-no');
		 var categoryNo = $(this).data('category-no');

		 location.href= "/product/detail?productNo=" + productNo + "&categoryNo=" + categoryNo;
		 });  */
		
		 });
		 
	</script>
	<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
</body>
</html>