package com.bingbing.service;

import com.bingbing.entity.Account;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface AccountService extends UserDetailsService {
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
    Account getAccountByName(String loginName);
}
