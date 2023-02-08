<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
         
<!DOCTYPE html>
<html lang="ko">

<head>

    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />

    <title>Order List</title>

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

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">주문 내역을 확인하세요.</h1>
                    <p class="mb-4">전체 주문 내역을 조회할 수 있는 페이지 입니다.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">주문 내역 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>주문 번호 </th>
                                            <th>주문 상태 </th>
                                            <th>주문 날짜 </th>
                                            <th>주문 요청 사항 </th>
                                            <th>주문 결제 방법 </th>
                                            <th>주문 사용자 </th>
                                            <th>주문 주소  </th>
                                            <th>주문 정보 수정 </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
 										<c:forEach var="order" items="${ orders }">
                                    
	                                        <tr>
	                                            <th>${ order.orderNo } </th>
	                                            <th>${ order.orderState } </th>
	                                            <th> ${ order.orderDate }</th>
	                                            <th>${ order.orderDeliveryRequire } </th>
	                                            <th> ${ order.orderPay }</th>
	                                            <th> ${ order.userId }</th>
	                                            <th> ${ order.orderAddr } ${ order.orderAddr2 } </th>
   	                                            <th> <a style="width: 100%"
													data-user-id=${ order.userId }
													class="btn btn-primary btn-icon-split editUserInfo ">수정
												</a></th>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />

</body>

</html>