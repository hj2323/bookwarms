package com.mybook.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommentDTO {
	private int qreply_no;
	private String username;
	private String qreply_content;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	//string형이라고 알려주고
	private Date qreply_regdate;
	private int q_no;	//Qna테이블과 연관 FK
}
