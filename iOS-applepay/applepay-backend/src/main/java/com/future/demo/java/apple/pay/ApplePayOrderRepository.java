package com.future.demo.java.apple.pay;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author dexterleslie@gmail.com
 */
public interface ApplePayOrderRepository extends JpaRepository<ApplePayOrderModel, Long> {
    /**
     *
     * @param orderId
     * @return
     */
    ApplePayOrderModel findByOrderId(String orderId);
}
