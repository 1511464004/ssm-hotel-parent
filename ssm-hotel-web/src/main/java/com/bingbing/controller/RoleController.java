package com.bingbing.controller;

import com.bingbing.entity.Role;
import com.bingbing.service.RoleService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.vo.RoleVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/admin/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    /**
     * 查询角色列表
     * @param roleVo
     * @return
     */
    @RequestMapping("/list")
    public DataGridViewResult list(RoleVo roleVo) {
        //设置分页信息
        PageHelper.startPage(roleVo.getPage(),roleVo.getLimit());
        //调用查询部门列表的方法
        List<Role> roleList = roleService.findRoleList(roleVo);
        //创建分页对象
        PageInfo<Role> pageInfo = new PageInfo<>(roleList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }
}
