package com.heo96.jspmodel2.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class BoardDto {
    private int no;
    private String password;
    private String userID;
    private String userPW;
    private String userName;
    private String subject;
    private String content;
    private String regdate;
    private int hit;
}
