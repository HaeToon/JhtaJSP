package com.heo96.mybatis.controller.board;

import com.heo96.mybatis.dao.BoardDao;
import com.heo96.mybatis.dto.BoardDto;
import com.heo96.mybatis.dto.PageDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/board/list")
public class BoardList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int start = 1;
        int end = 10;
        int paginationStart=1;
        int paginationEnd=10;

        if(request.getParameter("page")!=null){
            start = (Integer.parseInt(request.getParameter("page"))-1)*10+1;
        }
        end=start+9;

//        Map<String,Integer>pageMap = new HashMap<>();
//        pageMap.put("start",1);
//        pageMap.put("end",10);

        PageDto pageDto = new PageDto();
        pageDto.setStart(start);
        pageDto.setEnd(end);

        BoardDao boardDao = new BoardDao();
        BoardDao boardTotalDao = new BoardDao();
        int total = boardTotalDao.getBoardTotal();

//      List<BoardDto> boardList = boardDao.getBoardList();
//      List<BoardDto> boardList = boardDao.getBoardList(pageMap);
        List<BoardDto> boardList = boardDao.getBoardList(pageDto);
        
        request.setAttribute("boardList",boardList);
        request.setAttribute("total",total);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/list.jsp");
        dispatcher.forward(request,response);
    }
}
