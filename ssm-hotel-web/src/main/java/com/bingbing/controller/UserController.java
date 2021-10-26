package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.SysUser;
import com.bingbing.service.SysUserService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.utils.SystemConstants;
import com.bingbing.vo.UserVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/user")
public class UserController {

    @Resource
    private SysUserService userService;

    /**
     * 注销
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();//清空session数据
        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping("/list")
    public DataGridViewResult list(UserVo userVo) {
        //设置分页信息
        PageHelper.startPage(userVo.getPage(),userVo.getLimit());
        //调用查询的方法
        List<SysUser> userList =  userService.findUserList(userVo);
        //创建分页对象
        PageInfo<SysUser> pageInfo = new PageInfo<>(userList);
        //返回对象
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }

    /**
     * 添加用户
     * @param sysUser
     * @return
     */
    @ResponseBody
    @RequestMapping("/addUser")
    public String addDept(SysUser sysUser) {
        Map<String,Object> map = new HashMap<>();
        if (sysUser.getUserName() == null || sysUser.getUserName() == "") {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败，用户名字不能为空！");
            return JSON.toJSONString(map);
        }
        SysUser sysUser1 = userService.getUserByUserName(sysUser.getUserName());
        if (sysUser1 != null) {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败，这个用户名字已经存在！");
            return JSON.toJSONString(map);
        }
        //创建人
        sysUser.setCreatedBy(1);
        if (userService.insert(sysUser) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"添加成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 修改用户
     * @param sysUser
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateUser")
    public String updateUser(SysUser sysUser) {
        Map<String,Object> map = new HashMap<>();
        if (sysUser.getUserName() == null || sysUser.getUserName() == "") {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败，用户名字不能为空！");
            return JSON.toJSONString(map);
        }
        SysUser sysUser1 = userService.getUserByUserName(sysUser.getUserName());
        if (sysUser1 != null) {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败，这个用户名字已经存在！");
            return JSON.toJSONString(map);
        }
        //创建人
        sysUser.setCreatedBy(1);
        if (userService.updateUser(sysUser) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"修改成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping("/deleteById")
    public String deleteById(Integer id) {
        Map<String,Object> map = new HashMap<>();
        if (userService.deleteById(id) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"删除成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"删除失败");
        }
        return JSON.toJSONString(map);
    }
}
