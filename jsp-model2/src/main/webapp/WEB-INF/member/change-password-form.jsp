<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-22
  Time: 오후 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<div class="container">
    <form action="../member/change-password-process" method="post" id="passwordChangeForm">
        <h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>
        <h1 class="h3 mb-3 fw-normal">아이디 : ${infoMemberDto.userID} </h1>
        <input type="hidden" name="userID" value="${infoMemberDto.userID}">
            <p class="mt-3">현재 비밀번호</p>
        <div class="form-floating">
            <input type="password" class="form-control" id="password" name="userPW">
            <label for="password">현재 비밀번호를 입력해 주세요</label>
        </div>
            <p class="mt-3">변경할 비밀번호</p>
        <div class="form-floating">
            <input type="password" class="form-control" id="changePassword"  name="changePW">
            <label for="changePassword">변경할 비밀번호를 입력해 주세요</label>
        </div>
            <p class="mt-3">비밀번호 확인</p>
        <div class="form-floating">
            <input type="password" class="form-control" id="checkPassword"  name="checkPW">
            <label for="checkPassword">변경한 비밀번호를 확인해 주세요</label>
            <div class="invalid-feedback">비밀번호 확인</div>

        </div>
        <button class="btn btn-primary w-100 py-2 mt-4" type="submit" id="sendChangePasswordProcess" >비밀번호 변경</button>
    </form>
</div>
<script>
    let isPasswordValid=false;
    $("#checkPassword").on("keyup",function (){
        if($("#changePassword").val()!=$(this).val()) {
            $(".invalid-feedback").show()
            $(".invalid-feedback").text("비밀번호가 일치하지 않습니다.")
        }else {
            console.log("같습니다")
            $(".invalid-feedback").hide()
            $(".invalid-feedback").text("")
            isPasswordValid=true;
        }
    })
    $("#sendChangePasswordProcess").on("click",function (){
        if(isPasswordValid){
            $("#passwordChangeForm").submit();
        }else {
            alert("비밀번호가 맞지 않습니다.")
        }
    })
</script>
<%@include file="../include/footer.jsp"%>
