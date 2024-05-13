<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="include/header.jsp"%>
<div class="container">
    <h2>회원가입</h2>

    <form action="insert-member-process.jsp" method="post">
        <div class="mb-3">
            <label for="userID" class="form-label">User ID</label>
            <input type="text" class="form-control" id="userID" placeholder="User ID" name="userID">
            <button type="button" class="btn btn-dark mt-2" id="btn-duplicate" >아이디 중복 체크</button>
        </div>
        <div class="mb-3">
            <label for="userPW" class="form-label">Password</label>
            <input type="password" class="form-control" id="userPW" placeholder="User PW" name="userPW">
        </div><div class="mb-3">
        <label for="userName" class="form-label">Name</label>
        <input type="text" class="form-control" id="userName" placeholder="User Name" name="userName">
    </div>
        <div class="mb-3">
            <label for="userBirth" class="form-label">Birth</label>
            <input type="date" class="form-control" id="userBirth" placeholder="User Birth" name="userBirth">
        </div>
        <div>
            <button class="btn btn-primary" >Sign up</button>
            <button type="reset" class="btn btn-outline-primary ">Reset</button>
        </div>
    </form>
</div>
<script>
    //ajax - jquery axios fetch
    $("#btn-duplicate").on("click",function(){
        $.ajax({
            url:"id-check-process.jsp",
            data:{
                userID:$("#userID").val()
            },
            method:"post",
            success:function (data){
                console.log(data);
                if(data.count>0){
                    alert("이미 생성되어있는 아이디입니다. 다른아이디를 입력해주세요");
                    $("#userID").val("");
                    $("#userID").focus();
                }else {
                    const used = confirm("생성 가능한 아이디입니다. 사용하시겠습니까?");
                    if(used){
                        $("#userID").attr("readonly",true);
                    }else {
                        $("#userID").val("");
                        $("#userID").focus();
                    }
                }
            },
            fail:function(error) {
                console.log(error);
            }
        })
    });
</script>
<%@include file="include/footer.jsp"%>
