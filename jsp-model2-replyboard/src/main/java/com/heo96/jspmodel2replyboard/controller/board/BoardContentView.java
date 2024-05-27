package com.heo96.jspmodel2replyboard.controller.board;

import com.heo96.jspmodel2replyboard.dao.BoardDao;
import com.heo96.jspmodel2replyboard.dto.BoardDto;
import com.heo96.jspmodel2replyboard.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/content-view")
public class BoardContentView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));
        BoardDao boardDao = new BoardDao();
        BoardDto boardDto = boardDao.contentView(no);
        request.setAttribute("content",boardDto);
        if(boardDto!=null){
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-view.jsp");
            dispatcher.forward(request,response);
        }else {
            ScriptWritter.alertAndBack(response,"오류발생");
        }
    }
}
