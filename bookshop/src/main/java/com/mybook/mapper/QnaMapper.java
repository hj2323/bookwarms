package com.mybook.mapper;

import java.util.HashMap;
import java.util.List;

import com.mybook.dto.MemberDTO;
import com.mybook.dto.Qna;

public interface QnaMapper {
	//qna 글쓰기
	public void insert(Qna qna);
	//qna글수 카운트
	public int getCount(HashMap<String, Object> hm);
	//qna 전체보기
	public List<MemberDTO> findAll(HashMap<String, Object> hm);
	//qna 상세보기
	public Qna findByQno(int q_no);
	//수정하기
	public void update(Qna qna);

}
