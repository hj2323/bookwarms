package com.mybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mybook.dto.CommentDTO;
import com.mybook.mapper.CommentMapper;
import com.mybook.mapper.QnaMapper;

@Service
public class CommentService {
	@Autowired
	private CommentMapper cmapper;
	@Autowired
	private QnaMapper qnaMapper;

	// 댓글추가 - 두개가 한단위로 묶이게 됨
	@Transactional
	
	public void insert(CommentDTO comment) {

		// 값을 두개 전달해줘야함
		// 마바티스 할때 파라마터 2개전달할수없기때문에 맵이용
		qnaMapper.updateReplyCnt(comment.getQ_no(), 1);
		cmapper.insert(comment);

	}

	
	public List<CommentDTO> getList(int q_no) {
		// TODO Auto-generated method stub
		return cmapper.getList(q_no);
	}

	// 댓글삭제 - 삭제되면 바로 갯수가 업데이트 될 수 있게 같이 묶어서 처리해줘야 함
	@Transactional
	
	public void delete(int qreply_no) {
		// 댓글 카운트 변경
		CommentDTO comment = cmapper.findbyQreply_no(qreply_no);// q_no 구하기 위해
		qnaMapper.updateReplyCnt(comment.getQ_no(), -1);
		cmapper.delete(qreply_no);// 댓글삭제
	}

	
	public CommentDTO findbyQreply_no(int qreply_no) {
		return cmapper.findbyQreply_no(qreply_no);
	}

}
