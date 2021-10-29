package com.bingbing.vo;

import com.bingbing.entity.Room;
import lombok.Data;

@Data
public class RoomVo extends Room {

    private Integer page;//当前页码
    private Integer limit;//每页显示数量

}
