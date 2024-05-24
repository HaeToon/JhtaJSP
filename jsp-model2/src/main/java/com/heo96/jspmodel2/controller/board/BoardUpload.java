package com.heo96.jspmodel2.controller.board;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

@MultipartConfig(

)
@WebServlet("/board/upload-file")
public class BoardUpload extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part ckUploadedFile = request.getPart("upload"); //게시판에 이미지 업로드했을때 ckedit에서 정해져있는것
        //<input type="file" name="upload"> 이런식임
        String fileName = ckUploadedFile.getSubmittedFileName(); // 프론트에서 넘어온 파일이름
        String renameProfile=""; // 파일명_20240523-151234.jpg
        String renameFile="";
//        System.out.println(fileName);

        //serverUploadDir = form에서 업로드된 파일이 서버로 업로드되는 경로
        String serverUploadDir = this.getServletContext().getRealPath("upload");
//        System.out.println("serverUploadDir ===" +serverUploadDir);

        File dir = new File(serverUploadDir);
        if(!dir.exists()){ //dir이 없으면 dir을 생성
            dir.mkdir();
        }

        if(!fileName.isEmpty()){ //파일이 넘어온것. 특정 경로에 옮겨두기
            ckUploadedFile.write(serverUploadDir+ File.separator + fileName); //원본파일
            String first = fileName.substring(0,fileName.lastIndexOf("."));   //파일명
            String extention = fileName.substring(fileName.lastIndexOf(".")); //확장자명
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("_YYYYMMdd_HHmmss");
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
        Gson gson = new Gson();
//        {
//            "uploaded":"true",
//                "url":"이미지 저장경로"
//        }
        Map<String,Object>map = new HashMap<>();
        map.put("uploaded",true);
        map.put("url",request.getContextPath()+"/upload/"+renameFile);
        String resultJson = gson.toJson(map);
        System.out.println(resultJson);
        //dispatch 하는 page를 만들거나 PrintWriter로 바로쓰기
        PrintWriter out = response.getWriter();
        response.setContentType("application/json; charset=utf-8");
        out.println(resultJson);
    }
}
