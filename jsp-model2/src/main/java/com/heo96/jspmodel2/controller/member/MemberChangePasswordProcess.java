package com.heo96.jspmodel2.controller.member;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.utils.ScriptWritter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/change-password-process")
public class MemberChangePasswordProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID=request.getParameter("userID");
        String userPW=request.getParameter("userPW");
        String changePW=request.getParameter("changePW");
        String checkPW=request.getParameter("checkPW");
        if(changePW.equals(checkPW)) {
            MemberDao memberDao = new MemberDao();
            memberDao.updatePassword(userID,changePW);
            ScriptWritter.alertAndNext(response,"비밀번호가 변경되었습니다.","../member/login");
        }else {
            ScriptWritter.alertAndBack(response,"비밀번호 변경에 실패했습니다.");
        }
    }
}
