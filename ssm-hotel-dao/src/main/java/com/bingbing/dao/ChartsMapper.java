package com.bingbing.dao;

import java.util.List;
import java.util.Map;

public interface ChartsMapper {

    /**
     * 查询每个年度总营业额
     * @return
     */
    List<Map> getTotalPriceByYear();


    /**
     * 统计月营业额报表
     * @param year
     * @return
     */
    List<Double> getMonthTotalPriceByYear(String year);

}
