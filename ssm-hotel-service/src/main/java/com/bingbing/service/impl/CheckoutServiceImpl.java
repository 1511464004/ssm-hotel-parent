package com.bingbing.service.impl;

import com.bingbing.dao.*;
import com.bingbing.entity.*;
import com.bingbing.service.CheckoutService;
import com.bingbing.utils.UUIDUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;

@Service
@Transactional
public class CheckoutServiceImpl implements CheckoutService {

    @Resource
    private CheckoutMapper checkoutMapper;

    @Resource
    private CheckinMapper checkinMapper;

    @Resource
    private RoomTypeMapper roomTypeMapper;

    @Resource
    private RoomMapper roomMapper;

    @Resource
    private OrdersMapper ordersMapper;


    public int addCheckout(Checkout checkout) {
        checkout.setCheckOutNumber(UUIDUtils.randomUUID());//退房单号
        checkout.setCreateDate(new Date());//创建时间
        //1.向退房表(t_checkout)添加一条数据
        int count = checkoutMapper.addCheckout(checkout);
        if(count>0){
            //2.修改入住登记表(t_checkin)中的状态（status由1改成2已离店）
            Checkin checkin = checkinMapper.findById(checkout.getCheckInId());
            checkin.setStatus(2);//已离店
            //调用修改入住的方法
            checkinMapper.update(checkin);

            //3.修改房型表(t_room_type)中的可用房间数+1
            RoomType roomType = roomTypeMapper.findById(checkin.getRoomTypeId());
            roomType.setAvilableNum(roomType.getAvilableNum()+1);
            roomTypeMapper.updateRoomType(roomType);

            //4.修改房间表的状态(status由3改成1)
            Room room = new Room();
            room.setId(checkin.getRoomId().intValue());
            room.setStatus(1);
            roomMapper.updateRoom(room);

            //修改预订表状态(t_orders)的状态【由3改成4】
            Orders orders = new Orders();
            orders.setId(checkin.getOrdersId());
            orders.setStatus(4);
            ordersMapper.update(orders);

        }


        return count;
    }
}
