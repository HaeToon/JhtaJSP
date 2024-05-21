
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">회원정보</h2>
</div>
<div class="container">
    <table class="table table-striped">
        <tbody>
        <tr>
            <th scope="row">no</th>
            <td>${infoMemberDto.no}</td>
        </tr>
        <tr>
            <th scope="row">ID</th>
            <td>${infoMemberDto.userID}</td>
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
</div>
<%@ include file="../include/footer.jsp"%>