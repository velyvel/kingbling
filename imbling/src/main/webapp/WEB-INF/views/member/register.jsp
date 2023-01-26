<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <link href="/resources/plugins/admin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/dist/admin/css/sb-admin-2.min.css" rel="stylesheet">

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
                        <form class="user" action="/member/register" method="post"  enctype="multipart/form-data">
                           <div class="row">
                            <div class="form-group col-lg-6 ">
                                <input type="text" class="form-control form-control-user" id="userId"
                                       placeholder="Name" name="userName">
                            </div>
                            <div class="form-group col-lg-6 ">
                            <div id="IdExistence">아이디 중복을 확인해주세요 </div>
             		        	<input id="btn-checkId" type="button" value="id 중복 확인 " style="height:40px"  />
           		        	</div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                       placeholder="사업자 등록번호 " name="userCorpNo">
                            </div>
                            <div class="form-group">
                            	사업자 등록증 이미지 파일을 등록하세요 
                                <input type="file" id="exampleInputEmail"  name="attach" >
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                       placeholder="주소" name="userAddress">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                       placeholder="전화번호 " name="userPhone">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                       placeholder="Email Address" name="userEmail">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                       placeholder="ID" name="userId">
                            </div>
                             
                            <div class="form-group ">
                                 <input type="password" class="form-control form-control-user"
                                        id="exampleInputPassword" placeholder="Password" name="userPassword">
                            </div>
                            
                            
                            <div class="form-group ">
                                 <input type="submit" class="btn btn-primary btn-user btn-block" id="submit" value="Register Account" >
                            </div>
                            <input type="hidden" name="userType" value="basic">
                            
                        </form>
                        <hr>
                        
                        <div class="text-center">
                            <a class="small" href="/member/login">Already have an account? Login!</a>
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