package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.Checkin;
import com.bingbing.entity.SysUser;
import com.bingbing.service.CheckinService;
import com.bingbing.service.SysUserService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.utils.SystemConstants;
import com.bingbing.vo.CheckinVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/checkin")
public class CheckinController {

    @Resource
    private CheckinService checkinService;

    @Resource
    private SysUserService sysUserService;

    /**
     *  查询入住列表
     * @param checkinVo
     * @return
     */
    @RequestMapping("/list")
    public DataGridViewResult list(CheckinVo checkinVo){
        //设置分页信息
        PageHelper.startPage(checkinVo.getPage(),checkinVo.getLimit());
        //调用方法
        List<Checkin> checkinList = checkinService.findCheckinList(checkinVo);
        //创建分页对象
        PageInfo<Checkin> pageInfo = new PageInfo<Checkin>(checkinList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }

    /**
     * 登记入住
     * @param checkin
     * @param principal
     * @return
     */
    @RequestMapping("/addCheckin")
    public String addCheckin(Checkin checkin, Principal principal){
        Map<String,Object> map = new HashMap<String,Object>();
        //获取当前登录用户
        SysUser loginUser = sysUserService.getUserByUserName(principal.getName());
        //设置创建人
        checkin.setCreatedBy(loginUser.getId());
        //调用方法
        if(checkinService.insert(checkin)>0){
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"登记成功");
        }else{
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"登记失败");
        }
        return JSON.toJSONString(map);
    }

}
