package com.mybook.app;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mybook.dto.CommentDTO;
import com.mybook.dto.MemberDTO;
import com.mybook.service.CommentService;
import com.mybook.service.MemberService;

@RequestMapping("/reply/*")
@RestController
public class QnaReplyController {
	@Autowired
	private CommentService cservice;
	@Autowired 
	private MemberService mservice;
	//占쏙옙占� 占쌩곤옙
	@PostMapping("commentInsert")
	@ResponseBody
	public String insert(@RequestBody CommentDTO comment, HttpSession session) {
		String userid = (String) session.getAttribute("sessid");
		MemberDTO member = mservice.findById(userid);		
		comment.setQreply_username(member.getUsername());
		cservice.insert(comment);
		//System.out.println(comment);
		return "success";
	}
	
	@GetMapping("commentList")
	public List<CommentDTO> list(int q_no) {
		
		List<CommentDTO> clist = cservice.getList(q_no);
		System.out.println("clist : " + clist);
		return clist;
	}
	
	@DeleteMapping("commentDelete/{qreply_no}")
	public String delete(@PathVariable("qreply_no") int qreply_no) {
		System.out.println(qreply_no);
		cservice.delete(qreply_no);
		return "success";
	}
	
}
