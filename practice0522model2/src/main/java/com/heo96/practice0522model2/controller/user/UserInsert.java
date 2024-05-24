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

import java.io.IOException;

@WebServlet("/user/user-insert")
public class UserInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user/user_insert.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDto insertUserDto = new UserDto();
        insertUserDto= UserDto.builder()
                .userID(request.getParameter("userID"))
                .userPW(request.getParameter("userPW"))
                .userName(request.getParameter("userName"))
                .userBirth(request.getParameter("userBirth"))
                .userEmail(request.getParameter("userEmail"))
                .userPostCode(request.getParameter("userPostCode"))
                .userAdress(request.getParameter("userAdress"))
                .userDetailAdress(request.getParameter("userDetailAdress"))
                .build();

        UserDao userDao = new UserDao();
        int result = userDao.userInsert(insertUserDto);
        if(result>0){
            Alert.alertAndNext(response,"회원가입이 완료되었습니다.","/index/index");
        }else {
            Alert.alertAndBack(response,"회원가입에 실패했습니다.");
        }
    }
}
