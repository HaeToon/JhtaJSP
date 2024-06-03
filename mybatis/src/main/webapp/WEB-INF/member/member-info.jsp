<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-31
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<div class="container">
    <form action="/member/info-edit?userID=${memberInfoDto.userID}">
        <table class="table table-striped">
            <tbody>
            <tr>
                <th scope="row">프로필</th>
                <td>
                    <c:choose>
                        <c:when test="${memberInfoDto.renameProfile ne null}">
                            <img src="${request.contextPath}/upload/${memberInfoDto.renameProfile}" class="profile">
                        </c:when>
                        <c:otherwise>
                            <img src="../../images/nonProfile.png" class="profile">
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <th scope="row">no</th>
                <td>${memberInfoDto.no}</td>
            </tr>
            <tr>
                <th scope="row">ID</th>
                <td >${memberInfoDto.userID}</td>
                <input type="hidden" name="userID" value="${memberInfoDto.userID}">
            </tr>
            <tr>
                <th scope="row">Name</th>
                <td>${memberInfoDto.userName}</td>
            </tr>
            <tr>
                <th scope="row">Birth</th>
                <td>${memberInfoDto.userBirth}</td>
            </tr>
            <tr>
                <th scope="row">Email</th>
                <td>${memberInfoDto.userEmail}</td>
            </tr>
            <tr>
                <th scope="row">PostCode</th>
                <td>${memberInfoDto.postcode}</td>
            </tr>
            <tr>
                <th scope="row">Adress</th>
                <td>${memberInfoDto.adress}</td>
            </tr>
            <tr>
                <th scope="row">Detail Adress</th>
                <td>${memberInfoDto.detailAdress}</td>
            </tr>
            </tbody>
        </table>
        <button class="btn btn-outline-primary">개인정보 변경</button>
        <a href="../index/index" class="btn btn-outline-primary">홈으로</a>
    </form>
</div>
<%@include file="../include/footer.jsp"%>
