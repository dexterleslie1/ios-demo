package com.future.demo.java.apple.pay;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

/**
 * @author dexterleslie@gmail.com
 */
@Data
@Entity
@Table(name="applepay_order")
public class ApplePayOrderModel implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -455392667421971562L;

	@Id
	private long id;
	private String orderId;
//	private String productId;
	@Enumerated(EnumType.STRING)
	private TransactionStatus status;
	private Date createTime;
}
