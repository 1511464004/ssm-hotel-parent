package com.bingbing.dao;

import com.bingbing.entity.RoomType;
import com.bingbing.vo.RoomTypeVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoomTypeMapper {

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
     * 根据ID查询
     * @param roomTypeId
     * @return
     */
    @Select("select * from t_room_type where id = #{id}")
    RoomType findById(Integer roomTypeId);

    /**
     * 根据房型名称查询房型
     * @param roomTypeName
     * @return
     */
    @Select("select * from t_room_type where typeName = #{roomTypeName}")
    RoomType getRoomTypeName(String roomTypeName);

    /**
     * 根据房型名称-id查询房型
     * @param roomTypeName
     * @param id
     * @return
     */
    @Select("select * from t_room_type where typeName = #{roomTypeName} and id != #{id}")
    RoomType getRoomTypeNameId(@Param("roomTypeName") String roomTypeName,@Param("id") Integer id);
}
