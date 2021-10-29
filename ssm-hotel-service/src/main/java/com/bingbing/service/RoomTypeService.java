package com.bingbing.service;

import com.bingbing.entity.RoomType;
import com.bingbing.vo.RoomTypeVo;

import java.util.List;

public interface RoomTypeService {
    /**
     * 查询房型列表
     * @param roomTypeVo
     * @return
     */
    List<RoomType> findRoomTypeList(RoomTypeVo roomTypeVo);

    /**
     * 添加房型
     * @param record
     * @return
     */
    int insert(RoomType record);

    /**
     * 修改房型
     * @param roomType
     * @return
     */
    int updateRoomType(RoomType roomType);

    /**
     * 根据房型ID查询该房型下的房间数量
     * @param roomTypeId
     * @return
     */
    int getRoomCountByRoomTypeId(Integer roomTypeId);

    /**
     * 删除房型
     * @param id
     * @return
     */
    int deleteById(Integer id);

    /**
     * 查询房型列表
     * @return
     */
    String getRoomTypeListByRedis();

    /**
     * 根据房型名称查询房型
     * @param roomTypeName
     * @return
     */
    RoomType getRoomTypeName(String roomTypeName);

    /**
     * 根据房型名称-id查询房型
     * @param roomTypeName
     * @return
     */
    RoomType getRoomTypeNameId(String roomTypeName,Integer id);

}
