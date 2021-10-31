package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.service.ChartsService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/charts")
public class ChartsController {

    @Resource
    private ChartsService chartsService;

    @RequestMapping("/getYearTotalPrice")
    public String getYearTotalPrice(){
        Map<String,Object> map = new HashMap<String,Object>();
        //调用统计每年总营业额的方法
        List<Map> mapList = chartsService.getTotalPriceByYear();
        //创建两个List集合，分别保存年份及对应的营业额
        List<String> keyList = new ArrayList<String>();//年份
        List<Double> valueList = new ArrayList<Double>();//营业额
        //循环遍历mapList集合
        for (Map m : mapList) {
            keyList.add(m.get("year").toString());//年份
            valueList.add(Double.valueOf(m.get("money").toString()));
        }
        map.put("keyList",keyList);
        map.put("valueList",valueList);

        return JSON.toJSONString(map);
    }


    /**
     * 月营业报表
     * @param year
     * @return
     */
    @RequestMapping("/getMonthTotalPrice")
    public String getMonthTotalPrice(String year){
        //调用统计月营业额报表的方法
        List<Double> list = chartsService.getMonthTotalPriceByYear(year);
        //循环判断月份中的数据是否为null
        for (int i = 0; i < list.size(); i++) {
            //如果数据为null，则将null用0代替
            if(list.get(i) == null){
                list.set(i,0D);
            }
        }
        return JSON.toJSONString(list);
    }

}
