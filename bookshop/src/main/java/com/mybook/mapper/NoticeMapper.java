package com.mybook.mapper;

import java.util.List;

import com.mybook.dto.Notice;

public interface NoticeMapper {

	
	//전체보기
	public List<Notice> list();
	// 추가
	public void insert(Notice notice);

	

	// 수정
	public void update(Notice notice);

	// 삭제
	public void delete(int nno);
}
