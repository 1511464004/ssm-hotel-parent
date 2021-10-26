package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.Permission;
import com.bingbing.service.PermissionService;
import com.bingbing.utils.MenuNode;
import com.bingbing.utils.TreeUtil;
import com.bingbing.vo.PermissionVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/menu")
public class MenuController {

    @Resource
    private PermissionService permissionService;

    /**
     * 加载首页左侧菜单导航列表
     * @param permissionVo
     * @return
     */
    @RequestMapping("/loadIndexMenuLeft")
    public String loadIndexMenuLeft(PermissionVo permissionVo) {
        //创建Map集合，保存MenuInfo菜单信息
        Map<String,Object> map = new LinkedHashMap<>();
        //创建Map集合，保存homeInfo菜单信息
        Map<String,Object> homeInfo = new LinkedHashMap<>();
        //创建Map集合，保存logoInfo菜单信息
        Map<String,Object> logoInfo = new LinkedHashMap<>();

        //设置只查询菜单
        permissionVo.setType("menu");
        //调用查询菜单列表的方法
        List<Permission> menuList = permissionService.findPermissionList(permissionVo);
        //创建集合，保存菜单关系
        List<MenuNode> menuNodeList = new ArrayList<>();
        //循环遍历集合
        for (Permission permission : menuList) {
            //创建MenuNode对象
            MenuNode menuNode = new MenuNode();
            menuNode.setId(permission.getId());//菜单编号
            menuNode.setPid(permission.getPid());//父级菜单编号
            menuNode.setTitle(permission.getTitle());//标题
            menuNode.setHref(permission.getHref());//跳转地址
            menuNode.setIcon(permission.getIcon());//菜单图标
            menuNode.setSpread(permission.getSpread());//是否展开
            menuNode.setTarget(permission.getTarget());//打开方式
            //将MenuNode对象添加到集合中
            menuNodeList.add(menuNode);
        }
        //保存HomeInfo信息
        homeInfo.put("title","首页");
        homeInfo.put("href","/admin/desktop");//跳转地址
        //logoInfo信息
        logoInfo.put("title","酒店管理系统");//logo标题
        logoInfo.put("image","/static/layui/images/logo.png");//logo图片
        logoInfo.put("href","/index.jsp");//首页地址
        //保存菜单menuInfo信息
        map.put("menuInfo", TreeUtil.toTree(menuNodeList,0));
        map.put("homeInfo",homeInfo);
        map.put("logoInfo",logoInfo);

        return JSON.toJSONString(map);
    }
}
