package com.mybook.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	

	// 수정
	public void update(Notice notice) {
		noticeMapper.update(notice);
	}

	// 삭제
	public void delete(int nno) {
		noticeMapper.delete(nno);
	}
}
