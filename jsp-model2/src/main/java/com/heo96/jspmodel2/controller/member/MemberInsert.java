package com.heo96.jspmodel2.controller.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/insert")
public class MemberInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doGet(req, resp);
        //db접속도하고 데이터조작도하고'
        // m()vc
        RequestDispatcher dispatcher =request.getRequestDispatcher("/WEB-INF/member/insert-member-model2.jsp");
        dispatcher.forward(request,response);
    }
}
