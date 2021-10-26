package com.bingbing.utils;

import lombok.Data;

import java.util.List;

@Data
public class MenuNode {
    private Integer id;//菜单编号
    private Integer pid;//父级菜单编号
    private String title;//菜单名称
    private String href;//链接地址
    private Integer spread;//是否展开
    private String target;//打开方式
    private String icon;//菜单图标
    private List<MenuNode> child;//子菜单集合列表
}
