package com.heo96.jspmodel2.controller.member;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.MemberDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/member/change-password")
public class MemberChangePassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        MemberDao memberDao = new MemberDao();
        MemberDto infoMemberDto = memberDao.infoMember(userID);
        request.setAttribute("infoMemberDto",infoMemberDto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/change-password-form.jsp");
        dispatcher.forward(request,response);
    }
}
