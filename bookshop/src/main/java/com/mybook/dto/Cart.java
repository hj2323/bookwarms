package com.mybook.dto;

import lombok.Data;

@Data
public class Cart {
	private int cart_id;
	private String userid;
	private int book_id;
	private int amount;
	
	
	//books랑 조인해서 만들어주는 변수들
	private String book_title;
	private String book_author;
	private int book_price;
	private String thumbImg;
	
	
}
