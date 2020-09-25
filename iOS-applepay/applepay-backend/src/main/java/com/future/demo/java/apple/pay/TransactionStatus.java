package com.future.demo.java.apple.pay;

/**
 * 交易状态
 */
public enum TransactionStatus {
    /**
     * 待处理
     */
    PENDING,
    /**
     * 成功
     */
    SUCCEED,
    /**
     * 失败
     */
    FAILED,
    /**
     * 超时取消
     */
    TIMEOUT
}
