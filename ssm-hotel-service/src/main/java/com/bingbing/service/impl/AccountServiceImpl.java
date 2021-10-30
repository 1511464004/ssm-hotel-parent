package com.bingbing.service.impl;

import com.bingbing.dao.AccountMapper;
import com.bingbing.dao.AccountRoleMapper;
import com.bingbing.entity.Account;
import com.bingbing.entity.AccountRole;
import com.bingbing.service.AccountService;
import com.bingbing.utils.PasswordUtil;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {

    @Resource
    private AccountMapper accountMapper;

    @Resource
    private AccountRoleMapper accountRoleMapper;

    /**
     * 添加用户
     *
     * @param account
     * @return
     */
    public int addAccount(Account account) {
        account.setRegistTime(new Date());//注册时间
        account.setPassword(PasswordUtil.encode(account.getPassword()));//密码
        account.setStatus(1);//可用
        int count = accountMapper.addAccount(account);
        if(count > 0){
            //添加角色关系
            accountRoleMapper.insertAccountRole(account.getId());
        }
        return count;
    }

    public Account findAccountByName(String loginName) {
        return accountMapper.findAccountByName(loginName);
    }

    public Account getAccountByName(String loginName) {
        return accountMapper.getAccountByName(loginName);
    }

    /**
     * 根据用户名查询用户信息
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //创建角色列表集合
        List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
        //调用根据用户名查询用户信息的方法
        Account account = accountMapper.findAccountByName(username);
        //循环遍历角色列表
        for (AccountRole accountRole : account.getRoleList()) {
            authorities.add(new SimpleGrantedAuthority(accountRole.getRoleCode()));
        }
        //创建User对象
        User user = new User(account.getLoginName(),account.getPassword(),
                account.getStatus()==1,
                true,
                true,
                true,
                authorities);
        return user;
    }
}

