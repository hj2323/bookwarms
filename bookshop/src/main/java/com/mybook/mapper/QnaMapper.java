package com.mybook.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mybook.dto.MemberDTO;
import com.mybook.dto.Qna;

public interface QnaMapper {
	//qna �۾���
	public void insert(Qna qna);
	//qna�ۼ� ī��Ʈ
	public int getCount(HashMap<String, Object> hm);
	//qna ��ü����
	public List<MemberDTO> findAll(HashMap<String, Object> hm);
	//qna �󼼺���
	public Qna findByQno(int q_no);
	//�����ϱ�
	public void update(Qna qna);
	public void delete(int q_no);
	//replyCnt개수 증가
	public void updateReplyCnt(@Param("q_no")int q_no, @Param("amount") int amount);
	
}
