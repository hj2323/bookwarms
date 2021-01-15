package com.mybook.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybook.dto.MemberDTO;
import com.mybook.dto.Qna;
import com.mybook.mapper.QnaMapper;

@Repository
public class QnaRepository {
	@Autowired
	private QnaMapper qnaMapper;

	public void insert(Qna qna) {
		qnaMapper.insert(qna);
		
	}

	public int getCount(HashMap<String, Object> hm) {
		return qnaMapper.getCount(hm);
	}

	public List<MemberDTO> findAll(HashMap<String, Object> hm) {
		return qnaMapper.findAll(hm);
	}

	public Qna findByQno(int q_no) {
		return qnaMapper.findByQno(q_no);
	}

	public void update(Qna qna) {
		qnaMapper.update(qna);
		
	}

	public void delete(int q_no) {
		qnaMapper.delete(q_no);
		
	}

	public List<MemberDTO> myqna(HashMap<String, Object> hm) {
		return qnaMapper.myqna(hm);
	}

	public int mypageGetCount(HashMap<String, Object> hm) {
		return qnaMapper.mypageGetCount(hm);
	}
	
}
