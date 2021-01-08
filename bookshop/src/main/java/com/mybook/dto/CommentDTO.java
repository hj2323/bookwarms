package com.mybook.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommentDTO {
	private int qreply_no;
	private String qreply_username;
	private String qreply_content;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	//string�삎�씠�씪怨� �븣�젮二쇨퀬
	private Date qreply_regdate;
	private int q_no;	//Qna�뀒�씠釉붽낵 �뿰愿� FK
}
