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
    <title>임블리 사이트</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
<jsp:include page="/WEB-INF/views/modules/header.jsp" />

<!-- ****************************** main ************************** -->
    <div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">주문 목록</h6>
    </div>
    <div class="card-body">
		<div>
			<select class="custom-select" size="3">
			  <option selected>전체보기</option>
			  <option value="주문완료">주문완료</option>
  			  <option value="상품준비중">상품준비중</option>
			  <option value="배송중">배송중</option>
			  <option value="배송완료">배송완료</option>
  			  <option value="구매확정">구매확정</option>
  			  <option value="주문취소">주문취소</option>
  			  <option value="반품교환신청">반품/교환신청</option>
			</select>
		</div>
        <div class="table-responsive">

			<br>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>주문번호</th>
                    <th>주문자</th>
                    <th>주문일자</th>
                    <th>주문총액</th>
                    <th>주문상태</th>
                    <th>결제정보</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><a href="/mypage/orderList-detail">12313</a></td>
                    <td>aaa</td>
                    <td>2011/08/14</td>
                    <td>$163,000</td>
                    <td>주문완료</td>
                    <td>신용카드</td>
                </tr>
                <tr>
                    <td><a href="/mypage/orderList-detail">23224</a></td>
                    <td>bbb</td>
                    <td>2011/03/21</td>
                    <td>$95,400</td>
                    <td>배송완료</td>
                    <td>카카오페이</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- ****************************** footer ************************** -->
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
<!-- ****************************** end footer ************************** -->

<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />



</body>
</html>