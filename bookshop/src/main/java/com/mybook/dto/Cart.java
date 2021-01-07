package com.mybook.dto;

import lombok.Data;

@Data
public class Cart {
	private int cart_id;
	private String userid;
	private int book_id;
	private int amount;
	
}
