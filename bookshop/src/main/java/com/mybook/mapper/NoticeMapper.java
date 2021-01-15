package com.mybook.mapper;

import java.util.HashMap;
import java.util.List;

import com.mybook.dto.Books;
import com.mybook.dto.Notice;

public interface NoticeMapper {

	
	//전체보기
	public List<Notice> list();
	// 추가
	public void insert(Notice notice);

	//전체보기(index)
	public List<Notice> listIndex();

	// 수정
	public void update(Notice notice);

	// 삭제
	public void delete(int nno);
	
	public int getCount(HashMap<String, Object> hm);
	
	//전체보기(페이징)
	public List<Notice> findAllwithPage(HashMap<String, Object> hm);
	
	//findById
	public Notice findById(int nno);
	//조회수 증가
	public void hitcountUpdate(int nno);
}
