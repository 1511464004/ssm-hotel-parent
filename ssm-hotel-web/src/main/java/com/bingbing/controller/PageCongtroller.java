package com.bingbing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class PageCongtroller {

    /**
     * 跳转部门管理页面
     * @return
     */
    @RequestMapping("/toDeptManager.html")
    public String toDeptManager() {
        return "dept/deptManager";
    }

    /**
     * 跳转角色管理页面
     * @return
     */
    @RequestMapping("/toRoleManager.html")
    public String toRoleManager() {
        return "role/roleManager";
    }
}