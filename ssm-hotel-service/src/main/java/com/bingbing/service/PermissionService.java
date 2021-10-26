package com.bingbing.service;

import com.bingbing.entity.Permission;
import com.bingbing.vo.PermissionVo;

import java.util.List;

public interface PermissionService {

    /**
     * 查询菜单列表
     * @param permissionVo
     * @return
     */
    List<Permission> findPermissionList(PermissionVo permissionVo);

    /**
     * 添加菜单
     * @param record
     * @return
     */
    int insert(Permission record);

    /**
     * 修改菜单
     * @param record
     * @return
     */
    int update(Permission record);

    /**
     * 检查菜单下是否有子菜单
     * @param id
     * @return
     */
    int getPermissionCountById(Integer id);

    /**
     * 删除菜单
     * @param id
     * @return
     */
    int deleteById(Integer id);

    /**
     * 根据角色ID查询该角色拥有的权限菜单ID集合
     * @param roleId
     * @return
     */
    List<Integer> findPermissionByRoleId(Integer roleId);


    /**
     * 根据菜单编号菜单详细信息
     * @param currentRolePermissions
     * @return
     */
    List<Permission> findPermissionById(List<Integer> currentRolePermissions);

    /**
     * 根据当前登录用户查询菜单列表
     * @param userId
     * @return
     */
    List<Permission> findPermissionListByUserId(Integer userId, String type);
}
