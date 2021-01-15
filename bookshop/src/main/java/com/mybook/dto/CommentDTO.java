package com.mybook.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

//@Data
public class CommentDTO {
	private int qreply_no;
	private String qreply_username;
	private String qreply_content;
	//@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date qreply_regdate;
	private int q_no;	//Qna�뀒�씠釉붽낵 �뿰愿� FK
	public int getQreply_no() {
		return qreply_no;
	}
	public void setQreply_no(int qreply_no) {
		this.qreply_no = qreply_no;
	}
	public String getQreply_username() {
		return qreply_username;
	}
	public void setQreply_username(String qreply_username) {
		this.qreply_username = qreply_username;
	}
	public String getQreply_content() {
		return qreply_content;
	}
	public void setQreply_content(String qreply_content) {
		this.qreply_content = qreply_content;
	}
	public Date getQreply_regdate() {
		return qreply_regdate;
	}
	public void setQreply_regdate(Date qreply_regdate) {
		this.qreply_regdate = qreply_regdate;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	@Override
	public String toString() {
		return "CommentDTO [qreply_no=" + qreply_no + ", qreply_username=" + qreply_username + ", qreply_content="
				+ qreply_content + ", qreply_regdate=" + qreply_regdate + ", q_no=" + q_no + "]";
	}
	
	
}
