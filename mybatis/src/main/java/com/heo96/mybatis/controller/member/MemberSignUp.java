package com.heo96.mybatis.controller.member;

import com.heo96.mybatis.dao.MemberDao;
import com.heo96.mybatis.dto.MemberDto;
import com.heo96.mybatis.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;
import org.mindrot.jbcrypt.BCrypt;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@MultipartConfig
@WebServlet("/member/member-sign-up")
public class MemberSignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/member/member-sign-up-form.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String originalProfile = "";
        String renameProfile="";

        String userPW = request.getParameter("userPW");
        String salt = BCrypt.gensalt();
        String changedPW =BCrypt.hashpw(userPW,salt);

        if(request.getPart("profile")!=null){
            Part profile = request.getPart("profile");
            originalProfile=profile.getSubmittedFileName(); // 파일명
            //this.getServletContext() = edit config의 deploy의 app content
            String serverUploadDir = this.getServletContext().getRealPath("upload");
            File dir = new File(serverUploadDir);
            if(!dir.exists()){
                dir.mkdir();
            }
            if(!originalProfile.isEmpty()){
                profile.write(serverUploadDir+File.separator+originalProfile); // 원본파일을 미리 쓰기
                String first = originalProfile.substring(0,originalProfile.lastIndexOf(".")); // lastindexof 뒤에서부터 읽는것 확장자명을 제외한 것
                String extension=originalProfile.substring(originalProfile.lastIndexOf(".")); // 확장자명
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("YYYYMMDD_HHMMSS");
                String formatNow = now.format(dateTimeFormatter); // 현재시간을 문자열로
                renameProfile=first+"_"+formatNow+extension;

                File oldFile = new File(serverUploadDir+File.separator+originalProfile);
                File newFile = new File(serverUploadDir+File.separator+renameProfile);
//                Thumbnails.of(oldFile).size(250,250).toFiles(dir, Rename.NO_CHANGE); //업로드 파일 사이즈 변경
                oldFile.renameTo(newFile);

            }
        }



        MemberDao memberDao = new MemberDao();
        MemberDto signUpMemberDto = MemberDto.builder()
                .userID(request.getParameter("userID"))
                .userPW(changedPW)
                .userName(request.getParameter("userName"))
                .userBirth(request.getParameter("userBirth"))
                .userEmail(request.getParameter("userEmail"))
                .postcode(request.getParameter("postcode"))
                .adress(request.getParameter("adress"))
                .detailAdress(request.getParameter("detailAdress"))
                .grade("member")
                .originalProfile(originalProfile)
                .renameProfile(renameProfile)
                .build();
        int result = memberDao.signUpMember(signUpMemberDto);
        if(result>0){
            ScriptWritter.alertAndNext(response,request.getParameter("userName")+"님회원가입이 완료되었습니다.","/index/index");
        }else{
            ScriptWritter.alertAndBack(response,"알수없는 오류로 인해 회원가입에 실패했습니다.");
        }
    }
}
