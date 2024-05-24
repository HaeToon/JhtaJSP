package com.heo96.practice0522model2.controller.user;

import com.heo96.practice0522model2.dao.UserDao;
import com.heo96.practice0522model2.dto.UserDto;
import com.heo96.practice0522model2.utils.Alert;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/user/user-login")
public class UserLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user/user_login.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");

        UserDao loginUserDao = new UserDao();
        UserDto loginUserDto = loginUserDao.userLogin(userID,userPW);

        if(loginUserDto!=null){
            HttpSession session = request.getSession();
            session.setAttribute("sessionLoginMemberDto",loginUserDto);
            Alert.alertAndNext(response,"로그인 성공","/index/index");
        }else {
            Alert.alertAndBack(response,"로그인 실패");
        }
    }
}
