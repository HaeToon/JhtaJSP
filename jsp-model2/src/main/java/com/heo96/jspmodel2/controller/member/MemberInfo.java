package com.heo96.jspmodel2.controller.member;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.MemberDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/info")
public class MemberInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doGet(req, resp);
        String userID = request.getParameter("userID");
        MemberDao memberDao = new MemberDao();
        MemberDto infoMemberDto = memberDao.infoMember(userID);
        request.setAttribute("infoMemberDto",infoMemberDto);
        RequestDispatcher dispatcher=request.getRequestDispatcher("/WEB-INF/member/info-member-model2.jsp");
        dispatcher.forward(request,response);
    }
}
