package com.mybook.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybook.mapper.CommentMapper;
import com.mybook.mapper.QnaMapper;

@Service
public class CommentService {
	@Autowired
	private CommentMapper cmapper;
	@Autowired
	private QnaMapper qnaMapper; 
}
