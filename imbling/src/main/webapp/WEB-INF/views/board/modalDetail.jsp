<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="modalDetailLabel">1:1문의</h5>
        <div> 작성자: ${board.userId} </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="modal-body">
            <form method="get" id="modalDetail">
                <input type="text" class="form-control" value="${board.boardNo}">
                <div class="form-group">
                    <label for="detailName" class="col-form-label">제목:</label>
                    <input type="text" class="form-control" id="detailName"
                           value="${board.boardTitle}">
                    <input type="hidden" class="form-control" name="boardCategory"
                           value="${board.boardCategory}">
                </div>
                <div class="form-group">
                    <label for="detailText" class="col-form-label">내용:</label>
                    <textarea class="form-control" id="detailText"
                              name="boardContent">${board.boardContent}</textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>
            </form>
    </div>
</div>