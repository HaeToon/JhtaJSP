<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-21
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">LIST</h2>
</div>
<div class="container">
    <h2 class="mt-5 mb-5">MemberList</h2>
    <form action="delete-all-member-process.jsp" method="get" id="member-list-form">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>no</th>
                <th>userID</th>
                <th>userPW</th>
                <th>userName</th>
                <th>userBirth</th>
                <th>Email</th>
                <th>PostCode</th>
                <th>Adress</th>
                <th>Adress Detail</th>
                <th>delete</th>
                <th><input type="checkbox" id="check-all"></th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="member" items="${memberDtoList}" varStatus="loop">
<%--        List에 담겨있는객체를 뽑아다 써야하는데 그걸 바꿈
<%--        varstatus 는  반복문을 터ㅇ--%>

                <tr>
                <td>${member.no}</td>
                    <td><a href="../member/info?userID=${member.userID}">${member.userID}</a></td>
                <td>${member.userPW}</td>
                <td>${member.userName}</td>
                <td>${member.userBirth}</td>
                <td>${member.email}</td>
                <td>${member.postcode}</td>
                <td>${member.adress}</td>
                <td>${member.detailAdress}</td>
                <%--            //a href태그로 삭제시키기 >>a 태그에 정보보내는방법은 ?붙이기 ?userID="+rs.getString("userID")+"--%>
                    <td><a href="../member/delete" class="btn btn-danger">DELETE</a>
                        <button type="button" class="btn btn-danger btn-delete " data-userid="${member.userID}">ajax-delete</button></td>
                    <td><input type="checkbox" id="" name="check" class="check" value="${member.no}"></td>
                </tr>
                </c:forEach>

            </tbody>
        </table>
        <div class="mt-5 " ><button class="btn btn-danger btn-delete-all">DEL</button></div>
    </form>
    <button class="btn btn-danger btn-delete-all02" >삭제</button>
</div>
<%@include file="../include/footer.jsp"%>
<script>
    $(".btn-delete-all02").on("click",function () {
        $("#member-list-form").submit();
    });
    $(".btn-delete-all").on("click",function (){
        const isAllDelete = confirm("삭제하시겠습니까?") // o x 메세지 alert = 확인 하나뿐
        console.log(isAllDelete);
        if(isAllDelete){
            $("#member-list-form").submit(); //return false를쓸때 참이면 하겠다
        }else {
            return false;
        }
    })
    $(".btn-delete").on("click",function (){
        const parent = $(this).parent().parent(); // 버튼 >> td >> tr 이걸 지움으로 새로고침하지않아도 지울수있음.
        // alert("경고")
        const sendUserID=$(this).data("userid")

        // alert(sendUserID)
        $.ajax({
            url:"../member/delete-ajax",
            data:{
                userID:sendUserID
            },
            method:"get",
            success:function (data){
                console.log(data);
                if(data.isDelete==="yes"){
                    // alert(sendUserID+"님을 탈퇴시켰습니다.")
                    // location.reload();
                    // parent.remove(); //새로고침없이 지울수있게 만드는것.
                    parent.fadeOut();
                }
            }
        })
    })
    $("#check-all").on("click",function (){ //click or change
        console.log($(this).prop("checked"))
        if($(this).is(":checked")){ //is(":checked") ==>prop("checked")  변경가능
            $(".check").prop("checked",true);
        }else {
            $(".check").prop("checked",false);

        }
    })
</script>
