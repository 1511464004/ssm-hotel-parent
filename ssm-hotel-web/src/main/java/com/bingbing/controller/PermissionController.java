package com.bingbing.controller;

import com.bingbing.entity.Permission;
import com.bingbing.service.PermissionService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.utils.TreeNode;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/admin/permission")
public class PermissionController {

    @Resource
    private PermissionService permissionService;

    /**
     * 加载树形菜单
     * @return
     */
    @RequestMapping("/loadMenuTree")
    public DataGridViewResult loadMenuTree() {
        //调用查询所有菜单权限列表的方法
        List<Permission> permissionList = permissionService.findPermissionList(null);
        //创建树形节点集合
        List<TreeNode> treeNodes = new ArrayList<>();
        //循环遍历权限菜单列表集合
        for (Permission permission : permissionList) {
            //是否展开，如果状态为空或状态为1表示节点处于展开状态
            boolean spread = (permission.getSpread() == null || permission.getSpread() == 1) ? true : false;
            //将数据放到节点集合中
            treeNodes.add(new TreeNode(permission.getId(),permission.getPid(),permission.getTitle(),spread));

        }
        return new DataGridViewResult(permissionList);
    }
}
