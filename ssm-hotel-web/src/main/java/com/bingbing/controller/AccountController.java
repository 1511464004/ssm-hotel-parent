package com.bingbing.controller;

import com.bingbing.entity.Account;
import com.bingbing.service.AccountService;
import com.bingbing.utils.SystemConstants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Resource
    private AccountService accountService;

    /**
     * 注册
     * @param account
     * @return
     */
    @ResponseBody
    @RequestMapping("/register")
    public Map<String,Object> register(Account account){
        Map<String,Object> map = new HashMap<String,Object>();
        if (accountService.addAccount(account) > 0){
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"恭喜您，注册成功");
        }else{
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"很遗憾，注册失败");
        }
        return map;
    }

    /**
     * 检查用户名是否存在
     * @param loginName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkName")
    public Map<String,Object> checkName(String loginName){
        Map<String,Object> map = new HashMap<String,Object>();
        if (accountService.findAccountByName(loginName)!=null){
            map.put(SystemConstants.EXIST,true);
            map.put(SystemConstants.MESSAGE,"用户名已存在，请重新输入");
        }else{
            map.put(SystemConstants.EXIST,false);
            map.put(SystemConstants.MESSAGE,"用户名可以使用");
        }
        return map;
    }


}
