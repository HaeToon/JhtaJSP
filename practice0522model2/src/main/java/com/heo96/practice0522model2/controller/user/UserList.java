package com.heo96.practice0522model2.controller.user;

import com.heo96.practice0522model2.dao.UserDao;
import com.heo96.practice0522model2.dto.UserDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet("/user/user-list")
public class UserList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDao userDao = new UserDao();
        List<UserDto> userDtoList = userDao.userDtoList();
        request.setAttribute("userDtoList",userDtoList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user/user_list.jsp");
        dispatcher.forward(request,response);
    }

}
