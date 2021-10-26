package com.bingbing.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Dept {
    private Integer id;//部门编号

    private String deptName;//部门名称

    private String address;//部门地址

    private Date createDate;//创建时间

    private String remark;//备注
}
