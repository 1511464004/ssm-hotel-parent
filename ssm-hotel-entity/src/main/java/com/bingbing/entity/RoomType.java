package com.bingbing.entity;

import lombok.Data;

@Data
public class RoomType {
    private Integer id;
    private String typeName;
    private String photo;
    private Double price;
    private Integer liveNum;
    private Integer bedNum;
    private Integer roomNum;
    private Integer reservedNum;
    private Integer avilableNum;
    private Integer livedNum;
    private Integer status;
    private String remark;
}
