package com.heo96.jspmodel2.controller.member;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.MemberDto;
import com.heo96.jspmodel2.utils.ScriptWritter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/member/insert-process")
public class MemberInsertProcess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doPost(req, resp);
         /*
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");
        String userName = request.getParameter("userName");
        String userBirth = request.getParameter("userBirth");
        String userEmail = request.getParameter("userEmail");
        String postcode = request.getParameter("postcode");
        String adress = request.getParameter("adress");
        String detailAdress = request.getParameter("detailAdress");

        MemberDto insertMemberDto = new MemberDto();

        insertMemberDto.setUserID(userID);
        insertMemberDto.setUserPW(userPW);
        insertMemberDto.setUserName(userName);
        insertMemberDto.setUserBirth(userBirth);
        insertMemberDto.setEmail(userEmail);
        insertMemberDto.setPostcode(postcode);
        insertMemberDto.setAdress(adress);
        insertMemberDto.setDetailAdress(detailAdress);
        */

//        BCrypt 비밀번호 암호화
        String userPW = request.getParameter("userPW");
        String salt=BCrypt.gensalt();
        userPW=BCrypt.hashpw(userPW,salt);

        //builder 패턴 이용시 위 보다 더 간단하게 작성가능.
        MemberDto insertMemberDto = MemberDto.builder()
                .userID(request.getParameter("userID"))
                .userPW(userPW)
                .userName(request.getParameter("userName"))
                .userBirth(request.getParameter("userBirth"))
                .email(request.getParameter("userEmail"))
                .postcode(request.getParameter("postcode"))
                .adress(request.getParameter("adress"))
                .detailAdress(request.getParameter("detailAdress"))
                .grade("member")
                .build();

        MemberDao memberDao = new MemberDao();
        int result =0;
        try{
        result = memberDao.insertMember(insertMemberDto);
            if(result>0){
                ScriptWritter.alertAndNext(response,"회원가입이 완료되었습니다.","/index/index");
            }else {
                ScriptWritter.alertAndBack(response,"알수없는 오류로 인해 회원가입에 실패했습니다.");
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }finally{
            memberDao.close();
        }

    }
}
