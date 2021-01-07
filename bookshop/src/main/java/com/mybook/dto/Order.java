package com.mybook.dto;

import java.util.Date;

import lombok.Data;
@Data
public class Order {
	private int order_id;
	private String userid;
	private String order_rec;
	private int address1;
	private String address2;
	private String order_phone;
	private int amount;
	private int order_price;
	private String order_paymethod;
	private Date order_regdate;
	
}
