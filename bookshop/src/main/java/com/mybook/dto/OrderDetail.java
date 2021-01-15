package com.mybook.dto;

import lombok.Data;

@Data
public class OrderDetail {
	private int order_detail_no;
	private String order_id;
	private int book_id;
	private int amount;
}
