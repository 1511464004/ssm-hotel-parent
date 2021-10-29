package com.bingbing.vo;

import com.bingbing.entity.Floor;
import lombok.Data;

@Data
public class FloorVo extends Floor {

    private Integer page;//当前页码
    private Integer limit;//每页显示数量

}
