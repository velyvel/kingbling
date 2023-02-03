<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




    <c:forEach var="board2" items="${boards2}">

        <input type="text" class="form-control" value="${board2.boardNo}">
        <div class="form-group">
            <label for="detailName" class="col-form-label" >제목:</label>
            <input type="text" class="form-control" id="detailName" value="${board2.boardTitle}">
            <input type="hidden" class="form-control" name="boardCategory" value="${board2.boardCategory}">
        </div>
        <div class="form-group">
            <label for="detailText" class="col-form-label">내용:</label>
            <textarea class="form-control" id="detailText" name="boardContent">${board2.boardContent}</textarea>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>
    </c:forEach>