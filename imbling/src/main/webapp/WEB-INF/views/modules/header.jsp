<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<header class="header">
    <div class="container">
        <div class="row">
            <div>
                <div class="header__logo">
                    <a href="/"><img src="/resources/dist/img/jamlogo.png" alt="jamLogo" style="width: 60px;"></a>
                </div>
            </div>
            <div class="col-lg-10 col-lg-10">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li class="active"><a href="/">임블리홈</a></li>
                        <li><a href="/product/list">상품</a></li>
                        <li><a href="#">마이페이지</a>
                            <ul class="dropdown">
                                <li><a href="/mypage/myInfo">내 정보 관리❤️🧡💛</a></li>
                                <li><a href="/mypage/cart">장바구니</a></li>
                                <li><a href="/mypage/heart">관심상품</a></li>
                                <li><a href="/mypage/orderList">주문내역</a></li>
                                <li><a href="/mypage/myboard">내가 쓴 게시글</a></li>
                                <li><a href="/mypage/goodbye">회원 탈퇴</a></li>
                            </ul>
                        </li>
                        <li><a href="/home">Blog</a></li>
                        <li><a href="/member/login">로그인</a></li>
                        <li><a href="/member/register">회원가입</a></li>
                        <li><a href="/board/event">게시판</a>
                            <ul class="dropdown">
                                <li><a href="/board/notice">공지사항/문의</a></li>
                                <li><a href="/board/review">상품후기</a></li>
                            </ul>
                        </li>
                        <li><a href="/admin-home">관리자페이지</a></li>
                    </ul>
                </nav>
            </div>
<%--            <div class="col-lg-3 col-md-2">--%>
<%--                <div class="header__nav__option">--%>
<%--                    <a href="#" class="search-switch"><img src="/resources/dist/img/icon/search.png" alt=""></a>--%>
<%--                    <a href="#"><img src="/resources/dist/img/icon/heart.png" alt=""></a>--%>
<%--                    <a href="#"><img src="/resources/dist/img/icon/cart.png" alt=""> <span>0</span></a>--%>
<%--                    <div class="price">$0.00</div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>


</header>