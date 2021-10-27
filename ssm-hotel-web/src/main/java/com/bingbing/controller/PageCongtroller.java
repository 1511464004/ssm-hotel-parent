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

    /**
     * 跳转用户管理页面
     * @return
     */
    @RequestMapping("/toUserManager.html")
    public String toUserManager() {
        return "user/userManager";
    }

    /**
     * 跳转权限管理页面
     * @return
     */
    @RequestMapping("/toPermissionManager.html")
    public String toPermissionManager() {
        return "permission/permissionManager";
    }
}
