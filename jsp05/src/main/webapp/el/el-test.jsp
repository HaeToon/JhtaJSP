<%@ page import="com.heo96.jsp05.dto.MemberDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        pageContext.setAttribute("scope","페이지");
        request.setAttribute("scope","리퀘스트");
        session.setAttribute("scope","세션");
        application.setAttribute("scope","어플리케이션");

        request.setAttribute("memberDto",new MemberDto(30,"홍길동","홍","1234"));
        int num01 = 10;
        int num02 = 20;
        pageContext.setAttribute("num01",10);
        pageContext.setAttribute("num02",20);
        List<MemberDto> memberDtoList=new ArrayList<>();
        memberDtoList.add(new MemberDto(30,"태훈","heo","1234"));
        memberDtoList.add(new MemberDto(40,"현홍","kim","1234"));
        request.setAttribute("memberList",memberDtoList);

        Map<String,MemberDto> memberDtoMap=new HashMap<>();
        memberDtoMap.put("person",new MemberDto(30,"태훈","heo","1234"));
        memberDtoMap.put("사람",new MemberDto(40,"현홍","kim","1234"));
        request.setAttribute("memberDtoMap",memberDtoMap);
    %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>${pageScope.scope}</p>
<p>${requestScope.scope}</p>
<p>${sessionScope.scope}</p>
<p>${applicationScope.scope}</p>
<%--<p>${applicationScope["scope"]}</p> 잘사용하지않는방법 --%>
<hr>
<p>${scope}</p>
<%--<jsp:forward page="forward.jsp"></jsp:forward>--%>
<hr>
<h2>param 값 받기</h2>
<%--param 은 표현식으로 html 에서만 쓸수있다.--%>
<p>${param.name}</p>
<p>${param.userID}</p>
<%--checkbox로 넘어오는것은 paramValues로 받는다.--%>
<p>${paramValues.inter[0]}</p>
<p>${paramValues.inter[1]}</p>
<hr>
<h2>initparam 값 받기</h2>
<p>${initParam.OracleDriver}</p>
<p>${initParam.OracleURL}</p>
<hr>
<h2>cookie값 받기</h2>
<p>${cookie.loggedID.value}</p>
<hr>
<h2>객체 값 받기</h2>
<p>${requestScope.memberDto.age}</p>
<p>${requestScope.memberDto.name}</p>
<p>${requestScope.memberDto.userID}</p>
<p>${requestScope.memberDto.userPW}</p>
<hr>
<h2>context 값 받기</h2>
<p><a href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></p>
<p>${pageContext.request.contextPath}</p>
<hr>
<h2>연산</h2>
<p>${num01+num02}</p>
<p>${num01-num02}</p>
<p>${num01*num02}</p>
<p>${num01/num02}</p>

<%--크다 ,작다 ,크거나같다, 작거나같다 , 같다 , 다르다--%>
<p>${num01 > num02}</p>
<p>${num01 < num02}</p>
<p>${num01 >= num02}</p>
<p>${num01 <= num02}</p>
<p>${num01 == num02}</p>
<p>${num01 != num02}</p>

<p>${num01 gt num02}</p>
<p>${num01 lt num02}</p>
<p>${num01 ge num02}</p>
<p>${num01 le num02}</p>
<p>${num01 eq num02}</p>
<p>${num01 ne num02}</p>

<p>num03=<%=num01%></p>

<hr>
<h2>리스트 출력</h2>
<p>${memberList[0].age}</p>
<p>${memberList[0].name}</p>
<p>${memberList[0].userID}</p>
<p>${memberList[0].userPW}</p>

<hr>
<h2>맵출력</h2>
<p>${memberDtoMap.person.age}</p>
<p>${memberDtoMap.person.name}</p>
<p>${memberDtoMap.person.userID}</p>
<p>${memberDtoMap.person.userPW}</p>
<%-- 한글을 사용하려면 [""] 사용해야함.--%>
<p>${memberDtoMap["사람"].age}</p>
<p>${memberDtoMap["사람"].name}</p>
<p>${memberDtoMap["사람"].userID}</p>
<p>${memberDtoMap["사람"].userPW}</p>

<hr>
<h2>삼항연산자</h2>
<p>${num01>num02?"num01이 크다":"num02가 크다"}</p>


<%
    request.setAttribute("objNull",null);
    request.setAttribute("emptyString","");
%>
<hr>
<h2>null 연산</h2>
<p>objNull === ${empty objNull}</p>
<p>emptyString === ${empty emptyString}</p>
<p>${objNull+10}</p>
<p>${objNull-10}</p>
<p>${objNull*10}</p>
<p>${objNull/10}</p>
<p>${10/objNull}</p>


</body>
</html>
