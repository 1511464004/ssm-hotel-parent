package com.bingbing.service.impl;

import com.bingbing.dao.OrdersMapper;
import com.bingbing.dao.RoomMapper;
import com.bingbing.dao.RoomTypeMapper;
import com.bingbing.entity.Orders;
import com.bingbing.entity.Room;
import com.bingbing.entity.RoomType;
import com.bingbing.service.OrdersService;
import com.bingbing.utils.UUIDUtils;
import com.bingbing.vo.OrdersVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {

    @Resource
    private OrdersMapper ordersMapper;

    @Resource
    private RoomMapper roomMapper;

    @Resource
    private RoomTypeMapper roomTypeMapper;


    public int addOrders(Orders orders) {
        orders.setOrdersNo(UUIDUtils.randomUUID());//订单号
        orders.setReserveDate(new Date());//创建时间(下单时间)
        orders.setStatus(1);//订单状态为待确认
        //1.添加订单信息
        int count = ordersMapper.addOrders(orders);
        if(count>0){
            //2.修改房间信息(状态为已预订2)
            Room room =roomMapper.getRoomById(orders.getRoomId());//查询
            room.setStatus(2);//修改状态为已预订
            roomMapper.updateRoom(room);//调用修改房间信息的方法
            //3.修改房型信息(可用房间数-1，已预订房间数+1)
            RoomType roomType = roomTypeMapper.findById(orders.getRoomTypeId());
            roomType.setAvilableNum(roomType.getAvilableNum()-1);//可用房间数减1
            roomType.setReservedNum(roomType.getReservedNum()+1);
            roomTypeMapper.updateRoomType(roomType);//调用修改房型的方法
        }
        return count;
    }

    public List<Orders> findOrdersList(OrdersVo ordersVo) {
        return ordersMapper.findOrdersList(ordersVo);
    }

    public int update(Orders orders) {
        return ordersMapper.update(orders);
    }
}
