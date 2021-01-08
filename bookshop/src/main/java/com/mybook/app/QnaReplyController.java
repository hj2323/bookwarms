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
	public String insert(@RequestBody CommentDTO comment, HttpSession session) {//@RequestBody 占쏙옙 占쏙옙占쏙옙占쏙옙抉占쏙옙占� 占쌕울옙占쏙옙占� 占쏙옙占싱쏙옙 占쏙옙占승뤄옙 占쏙옙占쏙옙占쏙옙 占싼억옙쨈占�
		String userid = (String) session.getAttribute("sessid");
		MemberDTO member = mservice.findById(userid);		
		comment.setQreply_username(member.getUsername());
		cservice.insert(comment);
		System.out.println(comment);
		return "success";//占쏙옙占쏙옙 占쏙옙트占쏙옙占쏙옙 占썰를 占쏙옙占� 占쏙옙占쏙옙占쏙옙 ResponseBody占쏙옙 占쌕울옙占쌍댐옙 占쏙옙占싱댐옙. 
	}
	
	@GetMapping("commentList")
	public List<CommentDTO> list(int q_no) {
		List<CommentDTO> clist = cservice.getList(q_no);
		return clist;
	}
	
	@DeleteMapping("commentDelete/{qreply_no}")
	public String delete(@PathVariable("qreply_no") int qreply_no) {
		System.out.println(qreply_no);
		cservice.delete(qreply_no);
		return "success";
	}
	
}
