<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
         
<!DOCTYPE html>
<html lang="ko">

<head>

    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />

    <title>Blank Page</title>

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
                    <h1 class="h3 mb-4 text-gray-800">비어 있는 페이지. 처음 페이지 만들 때 이거 가져가서 안에 원하는 내용 붙여넣으면 됨</h1>

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

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하기를 원하시면 하단의 [로그아웃] 버튼을 눌러주세요.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="/admin-home">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

	<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />

    <!-- Page level plugins -->
    <script src="/resources/plugins/admin/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/dist/admin/js/demo/chart-area-demo.js"></script>
    <script src="/resources/dist/admin/js/demo/chart-pie-demo.js"></script>

</body>

</html>