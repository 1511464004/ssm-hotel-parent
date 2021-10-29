package com.bingbing.service;

import com.bingbing.entity.Room;
import com.bingbing.vo.RoomVo;

import java.util.List;

public interface RoomService {
    /**
     * 查询房间列表
     * @param roomVo
     * @return
     */
    List<Room> findRoomList(RoomVo roomVo);

    /**
     * 添加房间
     * @param room
     * @return
     */
    int addRoom(Room room);

    /**
     * 修改房间
     * @param room
     * @return
     */
    int updateRoom(Room room);

    /**
     * 删除房间
     * @param id
     * @return
     */
    int deleteById(Integer id);

    /**
     * 查询房型信息
     * @param id
     * @return
     */
    Room findById(Integer id);
}
