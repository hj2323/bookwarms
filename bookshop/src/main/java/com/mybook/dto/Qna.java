package com.mybook.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Qna {
	private int q_no;
	private String q_subject;
	private String q_content;
	private String q_writer;
	private Date q_regdate;
	private String  q_ip;
	private int q_re_ref;
	private int q_re_lev;
	private int q_re_seq;
	private int replyCnt;
	
}
