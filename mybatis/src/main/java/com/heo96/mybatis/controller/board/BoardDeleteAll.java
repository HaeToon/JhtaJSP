package com.heo96.mybatis.controller.board;

import com.heo96.mybatis.dao.BoardDao;
import com.heo96.mybatis.utils.ScriptWritter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/delete-all")
public class BoardDeleteAll extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result =0;
        String tempArray[] = request.getParameterValues("check");//getParameterValues배열로 떨어짐
        int noArray[] = new int[tempArray.length];
        for(int i=0; i<tempArray.length; i++){
            noArray[i]=Integer.parseInt(tempArray[i]);
        }
        BoardDao boardDao = new BoardDao();
        result=boardDao.deleteAllBoard(noArray);

        if(result>0){
            ScriptWritter.alertAndNext(response,"삭제되었습니다.","/board/list");
        }else{
            ScriptWritter.alertAndBack(response,"알수없는 오류 발생");
        }
    }
}
