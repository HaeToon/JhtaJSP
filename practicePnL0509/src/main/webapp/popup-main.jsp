<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-09
  Time: 오후 5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cookieValue ="on";
    Cookie cookies[] = request.getCookies();
    for(int i=0; i<cookies.length;i++){

    }
%>


<html>
<head>
    <title>Title</title>
    <style>
#popup{
    padding :10px;
    background-color :#fff;
    border:1px solid #ccc;
    box-shadow : 5px 5px 10px rgba(0,0,0,0.1);
    width:300px;
    position:fixed;
    left:100px;
    top:100px;
}
#popup h2 {
font-size:18px;
margin:0 0 10px 0;
}
#popup .content {
    min-height:150px;
background-color:#ccc;
margin-bottom:10px;
}
    </style>
    <script src = "js/jquery-3.7.1.min.js"></script>
</head>
<body>
<h1>오늘하루 이창을 열지 않기</h1>
<aside id="popup">
<h2>POPUP</h2>
    <div class="content">여기에 내용이 들어갑니다.<br></div>
    <div class="btn-box">
        <label>
            <input type ="checkbox" id="today-check" value="one">
            <span>오늘 하루 이창을 열지 않기</span>
        </label>
        <button class ="btn-close">닫기</button>
    </div>
</aside>
<script>
$("#popup .btn-close").on("click",function(){
    const isChecked = $("#today-check").is(":checked");
    console.log(isChecked)
$("#popup").fadeOut();
    if(isChecked){
        $.ajax({
            url:"popup-make.jsp",
            method:"GET",
            data : {
                today:"one"
            }
        })
    }
})
</script>
</body>
</html>
