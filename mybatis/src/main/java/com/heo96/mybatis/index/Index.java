package com.heo96.mybatis.index;

import com.heo96.mybatis.dto.ModalDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/index/index")
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        ModalDto modalDto = new ModalDto("제목","내용","show");
//        request.setAttribute("modal",modalDto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/index/index.jsp");
        dispatcher.forward(request,response);
    }
}
