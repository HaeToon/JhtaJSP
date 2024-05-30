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

@WebServlet("/board/content-reply")
public class BoardReply extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-reply-write.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result = 0;
        BoardDao updateRelevelDao = new BoardDao();
        BoardDto updateBoardDto = BoardDto.builder()
                .regroup(Integer.parseInt(request.getParameter("regroup")))
                .relevel(Integer.parseInt(request.getParameter("relevel")))
                .restep(Integer.parseInt(request.getParameter("restep")))
                .build();
        updateRelevelDao.updateRelevel(updateBoardDto);

        BoardDao boardDao = new BoardDao();
        BoardDto boardDto = BoardDto.builder()
                .userID(request.getParameter("userID"))
                .userName(request.getParameter("userName"))
                .password(request.getParameter("password"))
                .subject(request.getParameter("subject"))
                .content(request.getParameter("content"))
                .regroup(Integer.parseInt(request.getParameter("regroup")))
                .relevel(Integer.parseInt(request.getParameter("relevel"))+1)
                .restep(Integer.parseInt(request.getParameter("restep"))+1)
                .build();

        result=boardDao.writeBoardReply(boardDto);
        if(result>0){
            ScriptWritter.alertAndNext(response,"작성되었습니다.","/board/list");
        }else{
            ScriptWritter.alertAndBack(response,"알수없는 오류로 작성에 실패했습니다.");
        }

    }
}
