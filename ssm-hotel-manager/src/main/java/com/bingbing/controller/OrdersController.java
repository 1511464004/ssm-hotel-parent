package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.Orders;
import com.bingbing.service.OrdersService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.utils.SystemConstants;
import com.bingbing.vo.OrdersVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/orders")
public class OrdersController {

    @Resource
    private OrdersService ordersService;

    /**
     *  查询订单列表
     * @param ordersVo
     * @return
     */
    @RequestMapping("/list")
    public DataGridViewResult list(OrdersVo ordersVo){
        //设置分页信息
        PageHelper.startPage(ordersVo.getPage(),ordersVo.getLimit());
        //调用方法
        List<Orders> ordersList = ordersService.findOrdersList(ordersVo);
        //创建分页对象
        PageInfo<Orders> pageInfo = new PageInfo<Orders>(ordersList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }

    /**
     * 确认订单
     * @param orders
     * @return
     */
    @RequestMapping("/confirmOrders")
    public String confirmOrders(Orders orders){
        Map<String,Object> map = new HashMap<String,Object>();
        //订单状态
        orders.setStatus(2);//已确认
        //调用修改的方法
        if(ordersService.update(orders)>0){
            map.put(SystemConstants.SUCCESS, true);
            map.put(SystemConstants.MESSAGE,"订单确认成功");
        }else{
            map.put(SystemConstants.SUCCESS, false);
            map.put(SystemConstants.MESSAGE,"订单确认失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 批量确认
     * @param ids
     * @return
     */
    @RequestMapping("/batchConfirm")
    public String batchConfirm(String ids){
        Map<String,Object> map = new HashMap<String,Object>();
        int count = 0;
        //将字符串转换成数组
        String[] split = ids.split(",");
        for (int i = 0; i < split.length; i++) {
            Orders orders = new Orders();
            orders.setStatus(2);// 订单状态，已确认
            orders.setId(Long.valueOf(split[i]));//ID主键
            //调用修改方法
            count = ordersService.update(orders);
            if(count > 0){
                map.put(SystemConstants.SUCCESS, true);
                map.put(SystemConstants.MESSAGE,"订单确认成功");
            }
        }
        if(count <= 0){
            map.put(SystemConstants.SUCCESS, false);
            map.put(SystemConstants.MESSAGE,"订单确认失败");
        }
        return JSON.toJSONString(map);
    }


}
