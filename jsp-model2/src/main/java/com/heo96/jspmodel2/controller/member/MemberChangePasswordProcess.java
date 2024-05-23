package com.heo96.jspmodel2.controller.member;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.MemberDto;
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
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");
        String changePW = request.getParameter("changePW");
        String checkPW = request.getParameter("checkPW");
        //기존비밀번호확인 , 새로운비밀번호로 바꿔주기
        MemberDao loginMemberDao = new MemberDao();
        MemberDto loginMemberDto = loginMemberDao.loginMember(userID, userPW);
        if (loginMemberDto != null) {
            MemberDao changePasswordMemberDao = new MemberDao();
            if (changePW.equals(checkPW)) {
                int reuslt = changePasswordMemberDao.changePassword(userID, changePW);
                if (reuslt > 0) {
                    ScriptWritter.alertAndNext(response, "비밀번호가 변경되었습니다.", "../member/login");
                } else {
                    ScriptWritter.alertAndBack(response, "비밀번호 변경에 실패했습니다.");
                }
            } else {
                ScriptWritter.alertAndBack(response, "비밀번호 확인 바랍니다.");
            }
        } else {
            ScriptWritter.alertAndBack(response, "비밀번호 확인 바랍니다.");
        }
    }
}
