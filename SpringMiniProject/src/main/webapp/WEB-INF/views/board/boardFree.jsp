<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<%-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">--%>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" type="text/css" href="${root}/css/board/boardForm.css">
    <style type="text/css">
        *{
            font-family: Noto Sans KR;
        }
        /*li>a.page-link{*/
        /*    display: block;*/
        /*    justify-content: center;*/
        /*    align-items: center;*/
        /*    vertical-align: middle;*/
        /*    text-align: center;*/
        /*    margin: auto;*/
        /*    background-color: white;*/
        /*    width: 50px;*/
        /*}*/
        /*ul.pagination{*/
        /*    justify-content: center;*/
        /*}*/
        /*table>td>a{*/
        /*    text-decoration: none;*/
        /*}*/
    </style>
    <script>
        $(function (){

        });
    </script>
</head>
<body>
<div class="container" style="width: 1000px; padding: 50px;">
    <c:set var="root" value="<%=request.getContextPath() %>"/>
    <h1>커뮤니티</h1><br>
    <div class="btn-group">
        <button type="button" class="btn btn-outline-dark btn1" onclick="location.href='boardFree'">전체</button>
        <button type="button" class="btn btn-outline-dark btn2" onclick="location.href='boardFree?boardtype=free'">자유</button>
        <button type="button" class="btn btn-outline-dark btn3" onclick="location.href='boardFree?boardtype=ask'">질문</button>
    </div>
                <button onclick="location.href='${root}/board/boardForm'" style="float: right;" class="btn btn-outline-dark">글쓰기</button><br>
                <div style="margin: 10px;">
                    <table class="table" style="width: 100%; border-collapse: separate; border-radius: 15px; border: 1px solid black;">
                        <tr>
                            <th colspan="2">인기게시물 (어케만드는거야...)</th>
                        </tr>
                        <tr>
                            <td>인기1</td>
                            <td>인기2</td>
                        </tr>
                        <tr>
                            <td>인기3</td>
                            <td>인기4</td>
                        </tr>
                        <tr>
                            <td>인기5</td>
                            <td>인기6</td>
                        </tr>
                        <tr>
                            <td>인기7</td>
                            <td>인기8</td>
                        </tr>
                        <tr>
                            <td>인기9</td>
                            <td>인기10</td>
                        </tr>
                    </table>
                </div>
                <br>
                <div class="boardlist" style="margin: 10px;">
                    <c:set var="root" value="<%=request.getContextPath() %>"/>
                    <table class="table" style="width: 100%; border-collapse: separate; border-radius: 10px; border: 1px solid black;">
                        <tr>
                            <th style="width:50px; text-align: center;">번호</th>
                            <th style="width: 300px; text-align: center;">제목</th>
                            <th style="width: 80px; text-align: center;">작성자</th>
                            <th style="width: 120px; text-align: center;">작성일</th>
                            <th style="width: 50px; text-align: center;">조회</th>
                        </tr>
                        <c:forEach var="dto" items="${list}">
                            <tr>
                                <td style="text-align: center;">${no}</td>
                                <c:set var="no" value="${no-1}"/>
                                <td>
                                    <a href="${root}/board/boardDetail?boardnum=${dto.boardnum}&currentPage=${currentPage}" style="text-decoration: none; color: black;">${dto.subject}</a>
                                    <c:if test="${dto.photo!='no'}">
                                        <i class="fa fa-image" style="font-size:20px"></i>
                                    </c:if>
                                    <c:if test="${dto.reboardcount>0}">
                                        <b>[${dto.reboardcount}]</b>
                                    </c:if>
                                </td>
                                <td style="text-align: center;">${dto.nickname}</td>
                                <td style="text-align: center;">
                                    <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td style="text-align: center;">${dto.readcount}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="searcharea" style="width: 60%; margin: 10px;">
                    <form action="boardFree">
                        <div class="input-group">
                            <select class="btn-outline-dark" style="width: 100px; text-align: center;" name="searchcolumn">
                                <option value="subject">제목</option>
                                <option value="nickname">작성자</option>
                                <option value="content">내용</option>
                            </select>
                            &nbsp;&nbsp;&nbsp;
                            <input type="text" name="searchword" class="btn-outline-dark" style="width: 200px;" placeholder="검색어" value="${param.searchword}">
                            <button type="submit" class="btn btn-outline-dark">검색</button>
                        </div>
                    </form>
                </div>
                <!--페이징-->
                <div class="paging">
                    <ul class="pagination" style="justify-content: center;">
                        <c:if test="${startPage>1}">
                            <li class="page-item"><a href="boardFree?currentPage=${startPage-1}" class="page-link" style="color: black;">이전</a></li>
                        </c:if>

                        <!-- 페이지번호 -->
                        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                            <c:if test="${pp==currentPage}">
                                <li class="page-item"><a class="page-link" href="boardFree?currentPage=${pp}" style="color: white; background-color: black;">${pp}</a></li>
                            </c:if>
                            <c:if test="${pp!=currentPage}">
                                <li class="page-item"><a class="page-link" href="boardFree?currentPage=${pp}" style="color: black;">${pp}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${endPage<totalPage}">
                            <li class="page-item"><a href="boardFree?currentPage=${endPage+1}" class="page-link" style="color: black;">다음</a></li>
                        </c:if>
                    </ul>
                </div>
        </div>
    </body>
</html>