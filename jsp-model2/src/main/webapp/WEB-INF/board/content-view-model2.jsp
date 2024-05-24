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
    <div class="mt-5 mb-5">
        <a href="../board/content-list" class="btn btn-primary">목록으로</a>
<%--        <c:choose>--%>
<%--            <c:when test="${boardContentViewDto.userID==}" >--%>
<%--        <a href="../board/content-list" class="btn btn-primary">수정하기</a>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
    </div>
</div>
<script src="http://cdn.iframe.ly/embed.js?api_key=bf21616ae40681a089d9c7"></script>
<script>
    document.querySelectorAll("oembed[url]").forEach(element =>{
        iframely.load(element,element.attributes.url.value)
    })
</script>
<%@include file="../include/footer.jsp"%>