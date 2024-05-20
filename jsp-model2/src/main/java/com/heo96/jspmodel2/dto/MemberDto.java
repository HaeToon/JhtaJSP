package com.heo96.jspmodel2.dto;


import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberDto {
    private int no;
    private String userID;
    private String userPW;
    private String userName;
    private String userBirth;
    private String email;
    private String postcode;
    private String adress;
    private String detailAdress;
}
