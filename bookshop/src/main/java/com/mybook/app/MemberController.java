package com.mybook.app;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mybook.dto.AuthDTO;
import com.mybook.dto.MemberDTO;
import com.mybook.service.MemberService;

@RequestMapping("/member")
@Controller
public class MemberController {
	@Autowired MemberService mservice;
	//@Autowired
	//private PasswordEncoder passwordEncoder;
	
	@GetMapping("signup")
	public String signup() {
		return "member/signup";
	}
	
	
	
	@PostMapping("join")
	public String join(MemberDTO member, AuthDTO auth) {
		auth.setAuth("ROLE_"+auth.getAuth());
		//System.out.println("auth : "+auth.getAuth());
		mservice.join(member, auth);
		return "redirect:/";
	}
	
//	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//	String existingPassword = ... // Password entered by user
//	String dbPassword       = ... // Load hashed DB password
//
//	if (passwordEncoder.matches(existingPassword, dbPassword)) {
//	    // Encode new password and store it
//	} else {
//	    // Report error 
//	}
	
	//로그인 체크
		@PostMapping("loginCheck")
		@ResponseBody//문자열을 돌려줘야 되므로
		public String login(HttpSession session, String userid, String userpw) {
			System.out.println(userid + userpw);
			String result="";
			MemberDTO member = mservice.loginCheck(userid);
			if(member==null) {//회원아님 
				result="fail";
			}else if(member.getUserpw().equals(userpw)) {//회원임
				//세션에 추가--> 서블릿 세션객체를 써줌HttpSession session
				session.setAttribute("sessid", userid);
				result="success";
			}else {//비번오류
				result="passfail";
			}
			

			return result;
		}
		
		//로그아웃로직
		@GetMapping("logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:login";
		}
		
}
