package com.heo96.jspmodel2.controller.member;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.MemberDto;
import com.heo96.jspmodel2.utils.CookieManager;
import com.heo96.jspmodel2.utils.ScriptWritter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/member/login-member-process")
public class MemberLoginProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doPost(req, resp);
        String userID=request.getParameter("userID");
        String userPW=request.getParameter("userPW");
        String saveID=request.getParameter("saveID");
        MemberDao loginMemberDao = new MemberDao();
        MemberDto loginMemberDto = loginMemberDao.loginMember(userID,userPW);

        if(loginMemberDto!=null){
            HttpSession session = request.getSession();
            session.setAttribute("sessionMemberDto",loginMemberDto);
            if(saveID!=null && saveID.equals("yes")){
                CookieManager.createCookie(response,"savedID",userID,60*60*24);
            }else {
                CookieManager.deleteCookie(response,"savedID");
            }
            ScriptWritter.alertAndNext(response,"로그인 성공","../index/index");
        }else {
            ScriptWritter.alertAndBack(response,"로그인 실패");
        }
    }
}
