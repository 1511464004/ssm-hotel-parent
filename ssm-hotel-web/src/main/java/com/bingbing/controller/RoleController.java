package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.Role;
import com.bingbing.service.RoleService;
import com.bingbing.service.SysUserService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.utils.SystemConstants;
import com.bingbing.vo.RoleVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @Resource
    private SysUserService userService;

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

    /**
     * 添加角色
     * @param role
     * @return
     */
    @RequestMapping("/addRole")
    public String addRole(Role role) {
        Map<String,Object> map = new HashMap<>();
        if (roleService.insert(role) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"添加成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 修改角色
     * @param role
     * @return
     */
    @RequestMapping("/updateRole")
    public String updateDept(Role role) {
        Map<String,Object> map = new HashMap<>();
        if (roleService.updateRole(role) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"修改成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 删除检查角色下是否存在用户信息
     * @param roleId
     * @return
     */
    @RequestMapping("/checkRoleHasUser")
    public String checkRoleHasUser(Integer roleId) {
        Map<String,Object> map = new HashMap<>();
        if (userService.getUserCountByRoleId(roleId) > 0) {
            map.put(SystemConstants.EXIST,true);
            map.put(SystemConstants.MESSAGE,"该角色下存在用户信息，无法删除");
        } else {
            map.put(SystemConstants.EXIST,false);
        }
        return JSON.toJSONString(map);
    }

    /**
     * 删除角色
     * @param id
     * @return
     */
    @RequestMapping("/deleteById")
    public String deleteById(Integer id) {
        Map<String,Object> map = new HashMap<>();
        if (roleService.deleteById(id) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"删除成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"删除失败");
        }
        return JSON.toJSONString(map);
    }
}
