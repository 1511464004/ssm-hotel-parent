package com.bingbing.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Checkout {
    private Long id;
    private String checkOutNumber;
    private Long checkInId;
    private Double consumePrice;
    private Date createDate;
    private Integer createdBy;
    private String remark;
}
