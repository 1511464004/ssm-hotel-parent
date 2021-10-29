package com.bingbing.entity;

import lombok.Data;

@Data
public class Room {
    private Integer id;
    private String title;
    private String photo;
    private String roomNum;
    private Integer roomTypeId;
    private Integer floorId;
    private Integer status;//状态(1-可预订 2-已预订 3-已入住)
    private String roomRequirement;
    private String remark;
    private String roomDesc;

    //房型对象
    private RoomType roomType;
    //楼层对象
    private Floor floor;

}
