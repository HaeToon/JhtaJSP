package com.heo96.mybatis.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class MemberDto {
    private int no;
    private String userID;
    private String userPW;
    private String userName;
    private String userBirth;
    private String userEmail;
    private String postcode;
    private String adress;
    private String detailAdress;
    private Grade grade;
    private String regdate;
    private String originalProfile;
    private String renameProfile;
}
