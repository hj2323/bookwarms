package com.mybook.domain;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mybook.dto.MemberDTO;
import com.mybook.mapper.MemberMapper;

public class CustomUserDetailsService  
                                 implements UserDetailsService{
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) 
			                             throws UsernameNotFoundException {
	  System.out.println("loadUserByUsername test");
	  MemberDTO member=memberMapper.read(username);
		return member==null?null : new CustomUser(member);
	}

}
