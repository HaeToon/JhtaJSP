package com.heo96.jspmodel2replyboard.controller.member;

import com.heo96.jspmodel2replyboard.dao.MemberDao;
import com.heo96.jspmodel2replyboard.dto.MemberDto;
import com.heo96.jspmodel2replyboard.utils.CookieManager;
import com.heo96.jspmodel2replyboard.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/member/login-member")
public class MemberLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doGet(req, resp);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/login-model2.jsp");
        dispatcher.forward(request,response);
    }
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
