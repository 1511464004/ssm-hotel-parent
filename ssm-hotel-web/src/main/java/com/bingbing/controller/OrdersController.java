package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.Account;
import com.bingbing.entity.Orders;
import com.bingbing.service.AccountService;
import com.bingbing.service.OrdersService;
import com.bingbing.utils.SystemConstants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Resource
    private OrdersService ordersService;

    @Resource
    private AccountService accountService;

    /**
     * 立即预订(下单)
     * @param orders
     * @param principal
     * @return
     */
    @ResponseBody
    @RequestMapping("/addOrder")
    public String addOrders(Orders orders, Principal principal){
        Map<String,Object> map = new HashMap<String,Object>();
        //查询用户信息
        Account account = accountService.getAccountByName(principal.getName());

        //设置预订人ID
        orders.setAccountId(account.getId());

        if(ordersService.addOrders(orders)>0){
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"预订成功");
        }else{
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"预订失败");
        }
        return JSON.toJSONString(map);
    }

}
