<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <div class="card shadow mb-4">
        <div class="card">

            <!-- ****************************** end of card header ************************** -->
            <!-- ****************************** accordion(자주 묻는 질문) ************************** -->
            <div class="card-body">
                <div class="tab-content">
                    <!-- ****************************** 주문, 결제 ************************** -->
                    <div class="active tab-pane" id="order">
                                배송문의 게시판 에이젝스 페이지
<%--                        <div class="accordion" id="orderExample">--%>
<%--                            <div class="card">--%>
<%--                                <c:forEach var="faq" items="${faqs}">--%>

<%--                                <div class="card-header" id="orderHeadingOne">--%>
<%--                                    <h2 class="mb-0">--%>
<%--                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#orderCollapseOne" aria-expanded="true" aria-controls="orderCollapseOne">--%>
<%--                                             공지사항 번호: #${faq.faqNo}, 제목:${faq.faqTitle}--%>
<%--                                        </button>--%>
<%--                                    </h2>--%>
<%--                                </div>--%>

<%--                                <div id="orderCollapseOne" class="collapse" aria-labelledby="orderHeadingOne" data-parent="#orderExample">--%>
<%--                                    <div class="card-body">--%>
<%--                                        ${faq.faqContent}--%>
<%--                                        <hr>--%>
<%--                                        <a class="btn btn-success" href="faqEdit?faqNo=${faq.faqNo}&pageNo=${pageNo}&faqCategory=${faq.faqCategory}">글 수정</a>--%>
<%--                                        <input type="button" id="faqDeleteBtn" value="글 삭제" class="btn btn-warning">--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                                </c:forEach>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">


    $(function (){

    });

</script>
