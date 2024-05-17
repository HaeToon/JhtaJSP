<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-17
  Time: 오전 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // front에서 변수 전달하고 서버에서 받아서 db처리
    int no=0;
    String strno=request.getParameter("no");
    if(strno!=null){
    no = Integer.parseInt(request.getParameter("no"));
    }
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    boolean isUpdate = true;

    String visitedCookieValue=CookieManager.readCookie(request,"visitedCookie");

    if(visitedCookieValue.isBlank()){
        CookieManager.createCookie(response,"visitedCookie",request.getParameter("no"),60*60*24);
    } else {
        if(visitedCookieValue.contains(strno)){
            isUpdate=false;
        } else {
            isUpdate= true;
            CookieManager.deleteCookie(response,"visitedCookie");
            CookieManager.createCookie(response,"visitedCookie",visitedCookieValue+"/"+strno,60*60*24);
        }
    }
    if(isUpdate) {
        String updateSql = "update board set hit = hit + 1 where no = ?";
        jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(updateSql);
        jdbcConnectionPool.pstmt.setInt(1, no);
        int result = jdbcConnectionPool.pstmt.executeUpdate();
    }
    String sql =  "select * from board where no = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1,no);
    jdbcConnectionPool.rs = jdbcConnectionPool.pstmt.executeQuery();
%>
<%@ include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5">VIEW</h2>
    <table class="table table-striped">
        <tbody>
        <% if(jdbcConnectionPool.rs.next()){ %>
        <tr>
            <td>제목</td>
            <td colspan="3" ><%=jdbcConnectionPool.rs.getString("subject")%></td>
            <td>글번호</td>
            <td colspan="3"  ><%=jdbcConnectionPool.rs.getString("no")%></td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td colspan="3"><%=jdbcConnectionPool.rs.getString("username")%></td>
        </tr>
        <tr>
            <td>날짜</td>
            <td><%=jdbcConnectionPool.rs.getString("regdate")%></td>
            <td>조회수</td>
            <td><%=jdbcConnectionPool.rs.getInt("hit")%></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" class="content" >
                <%=jdbcConnectionPool.rs.getString("content")%>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <div class="mt-5 mb-5">
        <a href="../board/write.jsp" class="btn btn-primary">WRITE</a>
        <a href="../board/list.jsp" class="btn btn-primary mx-2">LIST</a>
        <%if(loggedID!=null && loggedID.equals(jdbcConnectionPool.rs.getString("userid"))) {%>
        <a href="../board/delete-content-process.jsp?no=<%=jdbcConnectionPool.rs.getInt("no")%>" class="btn btn-danger mx-2">A Delete</a>
        <button class="btn btn-danger mx-2" id="btn-form-delete">Form Delete</button>
        <button class="btn btn-danger mx-2" id="btn-ajax-delete" data-no="<%=jdbcConnectionPool.rs.getInt("no")%>">Ajax Delete</button>
        <a href="../board/delete-form.jsp?no=<%=jdbcConnectionPool.rs.getInt("no")%>" class="btn btn-danger mx-2">password send</a>
        <button class="btn btn-danger" id="btn-password-popup">password popup</button>
<%--        <a href="../board/modify-content.jsp" class="btn btn-danger mx-2">Modify</a>--%>
        <button class="btn btn-primary" id="btn-modify-content">Modify</button>
    </div>
    <form action="modify-content.jsp" id="modify-content">
        <input type="hidden" name="contentNo" value="<%=jdbcConnectionPool.rs.getString("no")%>">
        <input type="hidden" name="writerName" value="<%=jdbcConnectionPool.rs.getString("username")%>">
        <input type="hidden" name="contentSubject" value="<%=jdbcConnectionPool.rs.getString("subject")%>">
        <input type="hidden" name="content" value="<%=jdbcConnectionPool.rs.getString("content")%>">
    </form>
    <script>
        $("#btn-modify-content").on("click",function (){
            $("#modify-content").submit();
        })
    </script>
    <form action="../board/delete-content-process.jsp" method="post" id="form-delete">
        <input type="hidden" name="no"  value="<%=jdbcConnectionPool.rs.getInt("no")%>">
    </form>
<%--    form 바깥의 button에서 쓰려면 js를써야한다. form submit으로 하는방법. get으로할땐 쓰지않는게좋다 --%>
    <script>
        $("#btn-form-delete").on("click",function (){
            $("#form-delete").submit();
        })
        $("#btn-ajax-delete").on("click",function (){
            const sendNo = $(this).data("no");
            $.ajax({
                url:"../board/delete-ajax-process.jsp",
                data:{
                    no:sendNo,
                },
                success:function (data){
                    console.log(data);
                    if(data.isDelete==="yes"){
                        alert(sendNo+"번 글이 삭제되었습니다.")
                        location.href="../board/list.jsp"
                    }else {
                        alert("알수없는 오류가 발생했습니다.")
                    }
                },
                error:function (err){
                    console.log(err);
                }
            })
        })
    </script>
    <% } jdbcConnectionPool.close(); %>
</div>
<div class="modal fade" tabindex="-1" id="password-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">PASSWORD</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="userPW">Password</label>
                <input type="password" id="userPW" class="form-control mt-2" name="userPW">
                <input type="hidden" name="no" value="${param.no}" id="board-no">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btn-popup-delete">DELETE</button>
            </div>
        </div>
    </div>
</div>
<script>
    const passwordModal = new bootstrap.Modal("#password-modal");
    const passwordModalEl01=$("#password-modal").get(0); //jquery 로찾는것.get(0)붙이면같음
    const passwordModalEl02=document.querySelector("#password-modal"); //querySelector로 찾은것 el01 el02 값이다름
    console.log(passwordModalEl01);
    console.log(passwordModalEl02);
    $("#btn-password-popup").on("click",function (){
        passwordModal.show();
    })
    $("#btn-popup-delete").on("click",function (){
        const sendNo= $("#board-no").val();
        const sendPw = $("#userPW").val();
        console.log(sendNo,"===",sendPw)
        $.ajax({
            url:"../board/delete-ajax-popup.jsp",
            method:"post",
            data:{
                no:sendNo,
                userPW:sendPw,
            },
            success:function (data){
                console.log(data);
                if(data.isDelete==="yes"){
                    // alert(sendNo+"번 글이 삭제되었습니다.")
                    // location.href="../board/list.jsp"
                        passwordModal.hide();
                    passwordModalEl02.addEventListener('hidden.bs.modal', function (e) {
                        // do something...
                        console.log("닫히는이벤트");
                        location.href="../board/list.jsp";
                    });
                }else {
                    passwordModal.hide();
                    passwordModalEl02.addEventListener('hidden.bs.modal', function () {
                        // do something...x
                    alert("알수없는 오류가 발생했습니다.");
                    })
                }
            },
            error:function (err){
                console.log(err);
            }
        })
    })
</script>
<%@ include file="../include/footer.jsp" %>