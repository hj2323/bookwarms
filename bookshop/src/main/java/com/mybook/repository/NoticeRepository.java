package com.mybook.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybook.dto.Books;
import com.mybook.dto.Notice;
import com.mybook.mapper.NoticeMapper;

@Repository
public class NoticeRepository {
	@Autowired
	private NoticeMapper noticeMapper;
	
	public List<Notice> list(){
		return noticeMapper.list();
	}
	// 추가
	public void insert(Notice notice) {
		noticeMapper.insert(notice);
	}

	public List<Notice> listIndex(){
		return noticeMapper.listIndex();
	}

	// 수정
	public void update(Notice notice) {
		noticeMapper.update(notice);
	}

	// 삭제
	public void delete(int nno) {
		noticeMapper.delete(nno);
	}
	
	// 상품전체보기(페이징추가)
	public List<Notice> findAllwithPage(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return noticeMapper.findAllwithPage(hm);
	}
	//카운트
	public int getCount(HashMap<String, Object> hm) {
		return noticeMapper.getCount(hm);
	}
	public Notice findById(int nno) {
		return noticeMapper.findById(nno);
	}
	public void hitcountUpdate(int nno) {
		noticeMapper.hitcountUpdate(nno);
		
	}
}
