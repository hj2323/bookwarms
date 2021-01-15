package com.mybook.dto;

import java.util.Date;

import lombok.Data;
@Data
public class Order {
	private String order_id;
	private String userid;
	private String order_rec;
	private int address1;
	private String address2;
	private String order_phone;
	private int amount;
	private int order_price;
	private String order_payment;
	private Date order_regdate;
	private String order_ask;
	
	
	private String book_title;
	private String thumbImg;
}
