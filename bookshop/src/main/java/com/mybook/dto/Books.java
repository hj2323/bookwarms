package com.mybook.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Books {
	private int book_id;
	private String book_title;
	private String book_author;
	private Date book_releaseDate;
	private String cateCode;
	private String book_price;
	private String book_description;
	private String book_Img;
}
