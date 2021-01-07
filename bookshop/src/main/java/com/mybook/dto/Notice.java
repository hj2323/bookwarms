package com.mybook.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Notice {
	private int nno;
	private String n_subject;
	private String n_writer;
	private MultipartFile n_filename;
	private Date regdate;
	private int n_hit;
}
