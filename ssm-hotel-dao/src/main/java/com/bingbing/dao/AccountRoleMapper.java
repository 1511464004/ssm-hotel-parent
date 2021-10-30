package com.bingbing.dao;

import com.bingbing.entity.AccountRole;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AccountRoleMapper {

    /**
     * 根据用户ID查询该用户的角色列表
     * @param accountId
     * @return
     */
    @Select("select * from t_role where id in(select roleId from t_account_role where accountId=#{accountId})")
    List<AccountRole> findRoleListByAccountId(Integer accountId);

    /**
     * 添加角色关系
     * @param accountId
     */
    @Insert("insert into t_account_role (accountId,roleId) values(#{accountId},1)")
    void insertAccountRole(Long accountId);
}
