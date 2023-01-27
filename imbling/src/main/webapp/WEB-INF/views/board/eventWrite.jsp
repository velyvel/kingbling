<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/modules/common-css.jsp" />
    <jsp:include page="/WEB-INF/views/modules/admin/common-css.jsp" />
    <title>공지사항작성(관리자)</title>

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
            <!--=============form start========================================-->
            <form method="post" id="noticeWrite" action="noticeWrite">
                <input  type="hidden" name="attach" value="">
                <input type="hidden" name="savedFileName" value="">
            <div style="float: right;">
                <a href="notice"class="btn btn-danger"><i class="fas fa-close"></i> 취소하기</a>
                <input id="submitBtn" type="submit" class="btn btn-success" value="작성완료">
            </div>
            <h5>게시글 작성</h5>
            <%--    c:if 활용하여 adminuser일 때만 편집 가능하도록 구현--%>
        </div>
            <div class="card-body">
                <div class="col-sm-6" style="float: right;">
                    <div class="form-group">
                        <label for="boardCategory">게시판 종류</label>
                        <select class="form-control" id="boardCategory" name="boardCategory" required>
                            <option selected>게시판 종류 선택️</option>
                            <option value="1">이벤트</option>
                            <option value="2">공지사항️️</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="boardRegDate">작성날짜</label>
                        <input type="date" class="form-control" id="boardRegDate">
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="boardTitle">제목</label>
                        <input type="text" class="form-control" placeholder="공지사항제목" name="boardTitle" id="boardTitle">
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
                            <td>
                                <textarea id="boardContent" name="boardContent"></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
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

    $('#boardContent').summernote({
        placeholder: '관리자가 공지사항 작성',
        tabsize: 2,
        height: 500,
        lang:'ko-KR',
        callbacks: {	//여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files) {
                uploadSummernoteImageFile(files[0],this);
            },
            onPaste: function (e) {
                var clipboardData = e.originalEvent.clipboardData;
                if (clipboardData && clipboardData.items && clipboardData.items.length) {
                    var item = clipboardData.items[0];
                    if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                        e.preventDefault();
                    }
                }
            }
        }
    });

    function uploadSummernoteImageFile(file, editor){
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url:"/board/uploadNoticeImageFile",
            contentType: false,
            processData: false,
            success: function(data){
                $(editor).summernote('insertImage', data.url)
                $('#noticeWrite input[name=attach]').val(data.attach);
                $('#noticeWrite input[name=savedFileName]').val(data.savedFileName);

            }
        });

    }

         $(function (){
        //     $('#boardContent').summernote({
        //         dialogsInBody: true,
        //         placeholder:'공지사항 작성합니다',
        //         tabsize: 2,
        //         height: 400,
        //         onImageUpload: function(files, editor, welEditable) {
        //             // 서버로 이미지 전송
        //             uploadSummernoteImageFile(files[0], editor, welEditable);
        //         }
        //     });
        //
        //     function uploadSummernoteImageFile(file, editor, welEditable){
        //         formData = new FormData();
        //         formData.append("file", file);
        //         $.ajax({
        //             data : formData,
        //             type : "post",
        //             url : "/imbling/board/upload-image-file",
        //             cache : false,
        //             contentType : false,
        //             processData : false,
        //             success : function(url) {
        //                 editor.insertImage(welEditable, url);
        //             },
        //             error : function(err) {
        //                 alert(err + '이미지 파일 업로드에 실패했습니다.');
        //             }
        //         });
        //     }

        $('#submitBtn').on('click', function (event){
            event.preventDefault();
            const boardTitle = $('input[name = boardTitle]').val();
            const boardContent = $('textarea[name = boardContent]').val();
            const boardCategory = $('select[name=boardCategory]').val();

            if (boardTitle.length==0){
                alert("제목 빠짐")
                return;
            }else if(boardContent.length==0){
                alert("내용빠짐")
                return;
            }else if(boardCategory == null){
                alert("아이고오 카테고리가 빠졌슈")
                return;
            }else{
                $('#noticeWrite')[0].submit();
            }
        });
    });
</script>
</body>
</html>
