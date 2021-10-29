package com.bingbing.service;

import com.bingbing.entity.Floor;
import com.bingbing.vo.FloorVo;

import java.util.List;

public interface FloorService {

    /**
     * 查询楼层列表
     * @param floorVo
     * @return
     */
    List<Floor> findFloorList(FloorVo floorVo);

    /**
     * 添加楼层
     * @param floor
     * @return
     */
    int insert(Floor floor);

    /**
     * 修改楼层
     * @param floor
     * @return
     */
    int updateFloor(Floor floor);

    /**
     * 加载楼层列表
     * @return
     */
    String getFloorListByRedis();

    /**
     * 根据楼层名查询楼层信息
     * @param floorName
     * @return
     */
    Floor getFloorByFloorName(String floorName);

    /**
     * 根据楼层名-id查询楼层信息
     * @param floorName
     * @return
     */
    Floor getFloorFloorNameId(String floorName, Integer id);

}
