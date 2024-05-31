package com.heo96.mybatis.controller.member;

import com.heo96.mybatis.dao.MemberDao;
import com.heo96.mybatis.dto.MemberDto;
import com.heo96.mybatis.utils.ScriptWritter;
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
        MemberDao memberDao = new MemberDao();
        MemberDto memberDto = null;
        memberDto = memberDao.infoMember(request.getParameter("userID"));

        request.setAttribute("memberInfoDto",memberDto);

        RequestDispatcher dispatcher= request.getRequestDispatcher("/WEB-INF/member/member-info.jsp");
        dispatcher.forward(request,response);
    }
}
