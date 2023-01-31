<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<thead>
<tr>
    <th>날짜</th>
    <th>작성자</th>
    <th>내용</th>
</tr>
</thead>
<tbody>
                    <tbody>
                    <c:forEach var="board" items="${boards}">
                        <tr>
                            <td>${board.boardRegDate}</td>
                            <td>${board.boardTitle}</td>
                            <td>${loginuser.userName}</td>
                            <td><button type="button" class="btn btn-primary" id="showMemo">상세보기</button></td>
                        </tr>
                    </c:forEach>
                    </tbody>

</tbody>


<script type="text/javascript">

</script>
