package com.mybook.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Books {
	private int book_id;
	private String book_title;
	private String book_author;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date book_releaseDate;
	private String cateCode;
	private String book_price;
	private String book_description;
	private String book_Img;
	//book_category에 있는 컬럼
	//아우터 조인 할때 써서 추가해줌
	private String cateName;
}
