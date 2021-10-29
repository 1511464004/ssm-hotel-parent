package com.bingbing.service;

import com.bingbing.entity.Role;
import com.bingbing.vo.RoleVo;

import java.util.List;
import java.util.Map;

public interface RoleService {
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
    List<Map<String,Object>> findRoleListByMap();


    /**
     * 根据用户ID查询该用户拥有的角色列表(只查询角色ID)
     * @param userId
     * @return
     */
    List<Integer> findRoleListWithUserId(Integer userId);

    /**
     * 保存角色菜单关系
     * @param permissionIds
     * @param roleId
     * @return
     */
    boolean saveRolePermission(String permissionIds, Integer roleId);

    /**
     * 根据角色名查询角色信息
     * @param userName
     * @return
     */
    Role getRoleName(String userName);

    /**
     * 根据角色名-id查询角色信息
     * @param roleName
     * @return
     */
    Role getRoleNameId(String roleName, Integer id);
}
