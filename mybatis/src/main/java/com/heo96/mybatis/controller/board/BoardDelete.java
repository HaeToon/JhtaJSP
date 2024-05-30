package com.heo96.mybatis.controller.board;

import com.heo96.mybatis.dao.BoardDao;
import com.heo96.mybatis.dto.BoardDto;
import com.heo96.mybatis.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/delete")
public class BoardDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-delete.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result=0;
        BoardDto boardDto = BoardDto.builder()
                .no(Integer.parseInt(request.getParameter("no")))
                .password(request.getParameter("password"))
                .build();

        BoardDao boardDao = new BoardDao();
        result = boardDao.deleteBoard(boardDto);
        if(result>0){
            ScriptWritter.alertAndNext(response,"삭제되었습니다.","../board/list");
        }else {
            ScriptWritter.alertAndBack(response,"알수없는 오류로 삭제에 실패했습니다.");
        }
    }
}
