package com.heo96.jspmodel2.controller.member;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.MemberDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/member/login-process")
public class LoginProcessTest extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doPost(req, resp);
        String userID=request.getParameter("userID");
        String userPW=request.getParameter("userPW");
        System.out.println(userID);
        System.out.println(userPW);
        MemberDto loginMemberDto = new MemberDto();

        loginMemberDto.setUserID(userID);
        loginMemberDto.setUserPW(userPW);

        MemberDao memberDao = new MemberDao();

        ResultSet rs = memberDao.loginMember(loginMemberDto);
        try {
            if(rs.next()){
                System.out.println("로그인성공");
                response.sendRedirect("/index/index");
            }else {
                System.out.println("로그인실패");
                response.sendRedirect("/member/login");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
