package com.mybook.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybook.dto.MemberDTO;
import com.mybook.dto.Qna;
import com.mybook.repository.QnaRepository;

@Service
public class QnaService {
	@Autowired
	private QnaRepository qnaRepository;
	public void insert(Qna qna) {
		qnaRepository.insert(qna);
		
	}
	public int getCount(HashMap<String, Object> hm) {
		return qnaRepository.getCount(hm);
	}
	public List<MemberDTO> findAll(HashMap<String, Object> hm) {
		return qnaRepository.findAll(hm);
	}
	public Qna findByQno(int q_no) {
		return qnaRepository.findByQno(q_no);
	}
	public void update(Qna qna) {
		qnaRepository.update(qna);
		
	}
	public void delete(int q_no) {
		qnaRepository.delete(q_no);
		
	}
	public List<MemberDTO> myqna(HashMap<String, Object> hm) {
		return qnaRepository.myqna(hm);
	}
	public int mypageGetCount(HashMap<String, Object> hm) {
		return qnaRepository.mypageGetCount(hm);
	}

}
