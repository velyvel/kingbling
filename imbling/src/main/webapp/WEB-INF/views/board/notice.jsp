<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- meta -->
    <%--    <jsp:include page="/WEB-INF/views/modules/common-meta.jsp" />--%>
    <!-- Css Styles ,font -->
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />

    <title>notice</title>
</head>


<body>

<div class="container">
    <jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
    <jsp:include page="/WEB-INF/views/modules/header.jsp" />

    <a href="event"class="btn btn-secondary">게시판홈</a>
    <a href="notice"class="btn btn-secondary">공지사항</a>
    <a href="review"class="btn btn-secondary">상품후기</a>
    <br><br>


    <!-- ****************************** accordion(자주 묻는 질문) ************************** -->
    <!-- ****************************** card header ************************** -->
    <div class="card shadow mb-4">
        <div class="card">
            <div class="card-header py-3">
                <div style="float: right;">
                    <button type="button" class="btn btn-dark" style="margin-bottom: 10px;">편집하기</button>
                </div>
                <ul class="nav nav-pills">
                    <li class="nav-item"><a class="nav-link active" href="#order" data-toggle="tab">주문/결제</a></li>
                    <li class="nav-item"><a class="nav-link" href="#delivery" data-toggle="tab">배송문의</a></li>
                    <li class="nav-item"><a class="nav-link" href="#registration" data-toggle="tab">회원가입, 로그인</a></li>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">1:1문의</button>
                </ul>
            </div>
    <!-- ****************************** end of card header ************************** -->
    <!-- ****************************** accordion(자주 묻는 질문) ************************** -->
            <div class="card-body">
                <div class="tab-content">
    <!-- ****************************** 주문, 결제 ************************** -->
                    <div class="active tab-pane" id="order">
                        <div class="accordion" id="orderExample">
                            <div class="card">
                                <div class="card-header" id="orderHeadingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#orderCollapseOne" aria-expanded="true" aria-controls="orderCollapseOne">
                                            Collapsible Group Item #1
                                        </button>
                                    </h2>
                                </div>

                                <div id="orderCollapseOne" class="collapse show" aria-labelledby="orderHeadingOne" data-parent="#orderExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="orderHeadingTwo">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#orderCollapseTwo" aria-expanded="false" aria-controls="orderCollapseTwo">
                                            Collapsible Group Item #2
                                        </button>
                                    </h2>
                                </div>
                                <div id="orderCollapseTwo" class="collapse" aria-labelledby="orderHeadingTwo" data-parent="#orderExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="orderHeadingThree">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#orderCollapseThree" aria-expanded="false" aria-controls="orderCollapseThree">
                                            주문 #3
                                        </button>
                                    </h2>
                                </div>
                                <div id="orderCollapseThree" class="collapse" aria-labelledby="orderHeadingThree" data-parent="#orderExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    <!-- ****************************** end of 주문, 결제 ************************** -->
    <!-- ****************************** 배송문의 ************************** -->
                    <div class="tab-pane" id="delivery">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            배송 #1
                                        </button>
                                    </h2>
                                </div>

                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            배송 #2
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            배송 #3
                                        </button>
                                    </h2>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    <!-- ****************************** end of 배송문의 ************************** -->
    <!-- ****************************** 회원가입, 로그인 ************************** -->
                    <div class="tab-pane" id="registration">
                        <div class="accordion" id="registExample">
                            <div class="card">
                                <div class="card-header" id="registHeadingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#registCollapseOne" aria-expanded="true" aria-controls="registCollapseOne">
                                            로그인1
                                        </button>
                                    </h2>
                                </div>

                                <div id="registCollapseOne" class="collapse show" aria-labelledby="registHeadingOne" data-parent="#registExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="registHeadingTwo">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#registCollapseTwo" aria-expanded="false" aria-controls="registCollapseTwo">
                                            로그인#2
                                        </button>
                                    </h2>
                                </div>
                                <div id="registCollapseTwo" class="collapse" aria-labelledby="registHeadingTwo" data-parent="#registExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="registHeadingThree">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#registCollapseThree" aria-expanded="false" aria-controls="registCollapseThree">
                                            로그인 #3
                                        </button>
                                    </h2>
                                </div>
                                <div id="registCollapseThree" class="collapse" aria-labelledby="registHeadingThree" data-parent="#registExample">
                                    <div class="card-body">
                                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    <!-- ****************************** end of 회원가입, 로그인 ************************** -->
    <!-- ****************************** 1:1문의 ************************** -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">카테고리:</label>
                                            <input type="text" class="form-control" id="recipient-name">
                                        </div>
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">문의사항:</label>
                                            <textarea class="form-control" id="message-text"></textarea>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                    <button type="button" class="btn btn-primary">전송</button>
                                </div>
                            </div>
                        </div>
                    </div>
    <!-- ****************************** end of 1:1문의 ************************** -->
                </div>
            </div>
        </div>
    </div>
    <!-- ****************************** end of accordion ************************** -->
    <!-- ****************************** qna 리스트 보여주기 ************************** -->
    <br>
    <br>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <span>공지사항 리스트</span>
            <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                           aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
            </form>
            <%--    c:if 활용하여 adminuser일 때만 편집 가능하도록 구현--%>
            <div style="float: right;">
                <a href="noticeWrite" class="btn btn-dark" style="margin-bottom: 10px;">글쓰기</a></button>
            </div>
        </div>
        <form method="get" name="noticeWrite">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>글번호</th>
                            <th>카테고리</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>작성날짜</th>
                            <th>조회수</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="board" items="${boards}">
                            <tr>
                                <td>${board.boardNo}</td>
                                <td>${board.boardCategory}</td>
                                <td>${board.boardTitle}</td>
                                <td><a href="noticeDetail?boardNo=${board.boardNo}&pageNo=${pageNo}">${board.boardContent}</a></td>
                                <td>${board.boardRegDate}</td>
                                <td>${board.boardCount}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <nav aria-label="...">
                        <ul class="pagination">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active" aria-current="page">
                                <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

        </form>
    </div>
    <!-- ****************************** end of qna 리스트 보여주기 ************************** -->
    <!-- ****************************** 1:1 문의사항 리스트 보여주기 ************************** -->
    <br>
    <br>
<%--    <div class="card shadow mb-4">--%>
<%--        <div class="card-header py-3">--%>
<%--            <span>1:1 문의사항 리스트</span>--%>
<%--            <forme--%>
<%--                    class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">--%>
<%--                <div class="input-group">--%>
<%--                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."--%>
<%--                           aria-label="Search" aria-describedby="basic-addon2">--%>
<%--                    <div class="input-group-append">--%>
<%--                        <button class="btn btn-primary" type="button">--%>
<%--                            <i class="fas fa-search fa-sm"></i>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </forme>--%>
<%--            &lt;%&ndash;    c:if 활용하여 adminuser일 때만 편집 가능하도록 구현&ndash;%&gt;--%>
<%--            <div style="float: right;">--%>
<%--                <button type="button" class="btn btn-dark" style="margin-bottom: 10px;">편집하기</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="card-body">--%>
<%--            <div class="table-responsive">--%>
<%--                <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th>Name</th>--%>
<%--                        <th>Position</th>--%>
<%--                        <th>Office</th>--%>
<%--                        <th>Age</th>--%>
<%--                        <th>Start date</th>--%>
<%--                        <th>Salary</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td>Haley Kennedy</td>--%>
<%--                        <td>Senior Marketing Designer</td>--%>
<%--                        <td>London</td>--%>
<%--                        <td>43</td>--%>
<%--                        <td>2012/12/18</td>--%>
<%--                        <td>$313,500</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>Tatyana Fitzpatrick</td>--%>
<%--                        <td>Regional Director</td>--%>
<%--                        <td>London</td>--%>
<%--                        <td>19</td>--%>
<%--                        <td>2010/03/17</td>--%>
<%--                        <td>$385,750</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>Michael Silva</td>--%>
<%--                        <td>Marketing Designer</td>--%>
<%--                        <td>London</td>--%>
<%--                        <td>66</td>--%>
<%--                        <td>2012/11/27</td>--%>
<%--                        <td>$198,500</td>--%>
<%--                    </tr>--%>
<%--                    <tr>--%>
<%--                        <td>Paul Byrd</td>--%>
<%--                        <td>Chief Financial Officer (CFO)</td>--%>
<%--                        <td>New York</td>--%>
<%--                        <td>64</td>--%>
<%--                        <td>2010/06/09</td>--%>
<%--                        <td>$725,000</td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--                <nav aria-label="...">--%>
<%--                    <ul class="pagination">--%>
<%--                        <li class="page-item disabled">--%>
<%--                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                        <li class="page-item active" aria-current="page">--%>
<%--                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>--%>
<%--                        </li>--%>
<%--                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#">Next</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </nav>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>
<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
<script type="text/javascript">
    $('#exampleModal').on('show.bs.modal', function (event) {

    })
</script>

</body>
</html>