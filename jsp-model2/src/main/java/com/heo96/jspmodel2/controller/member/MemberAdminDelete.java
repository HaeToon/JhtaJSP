package com.heo96.jspmodel2.controller.member;

import com.google.gson.Gson;
import com.heo96.jspmodel2.dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/delete-ajax")
public class MemberAdminDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doGet(req, resp);
        String userID=request.getParameter("userID");
        MemberDao deleteMemberDao=new MemberDao();
        int result = deleteMemberDao.deleteMember(userID);
        Map<String,String>resultMap=new HashMap<>();
        if(result>0){
            resultMap.put("isDelete","yes");
        }else {
            resultMap.put("isDelete","no");
        }
        Gson gson = new Gson();
        String resultJson = gson.toJson(resultMap);
        PrintWriter out = response.getWriter();
        response.setContentType("application/json; charset=UTF-8");
        out.println(resultJson);
    }
}
