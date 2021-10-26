package com.bingbing.service.impl;

import com.bingbing.dao.SysUserMapper;
import com.bingbing.entity.Role;
import com.bingbing.entity.SysUser;
import com.bingbing.service.SysUserService;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class SysUserServiceImpl implements SysUserService {

    @Resource
    private SysUserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //创建角色列表集合
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        //调用根据用户姓名查询用户信息的方法
        SysUser sysUser = userMapper.findUserByUserName(username);
        //循环遍历用户角色列表
        for (Role role : sysUser.getRoleList()) {
            //将角色编码添加到角色列表集合中
            authorities.add(new SimpleGrantedAuthority(role.getRoleCode()));
        }
        //创建User对象
        User user = new User(sysUser.getUserName(),
                sysUser.getPassword(),
                sysUser.getStatus()==1,
                true,
                true,
                true,
                authorities);
        return user;
    }

    @Override
    public int getUserCountByDeptId(Integer deptId) {
        return userMapper.getUserCountByDeptId(deptId);
    }
}
