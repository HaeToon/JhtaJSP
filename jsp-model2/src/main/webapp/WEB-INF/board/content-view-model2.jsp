<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-22
  Time: 오전 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">VIEW</h2>
    <table class="table table-striped">
        <tbody>
        <tr>
            <td>제목</td>
            <td colspan="3" >${boardContentViewDto.subject}</td>
            <td>글번호</td>
            <td colspan="3"  >${boardContentViewDto.no}</td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td colspan="3">${boardContentViewDto.userName}</td>
        </tr>
        <tr>
            <td>날짜</td>
            <td>${boardContentViewDto.regdate}</td>
            <td>조회수</td>
            <td>${boardContentViewDto.hit}</td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" class="content" >
                ${boardContentViewDto.content}
            </td>
        </tr>
        </tbody>
    </table>
</div>
<%@include file="../include/header.jsp"%>