package com.heo96.jspmodel2.controller.board;

import com.heo96.jspmodel2.dao.BoardDao;
import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.BoardDto;
import com.heo96.jspmodel2.dto.MemberDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/board/content-list")
public class BoardContentList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDao boardDao = new BoardDao();
        List<BoardDto>boardcontentListDto = boardDao.boardContentList();
        request.setAttribute("contentListDto",boardcontentListDto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-list-model2.jsp");
        dispatcher.forward(request,response);
    }
}
