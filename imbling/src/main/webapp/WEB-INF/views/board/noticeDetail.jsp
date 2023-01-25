<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />
    <title>상품후기작성</title>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <jsp:include page="/WEB-INF/views/modules/common-offcanvas.jsp" />
    <jsp:include page="/WEB-INF/views/modules/header.jsp" />

    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <form method="get" id="noticeDetail" action="noticeDetail">
            <div style="float: right;">
                <a href="notice"class="btn btn-danger"><i class="fas fa-sticky-note"></i>목록보기</a>
                <a href="event"class="btn btn-danger"><i class="fas fa-sticky-note"></i>목록보기2</a>
                <input type="button" id="editBtn" value="글 수정" class="btn btn-success">
            </div>
            <h5>상세보기</h5>
            <%--    c:if 활용하여 adminuser일 때만 편집 가능하도록 구현--%>
        </div>
            <div class="card-body">
                <div class="col-sm-6" style="float: right;">
                    <div class="form-group">
                        <label>게시판 종류</label>
                        <select class="form-control">
                            <option selected>게시판 종류 선택️</option>
                            <option name="boardCategory" value="1">공지사항</option>
                            <option name="boardCategory" value="2">이벤트️️</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>작성날짜</label>
                        <input type="date" class="form-control">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="form-group">
                        <label>제목</label>
                        <input type="text" class="form-control" placeholder="공지사항제목" name="boardTitle" readonly>${board.boardTitle}
<%--                        <input type="hidden" class="form-control" readonly name="boardNo" value="${board.boardNo}">--%>
<%--                        <input type="hidden" class="form-control" readonly value="userNo">--%>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                        <thead hidden>
                        <tr>
                            <th>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="align-content: center;">
                                <textarea style="width: 1000px; height: 500px;" readonly>${board.boardContent}</textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <%--                <div class="form-group">--%>
                    <%--                    <div class="btn btn-default btn-file">--%>
                    <%--                        <i class="fas fa-paperclip"></i> Attachment--%>
                    <%--                        <input type="file" name="attachment">--%>
                    <%--                    </div>--%>
                    <%--                    <p class="help-block">첨부파일 최대: 32MB</p>--%>
                    <%--                </div>--%>
                </div>
            </div>
        </form>
    </div>
</div>
<br>
<br>

<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
<jsp:include page="/WEB-INF/views/modules/common-js.jsp" />
<jsp:include page="/WEB-INF/views/modules/admin/common-js.jsp" />
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script src="/resources/dist/js/summernote-ko-KR.js"></script>
<script type="text/javascript">
    $(function (){
        $('#editBtn').on('click', function (event){
            location.href='noticeEdit?boardNo=${board.boardNo}&pageNo=${pageNo}';
        })
    });


</script>
</body>
</html>
