package com.bingbing.service.impl;

import com.bingbing.dao.PermissionMapper;
import com.bingbing.entity.Permission;
import com.bingbing.service.PermissionService;
import com.bingbing.vo.PermissionVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class PermissionServiceImpl implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    /**
     * 查询菜单列表
     *
     * @param permissionVo
     * @return
     */
    public List<Permission> findPermissionList(PermissionVo permissionVo) {
        return permissionMapper.findPermissionList(permissionVo);
    }

    public int insert(Permission permission) {
        //判断是否选中一级菜单
        if(permission.getPid()==null){
            permission.setPid(0);//0表示一级菜单
        }
        //打开方式
        permission.setTarget("_self");
        return permissionMapper.insert(permission);
    }

    public int update(Permission record) {
        return permissionMapper.update(record);
    }

    public int getPermissionCountById(Integer id) {
        return permissionMapper.getPermissionCountById(id);
    }

    public int deleteById(Integer id) {
        return permissionMapper.deleteById(id);
    }

    public List<Integer> findPermissionByRoleId(Integer roleId) {
        return permissionMapper.findPermissionByRoleId(roleId);
    }

    public List<Permission> findPermissionById(List<Integer> currentRolePermissions) {
        return permissionMapper.findPermissionById(currentRolePermissions);
    }

    public List<Permission> findPermissionListByUserId(Integer userId, String type) {
        return permissionMapper.findPermissionListByUserId(userId,type);
    }
}
