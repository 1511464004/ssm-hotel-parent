package com.bingbing.entity;

import lombok.Data;

@Data
public class AccountRole {
    private Integer id;//角色编号
    private String roleCode;//角色编码
    private String roleName;//角色名称
    private String roleDesc;//角色描述
}
