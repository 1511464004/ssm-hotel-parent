package com.bingbing.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Account {
    private Long id;
    private String loginName;
    private String password;
    private String realName;
    private String idCard;
    private String phone;
    private String email;
    private Integer status;
    private Date registTime;
    //角色列表
    private List<AccountRole> roleList;
}
