package com.heo96.mybatis.mybatis;

import com.heo96.mybatis.dto.Grade;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(Grade.class)
public class GradeTypeHandler implements TypeHandler<Grade> {

    @Override
    public void setParameter(PreparedStatement ps, int i, Grade parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i,parameter.getLable());
    }

    @Override
    public Grade getResult(ResultSet rs, String columnName) throws SQLException {
        String grade = rs.getString(columnName); //member,manager.admin
        Grade result =null;
        if(grade.equalsIgnoreCase("member")){
            result=Grade.MEMBER;
        }else if(grade.equalsIgnoreCase("manager")){
            result=Grade.MANAGER;
        }else {
            result=Grade.ADMIN;
        }
        return result;
    }

    @Override
    public Grade getResult(ResultSet rs, int columnIndex) throws SQLException {
        String grade = rs.getString(columnIndex); //member,manager.admin
        Grade result =null;
        if(grade.equalsIgnoreCase("member")){
            result=Grade.MEMBER;
        }else if(grade.equalsIgnoreCase("manager")){
            result=Grade.MANAGER;
        }else {
            result=Grade.ADMIN;
        }
        return result;
    }

    @Override
    public Grade getResult(CallableStatement cs, int columnIndex) throws SQLException {
        String grade = cs.getString(columnIndex); //member,manager.admin
        Grade result =null;
        if(grade.equalsIgnoreCase("member")){
            result=Grade.MEMBER;
        }else if(grade.equalsIgnoreCase("manager")){
            result=Grade.MANAGER;
        }else {
            result=Grade.ADMIN;
        }
        return result;
    }
}
