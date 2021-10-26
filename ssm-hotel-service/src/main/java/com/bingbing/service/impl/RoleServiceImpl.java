package com.bingbing.service.impl;

import com.bingbing.dao.RoleMapper;
import com.bingbing.entity.Role;
import com.bingbing.service.RoleService;
import com.bingbing.vo.RoleVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    /**
     * 查询角色列表
     *
     * @param roleVo
     * @return
     */
    public List<Role> findRoleList(RoleVo roleVo) {
        return roleMapper.findRoleList(roleVo);
    }

    public int insert(Role record) {
        return roleMapper.insert(record);
    }

    public int updateRole(Role role) {
        return roleMapper.updateRole(role);
    }

    public int deleteById(Integer id) {
        return roleMapper.deleteById(id);
    }

    /**
     * 查询所有角色
     *
     * @return
     */
    public List<Map<String, Object>> findRoleListByMap() {
        return roleMapper.findRoleListByMap();
    }

    /**
     * 根据用户ID查询该用户拥有的角色列表(只查询角色ID)
     *
     * @param userId
     * @return
     */
    public List<Integer> findRoleListWithUserId(Integer userId) {
        return roleMapper.findRoleListWithUserId(userId);
    }

    public boolean saveRolePermission(String permissionIds, Integer roleId) {
        try {
            //删除原有的角色菜单关系
            roleMapper.deleteRolePermissionByRoleId(roleId);
            //将权限菜单字符串拆分成数组
            String[] ids = permissionIds.split(",");
            int count = 0;
            //循环添加角色菜单关系
            for (int i = 0; i < ids.length; i++) {
               count =  roleMapper.saveRolePermission(Integer.valueOf(ids[i]),roleId);
            }
            return true;
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        return false;
    }
}
