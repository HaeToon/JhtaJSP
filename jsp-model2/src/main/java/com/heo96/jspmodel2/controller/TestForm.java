package com.heo96.jspmodel2.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="TestForm", value="/TestForm.do")//.do안써도됨  value에 /를 붙여야함. value=클래스의
//@WebServlet("/TestForm.do")
public class TestForm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //super.doGet(req, resp);
        System.out.println("클라이언트가 TestForm 호출요청을 보냈습니다.");
        request.setAttribute("name","허태훈");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/test.jsp");
        requestDispatcher.forward(request,response);
        //dispatcher == 주소는 그대로 쓰면서 page만 노출.
    }
}
