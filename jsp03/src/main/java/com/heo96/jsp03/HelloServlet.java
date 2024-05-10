package com.heo96.jsp03;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
//@WebServlet("/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        //get (link,form method)/ post(form method를 post로 명시해서 보냄. 쓰지않으면 get방식이다.) /
        //delete / put / patch 앞의 3개는 ajax를 통해서만 보낼수있다.
//        pageContext(페이지 하나에서만 관여 다른페이지에 넘어가면 정보가 사라짐) , request(다음페이지인 페이지 하나를) , session(로그인에대해) , application(서버 전반에대해 계속남아있는것)
        // cookie(컴퓨터에 저장하는것들)


        // Hello
       String userID =request.getParameter("userID");
       String userPW =request.getParameter("userPW");

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("userID : "+userID);
        out.println("userID : "+userPW);
        out.println("</body></html>");
    }

    public void destroy() {
    }
}