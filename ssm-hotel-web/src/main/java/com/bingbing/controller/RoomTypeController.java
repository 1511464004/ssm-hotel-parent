package com.bingbing.controller;

import com.bingbing.service.RoomTypeService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/roomType")
public class RoomTypeController {

    @Resource
    private RoomTypeService roomTypeService;

    /**
     * 查询房型列表
     * @return
     */
    @RequestMapping("/roomTypeList")
    public String roomTypeList(){
        return roomTypeService.getRoomTypeListByRedis();
    }


}
