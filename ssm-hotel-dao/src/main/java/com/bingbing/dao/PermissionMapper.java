package com.bingbing.dao;

import com.bingbing.entity.Permission;
import com.bingbing.vo.PermissionVo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PermissionMapper {

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
    @Select("select count(1) from sys_permission where pid = #{id}")
    int getPermissionCountById(Integer id);

    /**
     * 根据菜单查询菜单信息
     * @param title
     * @return
     */
    @Select("select * from sys_permission where title = #{title}")
    Permission getTitle(String title);

    /**
     * 根据菜单-id查询菜单信息
     * @param title
     * @return
     */
    @Select("select * from sys_permission where title = #{title} and id != #{id}")
    Permission getTitleId(@Param("title") String title,@Param("id") Integer id);


    /**
     * 删除菜单
     * @param id
     * @return
     */
    @Delete("delete from sys_permission where id = #{id}")
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
    List<Permission> findPermissionListByUserId(@Param("userId") Integer userId,@Param("type") String type);
}
