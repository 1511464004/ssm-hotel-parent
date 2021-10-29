package com.bingbing.service;

import com.bingbing.entity.SysUser;
import com.bingbing.vo.UserVo;
import org.apache.ibatis.annotations.Select;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface SysUserService extends UserDetailsService {

    /**
     * 根据部门编号查询该部门下的员工信息
     * @param deptId
     * @return
     */
    int getUserCountByDeptId(Integer deptId);

    /**
     * 根据角色编号查询该角色下的用户数量
     * @param roleId
     * @return
     */
    @Select("select count(1) from sys_user_role t1 inner join sys_user t2 on t2.id = t1.uid where t1.rid = #{roleId}")
    int getUserCountByRoleId(Integer roleId);

    /**
     * 查询用户列表
     * @param userVo
     * @return
     */
    List<SysUser> findUserList(UserVo userVo);

    public int insert(SysUser sysUser);

    SysUser getUserByUserName(String userName);

    /**
     * 修改用户
     * @param sysUser
     * @return
     */
    int updateUser(SysUser sysUser);

    /**
     * 删除用户
     * @param id
     * @return
     */
    int deleteById(Integer id);

    int resetPwd(Integer id,Integer userId);

    /**
     * 保存用户角色关系
     * @param ids
     * @param userId
     * @return
     */
    boolean saveUserRole(String ids, Integer userId);

    /**
     * 根据用户名-id查询用户信息
     * @param userName
     * @return
     */
    SysUser getUserUserNameId(String userName, Integer id);

}
