package com.bingbing.dao;

import com.bingbing.entity.Floor;
import com.bingbing.vo.FloorVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FloorMapper {

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
     * 根据楼层名查询楼层信息
     * @param floorName
     * @return
     */
    @Select("select * from t_floor where floorName = #{floorName}")
    Floor getFloorByFloorName(String floorName);

    /**
     * 根据楼层名-id查询楼层信息
     * @param floorName
     * @return
     */
    @Select("select * from t_floor where floorName = #{floorName} and id != #{id}")
    Floor getFloorFloorNameId(@Param("floorName")String floorName,@Param("id") Integer id);

}
