package com.heo96.jspmodel2.controller.mail;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.mail.NaverMail;
import com.heo96.jspmodel2.utils.ScriptWritter;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@WebServlet("/mail/get-password")
public class GetPasswordMail extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID=request.getParameter("userID");
        String userEmail=request.getParameter("userEmail");
        String uuid = UUID.randomUUID().toString();
        String changedPW = uuid.substring(0,6);
        System.out.println(uuid);
        ServletContext application = request.getServletContext();

        MemberDao memberDao = new MemberDao();
        int result = memberDao.updatePassword(userID,changedPW);
        if(result>0){
            Map<String,String> sendMailInfo = new HashMap<>();
            sendMailInfo.put("from","gxg9610@naver.com");
            sendMailInfo.put("to",userEmail);
            sendMailInfo.put("subject","비밀번호 재설정");
//            sendMailInfo.put("content","비밀번호가"+changedPW+"로 초기화되었습니다.");
//            sendMailInfo.put("format","text/plain; charset=utf-8");
            sendMailInfo.put("content","비밀번호가 <h1>"+changedPW+"</h1> 로 초기화되었습니다.");
//            sendMailInfo.put("content","비밀번호가 <a href=http://localhost:8080/member/login>"+changedPW+"</a> 로 초기화되었습니다.");
            sendMailInfo.put("format","text/html; charset=utf-8");
            try{
                NaverMail naverMail = new NaverMail(application);
                naverMail.sendMail(sendMailInfo);
                System.out.println("이메일 전송 완료");
                ScriptWritter.alertAndNext(response,"메일이 발송되었습니다","../member/login");
            } catch(Exception e){
                e.printStackTrace();
                System.out.println("이메일 전송 실패");
                ScriptWritter.alertAndBack(response,"메일 전송에 실패했습니다.");
            }
        }

    }
}
