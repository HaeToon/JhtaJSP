<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-27
  Time: 오전 11:26
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
            <td colspan="3" >${content.subject}</td>
            <td>글번호</td>
            <td colspan="3"  >${content.no}</td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td colspan="3">${content.userName}</td>
        </tr>
        <tr>
            <td>날짜</td>
            <td>${content.regdate}</td>
            <td>조회수</td>
            <td>${content.hit}</td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" class="content" >
                ${content.content}
            </td>
        </tr>
        </tbody>
    </table>
    <hr>
    <div class="container">
        <h2 class="mt-3 mb-3">댓글</h2>
        <form>
            <input type="hidden" name="userName" value="${sessionMemberDto.userName}">
            <input type="text">
            <button>댓글달기</button>
        </form>
    </div>
    <div class="mt-5 mb-5">
        <a href="../board/content-list" class="btn btn-primary">목록으로</a>
        <a href="../board/content-reply" class="btn btn-primary">댓글달기</a>
        <a href="/board/reply?regroup=${content.regroup}&relevel=${content.relevel}&restep=${content.restep}" class="btn btn-primary">댓글달기2</a>
        <a href="/board/delete?no=${content.no}" class="btn btn-danger">삭제하기</a>


    </div>
</div>
<%@include file="../include/footer.jsp"%>
