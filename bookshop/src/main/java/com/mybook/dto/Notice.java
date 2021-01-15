package com.mybook.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Notice {
	private int nno;
	private String n_subject;
	private String n_content;
	private MultipartFile n_filename;
	private Date n_regdate;
	private int n_hit;
	
}
