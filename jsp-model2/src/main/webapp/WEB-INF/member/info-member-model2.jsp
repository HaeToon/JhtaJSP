
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">회원정보</h2>
</div>
<div class="container">
    <form action="../member/change-password" method="post">
    <table class="table table-striped">
        <tbody>
        <tr>
            <th scope="row">프로필</th>
            <td>
                <img src="${request.contextPath}/upload/${infoMemberDto.renameProfile}" class="profile">
            </td>
        </tr>
        <tr>
            <th scope="row">no</th>
            <td>${infoMemberDto.no}</td>
        </tr>
        <tr>
            <th scope="row">ID</th>
            <td >${infoMemberDto.userID}</td>
            <input type="hidden" name="userID" value="${infoMemberDto.userID}">
        </tr>
        <tr>
            <th scope="row">Name</th>
            <td>${infoMemberDto.userName}</td>
        </tr>
        <tr>
            <th scope="row">Birth</th>
            <td>${infoMemberDto.userBirth}</td>
        </tr>
        <tr>
            <th scope="row">Email</th>
            <td>${infoMemberDto.email}</td>
        </tr>
        <tr>
            <th scope="row">PostCode</th>
            <td>${infoMemberDto.postcode}</td>
        </tr>
        <tr>
            <th scope="row">Adress</th>
            <td>${infoMemberDto.adress}</td>
        </tr>
        <tr>
            <th scope="row">Detail Adress</th>
            <td>${infoMemberDto.detailAdress}</td>
        </tr>
        </tbody>
    </table>
        <button class="btn btn-outline-primary">비밀번호 변경</button>
    </form>
</div>
<%@ include file="../include/footer.jsp"%>