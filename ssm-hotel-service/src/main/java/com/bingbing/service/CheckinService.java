package com.bingbing.service;

import com.bingbing.entity.Checkin;
import com.bingbing.vo.CheckinVo;

import java.util.List;

public interface CheckinService {
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
}
