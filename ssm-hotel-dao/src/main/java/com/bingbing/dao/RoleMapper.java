package com.bingbing.dao;

import com.bingbing.entity.Role;
import com.bingbing.vo.RoleVo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

//import com.bingbing.vo.RoleVo;

public interface RoleMapper {

    /**
     * 根据用户ID查询角色列表
     * @param userId
     * @return
     */
    List<Role> findRoleListByUserId(Integer userId);

    /**
     * 查询角色列表
     * @param roleVo
     * @return
     */
    List<Role> findRoleList(RoleVo roleVo);

    /**
     * 添加角色
     * @param record
     * @return
     */
    int insert(Role record);

    /**
     * 修改角色
     * @param role
     * @return
     */
    int updateRole(Role role);

    /**
     * 删除角色
     * @param id
     * @return
     */
    int deleteById(Integer id);

    /**
     * 查询所有角色
     * @return
     */
    @Select("select * from sys_role")
    List<Map<String,Object>> findRoleListByMap();


    /**
     * 根据用户ID查询该用户拥有的角色列表(只查询角色ID)
     * @param userId
     * @return
     */
    @Select("select rid from sys_user_role where uid = #{userId}")
    List<Integer> findRoleListWithUserId(Integer userId);

    /**
     * 删除角色菜单关系
     * @param roleId
     */
    @Delete("delete from sys_role_permission where rid = #{roleId}")
    void deleteRolePermissionByRoleId(Integer roleId);

    /**
     * 保存角色菜单关系
     * @param permissionId
     * @param roleId
     * @return
     */
    @Insert("insert into sys_role_permission(rid,pid) values(#{roleId},#{pid})")
    int saveRolePermission(@Param("pid") Integer permissionId, @Param("roleId") Integer roleId);


}
