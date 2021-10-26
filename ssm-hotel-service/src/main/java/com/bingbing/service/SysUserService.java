package com.bingbing.service;

import org.springframework.security.core.userdetails.UserDetailsService;

public interface SysUserService extends UserDetailsService {

    /**
     * 根据部门编号查询该部门下的员工信息
     * @param deptId
     * @return
     */
    int getUserCountByDeptId(Integer deptId);
}
