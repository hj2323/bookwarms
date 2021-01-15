package com.mybook.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mybook.dto.Books;
import com.mybook.dto.Notice;
import com.mybook.repository.NoticeRepository;

@Service
public class NoticeService {
	@Autowired
	private NoticeRepository noticeRepository;
	
	public List<Notice> list(){
		return noticeRepository.list();
	}
	
	public List<Notice> listIndex(){
		return noticeRepository.listIndex();
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
	
	//카운트
	public int getCount(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return noticeRepository.getCount(hm);
	}
	
	//상품전체보기(페이징 추가)
		public List<Notice> findAllwithPage(HashMap<String, Object> hm) {
			// TODO Auto-generated method stub
			return noticeRepository.findAllwithPage(hm);
		}
		
		//findById
		@Transactional
		public Notice findById(int nno) {
			noticeRepository.hitcountUpdate(nno);
			return noticeRepository.findById(nno);
		}
}
