<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<%--    <!-- meta -->--%>
<%--    <jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />--%>
<!-- Css Styles ,font -->
<jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
<jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />


<title>회원가입</title>

<!-- Custom fonts for this template-->

<%--  /resources/dist/  --%>
<link href="/resources/plugins/admin/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/dist/admin/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>
<%--<body>--%>
<body>

	<div class="container">
		<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
		<jsp:include page="/WEB-INF/views/modules/header.jsp" />
		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form class="user" action="/member/register" method="post"
								enctype="multipart/form-data">
								<div class="row">
									<div class="form-group  col-lg-6">
										<input type="text" class="form-control form-control-user"
											id="userId" placeholder="ID" name="userId" value="${regiInfo.userId}">
									</div>

									<div class="form-group   col-lg-6">
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" placeholder="Password"
											name="userPassword">
									</div>

								</div>


								<div class="form-group col-lg-6 ">
									<div id="IdExistence">아이디 중복을 확인해주세요</div>
									<input id="btn-checkId" type="button" value="id 중복 확인 "
										style="height: 40px" />
								</div>

								<div class="form-group col-lg-12">
									<div class=" col-lg-12 ">사업자 등록증 이미지 파일을 등록 후 등록 버튼을
										눌러주세요</div>
									<div class="row">
										<div class=" col-lg-6 ">
											<input type="file" id="inputed_doc" name="attach">
										</div>
										<div class=" col-lg-5  ">
											<input id="btn-checkDoc" type="button" value="등록"
												style="height: 40px" />
										</div>
									</div>


								</div>

								<div class="form-group col-lg-12">
									<div class="row">
										<input type="text" class="form-control form-control-user"
											id="userCorpNo" placeholder="사업자 등록번호 " name="userCorpNo" value="${regiInfo.userCorpNo}">
									</div>
									<input id="btn-checkInfoByDocNo" type="button" value="정보 조회  "
										style="height: 40px" />
								</div>

								<div class="form-group  col-lg-12">
									<div class="row">
										<input type="text" class="form-control form-control-user"
											id="userName" placeholder="Name" name="userName" value="${regiInfo.userName}">
									</div>

								</div>


								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="exampleInputEmail" placeholder="주소" name="userAddress" value="${regiInfo.userAddress}">
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="exampleInputEmail" placeholder="전화번호 " name="userPhone" value="${regiInfo.userPhone}">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="exampleInputEmail" placeholder="Email Address"
										name="userEmail" value="${regiInfo.userEmail}">
								</div>



								<div class="form-group ">
									<input type="submit" class="btn btn-primary btn-user btn-block"
										id="submit" value="Register Account">
								</div>
								<input type="hidden" name="userType" value="needCheck"
									id="userType"> <input type="hidden" name="userDocValid"
									value="false" id="userDocValid">

							</form>
							<hr>

							<div class="text-center">
								<a class="small" href="/member/login">Already have an
									account? Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script type="text/javascript">
	
		$(function() {
			<c:if test ="${not empty errM}">
			alert("${errM}")
			
			</c:if>	
			console.log("${errM}")
			$('#btn-checkId').on('click', function(event) {
				$.ajax({
					"url" : '/member/checkId',//해당 컨트롤러에서 리턴값으로success를 받
					"method" : "get",
					"data" : 'userId=' + $("#userId").val(),//지정된 변
					"success" : function(data, status, xhr) {
						if (data == "success") {
							$("#IdExistence").html("사용 가능합니다 ")
							/*  $("#submit").attr("disabled","able")submit*/
						} else if (data == "noId") {
							$("#IdExistence").html("사용 불가능합니다 ")

						}
					},
					"error" : function(xhr, status, err) {
						alert('삭제실패 1')
					}
				})

			});

			$('#btn-checkDoc').on( 'click', function(event) {
						const imageInput = $("#inputed_doc")[0];

						if (imageInput.files.length === 0) {
							alert("파일은 선택해주세요");
							return;
						}

						const formData = new FormData();
						formData.append("attach", imageInput.files[0]);// hashmap 형식 

						var extensionLocation = $("#inputed_doc").val()
								.lastIndexOf(".")

						var extension = $("#inputed_doc").val().substr(
								extensionLocation + 1);

						if (extension == "jpeg" || extension == "jfif"
								|| extension == "gif" || extension == "jpg"
								|| extension == "png" || extension == "ppm") {

							$.ajax({
								type : "POST",
								url : "/member/identifyCorpNo",
								processData : false,
								contentType : false,
								data : formData,
								success : function(rtn) {

									console.log("message: ", rtn)
									//$("#resultUploadPath").text(message.uploadFilePath)
									if (rtn != "fail 1") {

										if (rtn === "cropNo") {
											$("#userCorpNo").attr(
													"placeholder",
													"인식 실패. 직접 입력해 주세요. ")
													$("#userType").val("needCheck")

										} else {
											$("#userCorpNo").val(rtn)
											$("#userDocValid").val("true")
											$("#userType").val("basic")

										}
									}

								},
								err : function(err) {
									console.log("err:", err)
								}
							})
							alert("사용 가능한 파일입니다 ")

						} else {
							alert("사용 불가능한 파일입니다 ")
							$("#inputed_doc").val("")

						}

					});

			$('#btn-checkInfoByDocNo').on('click', function(event) {

				$.ajax({
					type : "POST",
					url : "/member/searchByCorpNo",
					"method" : "get",
					"data" : 'docNo=' + $("#userCorpNo").val(),
					"success" : function(data, status, xhr) {
						console.log("message: ", data)
						$("#userName").val(data)
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