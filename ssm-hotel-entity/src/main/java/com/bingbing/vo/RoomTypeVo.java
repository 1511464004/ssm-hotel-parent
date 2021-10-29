package com.bingbing.vo;

import com.bingbing.entity.RoomType;
import lombok.Data;

@Data
public class RoomTypeVo extends RoomType {

    private Integer page;//当前页码
    private Integer limit;//每页显示数量

}
