package com.bingbing.service.impl;

import com.alibaba.fastjson.JSON;
import com.bingbing.dao.RoomTypeMapper;
import com.bingbing.entity.RoomType;
import com.bingbing.service.RoomTypeService;
import com.bingbing.utils.JedisPoolUtils;
import com.bingbing.utils.RedisKey;
import com.bingbing.vo.RoomTypeVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class RoomTypeServiceImpl implements RoomTypeService {

    @Resource
    private RoomTypeMapper roomTypeMapper;

    /**
     * 查询房型列表
     *
     * @param roomTypeVo
     * @return
     */
    public List<RoomType> findRoomTypeList(RoomTypeVo roomTypeVo) {
        return roomTypeMapper.findRoomTypeList(roomTypeVo);
    }

    public int insert(RoomType roomType) {
        //清空缓存
        JedisPoolUtils.getJedis().del(RedisKey.ROOM_TYPE_LIST);
        //设置已预订数量
        roomType.setReservedNum(0);
        //设置可入住房间数量
        roomType.setAvilableNum(roomType.getRoomNum());
        //设置已入住房间数量
        roomType.setLivedNum(0);
        return roomTypeMapper.insert(roomType);
    }

    public int updateRoomType(RoomType roomType) {
        //清空缓存
        JedisPoolUtils.getJedis().del(RedisKey.ROOM_TYPE_LIST);
        //修改可用房间数
        roomType.setAvilableNum(roomType.getRoomNum());
        return roomTypeMapper.updateRoomType(roomType);
    }

    public int getRoomCountByRoomTypeId(Integer roomTypeId) {
        return roomTypeMapper.getRoomCountByRoomTypeId(roomTypeId);
    }

    public int deleteById(Integer id) {
        //清空缓存
        JedisPoolUtils.getJedis().del(RedisKey.ROOM_TYPE_LIST);
        return roomTypeMapper.deleteById(id);
    }

    public String getRoomTypeListByRedis() {
        Jedis jedis = JedisPoolUtils.getJedis();
        //读取缓存数据
        String room_type_list = jedis.get(RedisKey.ROOM_TYPE_LIST);
        //判断
        if(StringUtils.isEmpty(room_type_list)){
            //从数据库中读取数据
            List<RoomType> roomTypeList = roomTypeMapper.findRoomTypeList(null);
            //转换成JSON并保存到缓存中
            room_type_list = jedis.set(RedisKey.ROOM_TYPE_LIST, JSON.toJSONString(roomTypeList));
        }
        return room_type_list;
    }

    @Override
    public RoomType getRoomTypeName(String roomTypeName) {
        return roomTypeMapper.getRoomTypeName(roomTypeName);
    }

    @Override
    public RoomType getRoomTypeNameId(String roomTypeName, Integer id) {
        return roomTypeMapper.getRoomTypeNameId(roomTypeName,id);
    }
}
