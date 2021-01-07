package com.mybook.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mybook.dto.AuthDTO;
import com.mybook.dto.MemberDTO;
import com.mybook.repository.MemberRepository;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	//@Autowired
	//private PasswordEncoder passwordEncoder;
	
	@Transactional
	public void join(MemberDTO member, AuthDTO auth) {
		//회원가입
	//	member.getUserpw(); //  ��ȣȭ ��
		//member.setUserpw(passwordEncoder.encode(member.getUserpw()));
		memberRepository.userJoin(member);
		memberRepository.userAuth(auth);
	}
	// 회원찾기
		public MemberDTO findById(String userid) {
			return memberRepository.findById(userid);
		}
		//회원수정
		public void update(MemberDTO member) {
			//��� ��ȣȭ��Ű��
			//member.setUserpw(passwordEncoder.encode(member.getUserpw()));
			memberRepository.update(member);
		}
		//회원삭제
		@Transactional
		public void delete(String userid) {
			memberRepository.memberDelete(userid);
			memberRepository.authDelete(userid);
		}
		
		
		public MemberDTO loginCheck(String userid) {
			return memberRepository.loginCheck(userid);
		}
		
		public int getCount(HashMap<String, Object> hm) {
			return memberRepository.getCount(hm);
		}
		public List<MemberDTO> findAll(HashMap<String, Object> hm) {
			
			return memberRepository.findAll(hm);
		}
}
