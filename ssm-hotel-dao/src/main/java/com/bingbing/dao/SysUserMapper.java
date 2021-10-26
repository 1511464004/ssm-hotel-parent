package com.bingbing.dao;

import com.bingbing.entity.SysUser;
import com.bingbing.vo.UserVo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

//import com.bingbing.vo.UserVo;

public interface SysUserMapper {

    /**
     * 根据用户名查询用户信息
     * @param userName
     * @return
     */
    SysUser findUserByUserName(String userName);

    /**
     * 根据部门编号查询该部门下的员工信息
     * @param deptId
     * @return
     */
    @Select("select count(1) from sys_user where deptId = #{deptId}")
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

    /**
     * 添加用户
     * @param sysUser
     * @return
     */
    int insert(SysUser sysUser);
    /**
     * 修改用户
     * @param sysUser
     * @return
     */
    int updateUser(SysUser sysUser);

    /**
     * 删除用户角色关系表数据
     * @param id
     */
    @Delete("delete from sys_user_role where uid = #{id}")
    void deleteUserRoleByUserId(Integer id);

    /**
     * 删除用户
     * @param id
     * @return
     */
    @Delete("delete from sys_user where id = #{id}")
    int deleteById(Integer id);

    /**
     * 保存用户角色关系
     * @param roleId
     * @param userId
     */
    @Insert("insert into sys_user_role (uid,rid) values(#{userId},#{roleId})")
    void saveUserRole(@Param("roleId") Integer roleId, @Param("userId") Integer userId);

    /**
     * 根据用户名查询用户信息
     * @param userName
     * @return
     */
    @Select("select * from sys_user where userName = #{userName}")
    SysUser getUserByUserName(String userName);
}
