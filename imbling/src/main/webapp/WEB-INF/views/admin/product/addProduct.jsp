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
                            <form class="user" action="/admin/productRegister" method="post" enctype="multipart/form-data">
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
                                <div class="form-group row" id="propertyRow0">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="productSize"
                                            id="productSize0" placeholder="상품 사이즈 입력">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" name="productColor"
                                            id="productColor0" placeholder="상품 색상 입력">
                                    </div>
                                </div>
                                <button type='button' class="btn btn-primary btn-user add-property" id="add-property0">상품 속성 추가</button><br /><br />
                                <div class="form-group">
                                    <input type="number" class="form-control form-control-user" id="productPrice"
                                        placeholder="상품 가격 입력" name="adminProductPrice">
                                </div>
                                <div class="form-group">
                                    <input type="file" class="form-control form-control-user" id="productAttach"
                                        placeholder="상품 이미지 업로드" name="productAttach" />
                                </div>
                                <button class="btn btn-primary btn-user btn-block" id="addNewProduct" type="submit">
                                    상품 등록
                                </button>

                            </form>
                            <hr>

                        </div>
                    </div>
                    <div class="col-lg-5">
                    	<img id="showProductImage" src=""></img>
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
	var categoryNo = "";
	$('.dropdown-menu').on('click','.dropdown-item',function(event){
		categoryNo = $(this).data("cateno");
		$('#categoryNo').text($(this).text());
		$('#hiddenCategoryNo').val(categoryNo);
	});
	var propertyIndex = 0;
	$('form').on('click',"#add-property"+propertyIndex,function(event){
		$("#add-property"+propertyIndex).hide();
		propertyIndex+=1
		var propertyStr = "<div class='form-group row' id='propertyRow"+propertyIndex+"'>";
		propertyStr+="<div class='form-group row' id='propertyRow"+propertyIndex+"'>";
		propertyStr+="<div class='col-sm-6 mb-3 mb-sm-0'>"
		propertyStr+="<input type='text' class='form-control form-control-user' name='productSize' id='productSize"+propertyIndex+"' placeholder='상품 사이즈 입력'>";
		propertyStr+="</div>";
		propertyStr+="<div class='col-sm-6'>";
		propertyStr+="<input type='text' class='form-control form-control-user' name='productColor' id='productColor"+propertyIndex+"' placeholder='상품 색상 입력'>";
		propertyStr+="</div>";
		propertyStr+="</div>";
		propertyStr+="<button type='button' class='btn btn-primary btn-user add-property' id='add-property"+propertyIndex+"'>상품 속성 추가</button><br /><br />";
		
		$("#add-property"+(propertyIndex-1)).after(propertyStr);
	});
	
	$("#productAttach").on('change',function(event) {
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

						    var reader = new FileReader();
						    console.log("reader:"+reader);
						    console.log("e.target.result1:"+$(this).target);
						    reader.onload = function(e) {
						    console.log("e.target.result2:"+e.target.result);
						      document.getElementById('showProductImage').src = e.target.result;
						    };
						    reader.readAsDataURL($('#productAttach').files);
					
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
		return true;
	});
	

	
});
</script>

</html>