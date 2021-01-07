package com.mybook.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybook.dto.AuthDTO;
import com.mybook.dto.MemberDTO;
import com.mybook.mapper.MemberMapper;

@Repository
public class MemberRepository {
	@Autowired
	private MemberMapper memberMapper;

	public void userJoin(MemberDTO member) {
		memberMapper.memberJoin(member);
	}

	public void userAuth(AuthDTO auth) {
		memberMapper.authJoin(auth);
	}
	public MemberDTO  findById(String userid) {
		return memberMapper.findById(userid);
	}
	//ȸ������
	public void update(MemberDTO member) {
		memberMapper.update(member);
	}
	//ȸ��Ż��
	public void memberDelete(String userid) {
		memberMapper.memberDelete(userid);
	}
	public void authDelete(String userid) {
		memberMapper.authDelete(userid);
	}
	
	public MemberDTO loginCheck(String userid) {
		return  memberMapper.loginCheck(userid);
	}

	public int getCount(HashMap<String, Object> hm) {
		return memberMapper.getCount(hm);
	}

	public List<MemberDTO> findAll(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return memberMapper.findAll(hm);
	}
}
