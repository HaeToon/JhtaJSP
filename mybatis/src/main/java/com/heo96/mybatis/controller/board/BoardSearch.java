package com.heo96.mybatis.controller.board;

import com.heo96.mybatis.dao.BoardDao;
import com.heo96.mybatis.dto.BoardDto;
import com.heo96.mybatis.dto.SearchDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/board/search")
public class BoardSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String searchWord=request.getParameter("searchWord");
        int start = 1;
        int listPerPage=10;
        int end =start*listPerPage;
//        System.out.println(search);
//        System.out.println(searchWord);
        SearchDto searchDto = SearchDto.builder()
                .search(search)
                .searchWord(searchWord)
                .start(start)
                .end(end)
                .build();
        BoardDao boardDao = new BoardDao();
        List<BoardDto>searchBoardList =  boardDao.searchBoard(searchDto);

        BoardDao boardTotalDao = new BoardDao();
        int total = boardTotalDao.getSearchTotal(searchDto);
        request.setAttribute("searchBoardList",searchBoardList);
        request.setAttribute("search",search);
        request.setAttribute("searchWord",searchWord);
        request.setAttribute("total",total);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/search-list.jsp");
        dispatcher.forward(request,response);
    }
}
