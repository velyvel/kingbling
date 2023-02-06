<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />
    <!-- Css Styles ,font -->
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
<jsp:include page="/WEB-INF/views/modules/header.jsp" />

<!-- ****************************** cart ************************** -->
<section class="shopping-cart spad">
<h2 style="display: flex;align-content:center;padding-bottom:30px;">
<i class="fa fa-shopping-basket" style="margin:auto">장바구니</i></h2>
    <div class="container">
        <div class="row" id="cartList">

        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->

<!-- ****************************** footer ************************** -->
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
<!-- ****************************** end footer ************************** -->

<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />

<script type="text/javascript">
$(function(){
	
	$('#cartList').load("cartlist");
	
	$('#cartList').on('click',"i[id *= 'cartDelete']",function(event){// 상품 하나 카트에서 삭제하기
		var deleteNo = $(this).data("propertyno");
		$.ajax({
			url:"/userOrder/deleteFromCart",
		    type : 'get',
		    dataType : 'text',// 반환 데이터 타입 (html, xml, json, text 등등)
		    data : {"propertyNo":deleteNo},
		    success : function(result) { // 결과 성공 콜백함수
		    	$('#cartList').load("cartlist");
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		    	alert('에러');
		        console.log(error);
		    }
	    });
	});

	$('#cartList').on("click",".pro-qty-2 i",function(event){//상품 갯수 수정+전체 금액 수정(화살표 클릭)
		var proNo = $(this).data("prono");
		var cartEA = Number($("#cartEA"+proNo).val());
		var maxEA = Number($("#maxEA"+proNo).val());
		if($(this).hasClass("fa fa-arrow-up")){
			if(cartEA>=maxEA){
				alert('재고가 '+maxEA+'개 남은 상품 입니다.');
				return false;
			}
			cartEA = cartEA + 1;
		}else if($(this).hasClass("fa fa-arrow-down")){
			if(cartEA<=5){
				alert('최소 주문수량은 5개입니다.');
				return false;
			}
			cartEA = cartEA - 1;
		}
		$.ajax({
			url:"/userOrder/updateCartInfo",
		    type : 'post',
		    dataType : 'text',       // 반환 데이터 타입 (html, xml, json, text 등등)
		    data : {"propertyNo":proNo,"cartEA":cartEA,"productPrice":$(this).data("singleprice")},
		    success : function(result) { // 결과 성공 콜백함수
		    	$('#cartList').load("cartlist");
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		    	alert('에러');
		        console.log(error);
		    }
	    });
	});

	$('#cartList').on("change",".pro-qty-2 input",function(event){//상품 갯수 수정+전체 금액 수정(숫자 입력)
		var proNo = $(this).data("prono");
		var cartEA = Number($("#cartEA"+proNo).val());
		var maxEA = Number($("#maxEA"+proNo).val());
		if(cartEA<5){
			alert('최소 주문수량은 5개입니다.');
			$("#cartEA"+proNo).val(5);
			cartEA=5;
		}else if(cartEA>maxEA){
			alert('재고가 '+maxEA+'개 남은 상품 입니다.');
			$("#cartEA"+proNo).val(maxEA);
			cartEA =$("#cartEA"+proNo).val();
		}
		$.ajax({
			url:"/userOrder/updateCartInfo",
		    type : 'post',
		    dataType : 'text',       // 반환 데이터 타입 (html, xml, json, text 등등)
		    data : {"propertyNo":proNo,"cartEA":cartEA,"productPrice":$(this).data("singleprice")},
		    success : function(result) { // 결과 성공 콜백함수
		    	$('#cartList').load("cartlist");
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		    	alert('에러');
		        console.log(error);
		    }
	    });
	});
	
	$('#cartList').on("click",".chk i",function(event){//체크박스 클릭
		var proNo = $(this).data("prono");
		if($(this).hasClass('fa-square-o')){
			$(this).removeClass();
			$(this).addClass('fa fa-check-square-o');
		}else if($(this).hasClass('fa-check-square-o')){
			$(this).removeClass();
			$(this).addClass('fa fa-square-o');
		}
 		$.ajax({
			url:"/userOrder/updateCartChk",
		    type : 'post',
		    dataType : 'text',       // 반환 데이터 타입 (html, xml, json, text 등등)
		    data : {"propertyNo":proNo},
		    success : function(result) { // 결과 성공 콜백함수
		    	$('#cartList').load("cartlist");
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		    	alert('에러');
		        console.log(error);
		    }
	    });
	});
	
	$("#cartList").on('click',"#chk-order",function(event){//선택상품 주문
		if (!$('.chk i').hasClass('fa-check-square-o')){
			return false;
		}
		
		location.href="/userOrder/doOrderCheckedCart";
	});
	
	$("#cartList").on('click',"#chk-delete",function(event){//선택상품 삭제
		if (!$('.chk i').hasClass('fa-check-square-o')){
			return false;
		}
		$.ajax({
			url:"/userOrder/deleteCheckedFromCart",
		    type : 'get',
		    dataType : 'text',// 반환 데이터 타입 (html, xml, json, text 등등)
		    success : function(result) { // 결과 성공 콜백함수
		    	$('#cartList').load("cartlist");
		    },
		    error : function(request, status, error) { // 결과 에러 콜백함수
		    	alert('에러');
		        console.log(error);
		    }
	    });
	});
	
	
});
</script>

</body>
</html>