package com.bingbing.dao;

import com.bingbing.entity.Checkout;

public interface CheckoutMapper {
    /**
     * 添加退房记录
     * @param checkout
     * @return
     */
    int addCheckout(Checkout checkout);
}
