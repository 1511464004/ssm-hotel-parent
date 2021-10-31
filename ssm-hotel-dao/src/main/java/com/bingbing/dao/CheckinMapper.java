package com.bingbing.dao;

import com.bingbing.entity.Checkin;
import com.bingbing.vo.CheckinVo;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CheckinMapper {

    /**
     * 查询入住信息列表
     * @param checkinVo
     * @return
     */
    List<Checkin> findCheckinList(CheckinVo checkinVo);

    /**
     * 添加入住信息
     * @param checkin
     * @return
     */
    int insert(Checkin checkin);

    /**
     * 根据ID查询详情
     * @param checkInId
     * @return
     */
    @Select("select * from t_checkin where id = #{checkInId}")
    Checkin findById(Long checkInId);

    /**
     * 修改入住订单信息
     * @param checkin
     * @return
     */
    int update(Checkin checkin);
}
