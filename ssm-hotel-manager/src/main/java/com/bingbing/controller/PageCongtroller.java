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

    /**
     * 跳转欢迎页面
     * @return
     */
    @RequestMapping("/welcome.html")
    public String toWelcome() {
        return "welcome";
    }

    /**
     * 跳转楼层管理页面
     * @return
     */
    @RequestMapping("/toFloorManager.html")
    public String toFloorManager() {
        return "floor/floorManager";
    }

    /**
     * 跳转房型管理页面
     * @return
     */
    @RequestMapping("/toRoomTypeManager.html")
    public String toRoomTypeManager() {
        return "roomType/roomTypeManager";
    }

    /**
     * 跳转房间管理页面
     * @return
     */
    @RequestMapping("/toRoomManager.html")
    public String toRoomManager() {
        return "room/roomManager";
    }

    /**
     * 去到预订管理页面
     * @return
     */
    @RequestMapping("/toOrdersManager.html")
    public String toOrdersManager(){
        return "orders/ordersManager";
    }

    /**
     * 去到入住管理页面
     * @return
     */
    @RequestMapping("/toCheckinManager.html")
    public String toCheckinManager(){
        return "checkin/checkinManager";
    }

    /**
     * 去到年度营业额报表统计分析页面
     * @return
     */
    @RequestMapping("/toYearTotalPriceManager.html")
    public String toYearTotalPriceManager(){
        return "charts/yearTotalPriceCharts";
    }

    /**
     * 去到月营业额报表统计分析页面
     * @return
     */
    @RequestMapping("/toYearOfMonthCharts.html")
    public String toYearOfMonthCharts(){
        return "charts/yearOfMonthCharts";
    }
}
