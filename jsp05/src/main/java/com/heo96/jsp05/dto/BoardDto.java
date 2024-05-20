package com.heo96.jsp05.dto;

import lombok.*;

//annotation lombok 롬복으로 getter setter constructor 간단하게 생성
@Getter
@Setter
@NoArgsConstructor //기본생성자
@AllArgsConstructor //전부다들어있는 생성자
@ToString
public class BoardDto { //column 명 그대로 씀.
    private int no;
    private String password;
    private String userid;
    private String username;
    private String subject;
    private String content;
    private String regdate;
    private int hit;
}
