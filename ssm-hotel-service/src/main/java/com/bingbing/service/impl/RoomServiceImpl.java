package com.bingbing.service.impl;

import com.bingbing.dao.RoomMapper;
import com.bingbing.entity.Room;
import com.bingbing.entity.RoomType;
import com.bingbing.service.RoomService;
import com.bingbing.vo.RoomVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
@Service
public class RoomServiceImpl implements RoomService {

    @Resource
    private RoomMapper roomMapper;

    /**
     * 查询房间列表
     *
     * @param roomVo
     * @return
     */
    public List<Room> findRoomList(RoomVo roomVo) {
        return roomMapper.findRoomList(roomVo);
    }

    public int addRoom(Room room) {
        return roomMapper.addRoom(room);
    }

    public int updateRoom(Room room) {
        return roomMapper.updateRoom(room);
    }

    public int deleteById(Integer id) {
        return roomMapper.deleteById(id);
    }

    public Room findById(Integer id) {
        return roomMapper.findById(id);
    }

    @Override
    public RoomType getRoomTitle(String roomNum) {
        return roomMapper.getRoomTitle(roomNum);
    }

    @Override
    public RoomType getRoomTitleId(String roomNum, Integer id) {
        return roomMapper.getRoomTitleId(roomNum,id);
    }
}
