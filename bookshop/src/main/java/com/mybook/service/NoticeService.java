package com.mybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybook.dto.Notice;
import com.mybook.repository.NoticeRepository;

@Service
public class NoticeService {
	@Autowired
	private NoticeRepository noticeRepository;
	
	public List<Notice> list(){
		return noticeRepository.list();
	}
	
	//추가
	public void insert(Notice notice) {
		noticeRepository.insert(notice);
	}
	
	//수정
	public void update(Notice notice) {
		noticeRepository.update(notice);
	}
	//삭제
	public void delete(int nno) {
		noticeRepository.delete(nno);
	}
}
