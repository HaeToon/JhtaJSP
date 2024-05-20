<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp" %>
<%
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select * from member order by no";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery(); // executeQuery는 ResultSet 을 리턴한다.
%>
<script> //history.back 의 reload이슈 해결용
    if (document.addEventListener) {
        window.addEventListener("pageshow", function (event) {
            if (event.persisted || window.performance && window.performance.navigation.type == 2) {
                location.reload();
            }
        }, false);
    }
</script>
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

<%--        <%--%>
<%--                while (rs.next()) {--%>
<%--                out.println("<tr>");--%>
<%--                out.println("<td>" + rs.getInt("no") + "</td>");--%>
<%--                out.println("<td>" + rs.getString("userID") + "</td>");--%>
<%--                out.println("<td>" + rs.getString("userPW") + "</td>");--%>
<%--                out.println("<td>" + rs.getString("userName") + "</td>");--%>
<%--                out.println("<td>" + rs.getString("userBirth") + "</td>");--%>
<%--                out.println("<td>" + rs.getString("email") + "</td>");--%>
<%--                out.println("<td>" + rs.getString("postcode") + "</td>");--%>
<%--                out.println("<td>" + rs.getString("adress") + "</td>");--%>
<%--                out.println("<td>" + rs.getString("detailadress") + "</td>");--%>
<%--                //a href태그로 삭제시키기 >>a 태그에 정보보내는방법은 ?붙이기 ?userID="+rs.getString("userID")+"--%>
<%--                out.println("<td><a href=\"admin-delete-member-process.jsp?userID="+rs.getString("userID")+"\" class=\"btn btn-danger\">DELETE</a></td>");--%>
<%--                out.println("<td><button class=\"btn btn-danger btn-delete \" data-userid=\"++\">ajax-delete</button></td>");--%>

<%--                out.println("</tr>");--%>
<%--            }--%>
<%--        %>--%>
        <%      while (rs.next()) { %>
        <tr>
            <td><%=rs.getInt("no")%></td>
            <td><%=rs.getString("userID")%></td>
            <td><%=rs.getString("userPW")%></td>
            <td><%=rs.getString("userName")%></td>
            <td><%=rs.getString("userBirth")%></td>
            <td><%=rs.getString("email")%></td>
            <td><%=rs.getString("postcode")%></td>
            <td><%=rs.getString("adress")%></td>
            <td><%=rs.getString("detailadress")%></td>
<%--            //a href태그로 삭제시키기 >>a 태그에 정보보내는방법은 ?붙이기 ?userID="+rs.getString("userID")+"--%>
            <td><a href="admin-delete-member-process.jsp?userID=<%=rs.getString("userID")%>" class="btn btn-danger">DELETE</a>
            <button type="button" class="btn btn-danger btn-delete " data-userid="<%=rs.getString("userID")%>">ajax-delete</button></td>
            <td><input type="checkbox" id="" name="check" class="check" value="<%=rs.getInt("no")%>"></td>
        </tr>
        <%  }
            rs.close();
            pstmt.close();
            jdbcConnectionPool.close();
        %>
        </tbody>
    </table>
    <div class="mt-5 " ><button class="btn btn-danger btn-delete-all">DEL</button></div>
    </form>
    <button class="btn btn-danger btn-delete-all02" >삭제</button>
</div>

<script>
    //a href = "데이터 처리할 서버 페이지?변수 = 값 &변수 = 값....  get밖에안됨
    //form >> form action="url" , name = 변수 value = 값 form 은 method="post/get"
    //ajax >> ajax({url:"",data{변수:"값"}})
    //ajax (jquery(ajax),vanilla,script,fetch,axios 라이브러리)
    //this 에서 function()을 ()=>로바꾸면 window를가리킴
    $(".btn-delete-all02").on("click",function () {
        $("#member-list-form").submit();
    });

    $(".btn-delete-all").on("click",function (){
        //e.preventDefault();
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
            url:"../member/admin-delete-member-ajax-process.jsp",
            data:{
                userID:sendUserID
            },
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
<%@include file="../include/footer.jsp" %>


