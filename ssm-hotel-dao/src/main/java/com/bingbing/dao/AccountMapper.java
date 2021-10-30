package com.bingbing.dao;

import com.bingbing.entity.Account;
import org.apache.ibatis.annotations.Select;

public interface AccountMapper {

    /**
     * 添加用户
     * @param account
     * @return
     */
    int addAccount(Account account);

    /**
     * 根据用户名查询用户信息
     * @param loginName
     * @return
     */
    Account findAccountByName(String loginName);

    /**
     * 根据用户名查询用户信息
     * @param loginName
     * @return
     */
    @Select("select * from t_account where loginName = #{loginName}")
    Account getAccountByName(String loginName);
}
