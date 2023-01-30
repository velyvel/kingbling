<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<thead>
<tr>
    <th style="width: 20%;">작성자</th>
    <th style="width: 60%;">내용</th>
    <th style="width: 20%;">작성날짜</th>
</tr>
</thead>
<tbody>
<c:forEach var="comment" items="${comments}">
<tr>
    <td>${board.userId}</td>
    <td>${comment.commentContent}</td>
    <td>${comment.commentRegDate}</td>
</tr>


</c:forEach>
</tbody>

<%--    <tbody>--%>
<%--        <tr>--%>
<%--            <td>${session.loginuser}</td>--%>
<%--            <td>${comment.commentContent}</td>--%>
<%--            <td>${comment.commentRegDate}</td>--%>
<%--        </tr>--%>
<%--    </tbody>--%>

<%--    <tr>--%>
<%--        <td>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <div id="comment-view-area-${ comment.commentNo }">--%>
<%--&lt;%&ndash;                            ${board.boardNo}&ndash;%&gt;--%>
<%--                                [${ comment.commentRegDate }]--%>
<%--                                <br /><br />--%>
<%--                        ${comment.commentContent}--%>
<%--&lt;%&ndash;                                <span>${ fn:replace(comment.content, enter, "<br>") }</span>&ndash;%&gt;--%>
<%--                                <br /><br />--%>
<%--                                </div>--%>
<%--                    </div>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </td>--%>
<%--    </tr>--%>

