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
import java.util.List;

@WebServlet("/member/list")
public class MemberList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doGet(req, resp);
        //list 싣고보내기
        MemberDao memberDao = new MemberDao();
        List<MemberDto> memberDtoList=memberDao.listMember();
        request.setAttribute("memberDtoList",memberDtoList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/member-list-model2.jsp");
        dispatcher.forward(request,response);
    }
}
