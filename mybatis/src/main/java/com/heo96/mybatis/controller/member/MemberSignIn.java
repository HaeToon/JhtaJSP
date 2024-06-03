package com.heo96.mybatis.controller.member;

import com.heo96.mybatis.dao.MemberDao;
import com.heo96.mybatis.dto.Grade;
import com.heo96.mybatis.dto.MemberDto;
import com.heo96.mybatis.dto.ModalDto;
import com.heo96.mybatis.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet("/member/member-sign-in")
public class MemberSignIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ModalDto modal = new ModalDto("로그인","로그인창","show");
        request.setAttribute("modal",modal);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/member-sign-in-form.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result =0;
        if(request.getParameter("userID")!=null) {
            MemberDto memberDto = null;
            MemberDao memberSignInDao = new MemberDao();
            memberDto = memberSignInDao.signInMember(request.getParameter("userID"));

            if (memberDto != null) {
                String decodePW = memberDto.getUserPW();
                if (BCrypt.checkpw(request.getParameter("userPW"), decodePW)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("sessionMemberDto", memberDto);
                    session.setAttribute("loggedID", request.getParameter("userID"));
                    session.setAttribute("profile", memberDto.getRenameProfile());
                    session.setAttribute("grade", memberDto.getGrade());
                    ScriptWritter.alertAndNext(response, "로그인 성공", "../index/index");

                    ModalDto modal = new ModalDto("로그인","로그인창","show");
                    HttpSession session02 = (HttpSession)request.getSession();
                    session02.setAttribute("modal",modal);
//                    response.sendRedirect("../index/index?title=로그인&msg=로그인되었습니다.&isState=show"); alert 안쓸때
                }
            } else {
                ScriptWritter.alertAndBack(response, "로그인 실패");
            }
        }else {
            ScriptWritter.alertAndBack(response, "로그인 실패");
        }
    }
}
