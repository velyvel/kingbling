<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
         
<!DOCTYPE html>
<html lang="ko">

<head>

    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />

    <title>상품 등록</title>

</head>

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

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">새로운 상품을 등록합니다.</h1>
                            </div>
                            <form class="user" action="/admin/productRegister" id="addProductForm" method="post" enctype="multipart/form-data">
                                <div class="form-group row">
                                			<input type="hidden" id="hiddenCategoryNo" name="categoryNo" />
                                		     <div class="dropdown no-arrow mb-4" style="width:50%;padding:0 1rem">
		                                        <button class="btn btn-white dropdown-toggle" type="button"
		                                        style="border:solid 1px lightgray;border-radius:10rem;width:100%;height:50px"
		                                            id="categoryNo"data-toggle="dropdown" aria-haspopup="true"
		                                            aria-expanded="false">
		                                              상품 분류 선택 <i class="fa fa-arrow-down"></i>
		                                        </button>
		                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		                                            <button type="button" data-cateno="1641" class="dropdown-item">귀걸이</button>
		                                            <button type="button" data-cateno="1642" class="dropdown-item">목걸이</button>
		                                            <button type="button" data-cateno="1643" class="dropdown-item">반지</button>
		                                            <button type="button" data-cateno="1644" class="dropdown-item">팔찌</button>
		                                            <button type="button" data-cateno="1645" class="dropdown-item">발찌</button>
		                                        </div>
		                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="productName"
                                            placeholder="상품명 입력" name="adminProductName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="productContent"
                                        placeholder="상품 설명 입력" name="adminProductContent">
                                </div>
                                <input type="hidden" id="productIndext" value=1 />
                                <div class="form-group row" id="propertyRow">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="productSize"
                                            id="productSize1" placeholder="상품 사이즈 입력">
                                    </div>
                                    <div class="col-sm-6  mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="productColor"
                                            id="productColor1" placeholder="상품 색상 입력">
                                    </div>
                                    <!--  <br />
                                        <button type='button' style="margin:12px" class="btn btn-secondary btn-user add-property" 
                                        id="add-property1">상품 속성 추가</button>  -->
                                    
                                </div>
                                <div class="form-group">
                                    <input type="number" class="form-control form-control-user" id="productPrice"
                                        placeholder="상품 가격 입력" name="adminProductPrice">
                                </div>
                                <div class="form-group">
                                    <input type="file" class="form-control form-control-user" id="productAttach"
                                        placeholder="상품 이미지 업로드" name="productAttach" />
                                </div>
                                <button class="btn btn-primary btn-user btn-block" id="addNewProduct" type="button">
                                    상품 등록
                                </button>
                            </form>
                            <hr>

                        </div>
                    </div>
                    <div class="col-lg-5">
                    	<img id="showProductImage" src="/resources/dist/img/skyblue-gem.png" style="width:400px;height:400px;margin:20px"></img>
                    </div>
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

	<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />

</body>
<script type="text/javascript">
$(function(){
	
	if(${categoryNo!=1}){
		alert('상품이 등록되었습니다.');
	}
	
	
	var categoryNo = "";
	$('.dropdown-menu').on('click','.dropdown-item',function(event){
		categoryNo = $(this).data("cateno");
		$('#categoryNo').text($(this).text());
		$('#hiddenCategoryNo').val(categoryNo);
	});
	
/*  	var productIndext = Number($('#productIndext').val());
	$('#propertyRow').on('click',"button",function(event){
		
		$("#add-property"+productIndext).hide();
		productIndext = Number(productIndext)+1;
		$('#productIndext').val(productIndext);

        
		var propertyStr = "<div class='col-sm-6 mb-3 mb-sm-0'>";
		propertyStr+="<input type='text' class='form-control form-control-user' name='productSize' id='productSize"+productIndext+"' placeholder='상품 사이즈 입력'></div>";
		propertyStr+="<div class='col-sm-6  mb-3 mb-sm-0'>";
		propertyStr+="<input type='text' class='form-control form-control-user' name='productColor' id='productColor"+productIndext+"' placeholder='상품 색상 입력'>";
		propertyStr+="</div><br />";
		propertyStr+="<button type='button' style='margin:12px' class='btn btn-secondary btn-user add-property' id='add-property"+productIndext+"'>상품 속성 추가</button>";
		
		$("#add-property"+(productIndext-1)).after(propertyStr);
	});  */
	
	$("#productAttach").on('change',function(event) { //상품 파일 올리면 이미지파일 형식인지 확인, 이미지파일이면 미리보기
				const productImage = $("#productAttach");
				const formData = new FormData();
				formData.append("attach", productImage.file);// hashmap 형식 
				var extensionLocation = $("#productAttach").val()
						.lastIndexOf(".")
				var extension = $("#productAttach").val().substr(
						extensionLocation + 1);
				if (extension == "jpeg" || extension == "jfif"
						|| extension == "gif" || extension == "jpg"
						|| extension == "png" || extension == "ppm") {
							var uploadImage = event.target.files[0];
						    var reader = new FileReader();
						    reader.onload = function(event) {
						      $('#showProductImage').attr('src',event.target.result);
						    };
						    reader.readAsDataURL(uploadImage);
				} else {
					alert("이미지 파일을 업로드하세요.")
					$("#productAttach").val("")
				}
			});
	
	$('#addNewProduct').on('click',function(event){
		if(categoryNo==""){
			alert('상품 분류를 선택하세요.');
			return false;
		}else if($("#productName").val()==""){
			alert('상품 이름을 입력하세요.');
			return false;
		}else if($("#productContent").val()==""){
			alert('상품 설명을 입력하세요.');
			return false;
		}else if($("#productSize").val()==""){
			alert('상품 사이즈를 입력하세요.');
			return false;
		}else if($("#productColor").val()==""){
			alert('상품 색상을 입력하세요.');
			return false;
		}else if($("#productPrice").val()==""){
			alert('상품 가격을 입력하세요.');
			return false;
		}else if($("#productAttach").val()==""){
			alert('상품 이미지를 등록하세요.');
			return false;
		}
		$('#addProductForm').submit();
	});
	

	
});
</script>

</html>