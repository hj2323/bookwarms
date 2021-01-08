package com.mybook.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.mybook.dto.Qna;
import com.mybook.dto.CommentDTO;

public interface CommentMapper {
	public List<CommentDTO> getList(int q_no);
	public void insert(CommentDTO comment);
	public void delete(int cnum);
	public CommentDTO countReply(int q_no);
}
