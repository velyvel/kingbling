<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />

<title>User List</title>

</head>
<style>
.btn-icon-split {
  width: 100px
}
</style>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="/WEB-INF/views/modules/admin/admin-sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">

				<jsp:include page="/WEB-INF/views/modules/admin/admin-topbar.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">유저 관리</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">사용자 목록</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>id</th>
											<th>계정 삭제 여부</th>
											<th>이름</th>
											<th>사용자 타입</th>
											<th>사업자 등록번호</th>
											<th>사업자 등록증 사진</th>
											<th>사업자 등록증 유효성</th>

											<th>수정 버튼</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${ allUser }">
											<tr>
												<td>${ user.userId }</td>
												<td><c:choose>
														<c:when test="${  user.userActiveState  }">
															<a style="width: 100px"
																class="btn btn-danger btn-icon-split">활동 중지 </a>
														</c:when>
														<c:otherwise>
															<a style="width: 100px"
																class="btn btn-success btn-icon-split">활동 중  </a>
														</c:otherwise>
													</c:choose></td>

												<td>${ user.userName }</td>
												<td>${ user.userType }</td>
												<td>${ user.userCorpNo }</td>
												<td><a>${ user.userName }</a></td>
												<td><c:choose>
														<c:when test="${  user.userDocValid  }">
															<a style="width: 100px"
																class="btn btn-success btn-icon-split">식별 완료 </a>
														</c:when>
														<c:otherwise>
															<a style="width: 100px"
																class="btn btn-danger btn-icon-split">식별 필요 </a>
														</c:otherwise>
													</c:choose></td>
												<td><a style="width: 100%"
													data-user-id=${ user.userId }
													class="btn btn-primary btn-icon-split editUserInfo ">수정
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>


				</div>
				<!-- /.container-fluid -->

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
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


	<!-- ****************************** 모달  ************************** -->

	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">계정 수정</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form  action="/member/edit" method="post">
				<div class="modal-body">
				
					<div class="form-group">userId <input  name="userId" id="userId" type="text"></div>
					<div class="form-group"> userName  <input name="userName" id="userName" type="text"> </div>
					<div class="form-group">userPhone  <input name="userPhone" id="userPhone" type="text"></div>
					<div class="form-group">userEmail  <input name="userEmail" id="userEmail" type="text"></div>
					<div class="form-group">userType 
						<select name="userType">
							<option value="basic" >일반 사용자 </option> 
							<option value="admin" >관리자 </option> 
						</select>
					</div>
					<div class="form-group">userAddress  <input name="userAddress" id="userAddress" type="text"></div>
					
					<div class="form-group">userActiveState  <a id="userActiveState">데이터 식별 전  </a></div>
					<div class="form-group">userCorpNo  <input name="userCorpNo" id="userCorpNo" type="text"></div>
					<div class="form-group">attachments  <input  id="attachments" type="text"></div>
					<div class="form-group">userDocValid  <a id="userDocValid" class="modalUserDocValid">데이터 식별 전  </a></div>
					<input type ="hidden" name="userActiveState" id ="hiddenUserActiveState">
					<input type ="hidden" name="userDocValid" id ="hiddenUserDocValid">
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소하기</button>
						<input id="submitBtn" type="submit" class="btn btn-primary"
							value="계정 수정  ">
							
					</div>
					
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- ****************************** 모달  ************************** -->

	<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />

	<script type="text/javascript">
	$(function(){
		$('.editUserInfo').on('click', function(event){
			var userid=$(this).data('user-id');
			$('#detailModal').modal('show')
			$.ajax({
					//type : "POST",
					url : "/member/detailUserInfo",
					"method" : "post",
					"data" : 'userId=' + userid ,
					"success" : function(data, status, xhr) {
						
						
						
						console.log("message: ", data)
						$('#userId').val(data.userId)
						$('#userName').val(data.userName)
						$('#userPhone').val(data.userPhone)
						$('#userEmail').val(data.userEmail)
						$('#userAddress').val(data.userAddress)
						$('#userCorpNo').val(data.userCorpNo)
						
						$('#hiddenUserDocValid').val(data.userDocValid)
						$('#hiddenUserActiveState').val(data.userActiveState)

						if(data.userActiveState){
							$('#userActiveState').html("활동 중지 ")
							$('#userActiveState').attr("class","btn btn-danger btn-icon-split")
							$('#hiddenUserActiveState').val(data.userActiveState)

						}else{
							$('#userActiveState').html("활동 중 ")
							$('#userActiveState').attr("class","btn btn-success btn-icon-split")
							$('#hiddenUserActiveState').val(data.userActiveState)

						}

						if(data.userDocValid){
							$('#userDocValid').html("식별 완료  ")
							$('#userDocValid').attr("class","btn btn-success btn-icon-split")
							$('#hiddenUserDocValid').val(data.userDocValid)

						}else{
							$('#userDocValid').html("식별 필요 ")
							$('#userDocValid').attr("class","btn btn-danger btn-icon-split")
							$('#hiddenUserDocValid').val(data.userDocValid)

						}
						
					},
					"error" : function(xhr, status, err) {
						alert('삭제실패 1')
						
					}
				})
			//alert(userid);
			
		})
		
		$('#userDocValid').on('click', function(event){
			//alert($('#hiddenUserDocValid').val())
			
			if( $('#hiddenUserDocValid').val() === "false" ){
				$('#userDocValid').html("식별 완료  ")
				$('#userDocValid').attr("class","btn btn-success btn-icon-split modalUserDocValid")
				$('#hiddenUserDocValid').val("true")

			}else{
				$('#userDocValid').html("식별 필요 ")
				$('#userDocValid').attr("class","btn btn-danger btn-icon-split modalUserDocValid")
				$('#hiddenUserDocValid').val("false")

			}
		})
		$('#userActiveState').on('click', function(event){
			//alert($('#hiddenUserActiveState').val())
			
			if( $('#hiddenUserActiveState').val() === "true" ){
				$('#userActiveState').html("활동 중  ")
				$('#userActiveState').attr("class","btn btn-success btn-icon-split modalUserDocValid")
				$('#hiddenUserActiveState').val("false")

			}else{
				$('#userActiveState').html("활동 중지 ")
				$('#userActiveState').attr("class","btn btn-danger btn-icon-split modalUserDocValid")
				$('#hiddenUserActiveState').val("true")

			}
		})

		 		
	})
</script>
</body>

</html>