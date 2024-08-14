package com.project.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity // Table을 표현하는 자료형
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="user_info")
public class UserEntity {
    @Id
    private String id;
    
    
    private String pw;
    private String name;
    private String phone;
    private String prinfo;
    private String addr;
    private Integer score;
    private java.sql.Date joined_at;
    private String userPp;
    
}

