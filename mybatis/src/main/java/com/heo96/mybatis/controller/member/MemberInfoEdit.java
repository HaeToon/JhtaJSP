package com.heo96.mybatis.controller.member;

import com.heo96.mybatis.dao.MemberDao;
import com.heo96.mybatis.dto.MemberDto;
import com.heo96.mybatis.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@MultipartConfig
@WebServlet("/member/info-edit")
public class MemberInfoEdit extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/member-info-edit-form.jsp");
        dispatcher.forward(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result =0;
        String originalProfile = "";
        String renameProfile="";
        MemberDto memberDto = MemberDto.builder()
                .userID(request.getParameter("userID"))
                .userPW(request.getParameter("userPW"))
                .userName(request.getParameter("userName"))
                .userBirth(request.getParameter("userBirth"))
                .userEmail(request.getParameter("userEmail"))
                .postcode(request.getParameter("postcode"))
                .adress(request.getParameter("adress"))
                .detailAdress(request.getParameter("detailAdress"))

                .build();
        MemberDao memberDao=new MemberDao();
        result = memberDao.memberInfoEdit(memberDto);
        System.out.println(result);
        if(result>0){
            ScriptWritter.alertAndNext(response,"수정완료","../index/index");
        }else {
            ScriptWritter.alertAndBack(response,"수정에 실패했습니다.");
        }
    }
}
