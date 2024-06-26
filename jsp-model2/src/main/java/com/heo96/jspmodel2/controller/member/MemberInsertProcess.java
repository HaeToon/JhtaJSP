package com.heo96.jspmodel2.controller.member;

import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.MemberDto;
import com.heo96.jspmodel2.utils.ScriptWritter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.mindrot.jbcrypt.BCrypt;

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/member/insert-process")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 15    // 15 MB
)
public class MemberInsertProcess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

//      이미지 업로드
        Part profile = request.getPart("profile");
//        String originalProfile=""; //파일명.jpg
        String renameProfile=""; // 파일명_20240523-151234.jpg
        String renameFile="";

//        String partHeader = profile.getHeader("content-disposition"); //여기서 filename 추출해야함.
//        String partArray[] = partHeader.split("filename=");//partArray배열에 넣기
//        String originalFileName = partArray[1].trim().replace("\"","");

        String fileName = profile.getSubmittedFileName(); // 프론트에서 넘어온 파일이름
//        System.out.println("filename"+fileName);

//      폴더경로 localhost:8080/upload/
        //serverUploadDir = form에서 업로드된 파일이 서버로 업로드되는 경로
        String serverUploadDir = this.getServletContext().getRealPath("upload");
        System.out.println("serverUploadDir ===" +serverUploadDir);

        File dir = new File(serverUploadDir);
        if(!dir.exists()){ //dir이 없으면 dir을 생성
            dir.mkdir();
        }

        if(!fileName.isEmpty()){ //파일이 넘어온것. 특정 경로에 옮겨두기
            profile.write(serverUploadDir+ File.separator + fileName); //원본파일
            String first = fileName.substring(0,fileName.lastIndexOf("."));   //파일명
            String extention = fileName.substring(fileName.lastIndexOf(".")); //확장자명
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("_YYYYMMdd_hhmmss");
            String formatNow = now.format(dateTimeFormatter);
            renameFile = first+formatNow+extention;
            //파일명변경 first=404 formatnow=20240524_092933 extention =.jpg
            System.out.println(renameFile);

            fileName=serverUploadDir+File.separator+fileName; //localhost:8080/upload/originalFileName

            renameProfile=serverUploadDir+File.separator+renameFile; //localhost:8080/upload/renameFile

            File oldFile = new File(fileName);
            File newFile = new File(renameProfile);
            oldFile.renameTo(newFile); // 덮어쓰기
        }

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
                .originalProfile(fileName) //원본파일
                .renameProfile(renameFile) //원본파일+난수
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
