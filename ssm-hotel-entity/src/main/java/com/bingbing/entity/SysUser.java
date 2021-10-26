package com.bingbing.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
public class SysUser {
    private Integer id;//用户编号
    private String userName;//用户名
    private String password;//密码
    private String realName;//真实姓名
    private Integer sex;//性别 1男 2女
    private Integer deptId;//部门编号
    private Integer status;//用户状态 1可用 2禁用
    private String email;//邮箱
    private String phone;//电话
    private Integer userType;//用户类型 1超级管理员  2普通用户

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date hireDate;//入职日期
    private Integer createdBy;//创建人
    private Date createDate;//创建日期
    private Integer modifyBy;//修改人
    private Date modifyDate;//修改日期
    private String remark;//备注

    //一个用户有多个角色
    private List<Role> roleList;
//
//    //一对一
//    private Dept dept;
}
