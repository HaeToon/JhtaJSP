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

@WebServlet("/member/insert-process")
public class InsertMemberProcess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doPost(req, resp);
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");
        String userName = request.getParameter("userName");
        String userBirth = request.getParameter("userBirth");
        String userEmail = request.getParameter("userEmail");
        String postcode = request.getParameter("postcode");
        String adress = request.getParameter("adress");
        String detailAdress = request.getParameter("detailAdress");

        MemberDto insertMemberDto = new MemberDto();

        insertMemberDto.setUserID(userID);
        insertMemberDto.setUserPW(userPW);
        insertMemberDto.setUserName(userName);
        insertMemberDto.setUserBirth(userBirth);
        insertMemberDto.setEmail(userEmail);
        insertMemberDto.setPostcode(postcode);
        insertMemberDto.setAdress(adress);
        insertMemberDto.setDetailAdress(detailAdress);

        MemberDao memberDao = new MemberDao();

       int result = memberDao.insertMember(insertMemberDto);
       if(result>0){
           response.sendRedirect("../index/index");
       }else {
           response.sendRedirect("../member/insert-member");
       }

    }
}
