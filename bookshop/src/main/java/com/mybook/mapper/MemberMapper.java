package com.mybook.mapper;

import java.util.HashMap;
import java.util.List;

import com.mybook.dto.AuthDTO;
import com.mybook.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO read(String userid);
	// member join
	 public void memberJoin(MemberDTO member);
	//auth join
	 public void authJoin(AuthDTO  auth);
	 
	 //회원리스트
	 public List<MemberDTO> findAll(HashMap<String, Object> hm);
	 //회원정보수정
	 public void update(MemberDTO member);
	 //회원정보
	 public MemberDTO findById(String userid);
	 public void memberDelete(String userid);
	 public void authDelete(String userid);
	// 로그인체크
	public MemberDTO loginCheck(String userid);
	//회원수카운트
	public int getCount(HashMap<String, Object> hm);
	
}
