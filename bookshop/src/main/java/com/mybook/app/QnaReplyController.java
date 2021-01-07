package com.mybook.app;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/reply/*")
@RestController
public class QnaReplyController {
	@Autowired
	private CommentService cservice;
	//댓글 추가
	@PostMapping("commentInsert")
	@ResponseBody
	public String insert(@RequestBody CommentDTO comment, HttpSession session) {//@RequestBody 이 어노테이션을 붙여줘야 제이슨 형태로 값들이 넘어온다
		String writer = (String) session.getAttribute("sessid");
		comment.setUserid(writer);;
		cservice.insert(comment);
		System.out.println(comment);
		return "success";//여기 스트링은 뷰를 잡기 때문에 ResponseBody를 붙여주는 것이다. 
	}
	
	@GetMapping("commentList")
	public List<CommentDTO> list(int num) {
		List<CommentDTO> clist = cservice.getList(num);
		return clist;
	}
	
	@DeleteMapping("commentDelete/{cnum}")
	public String delete(@PathVariable("cnum") int cnum) {
		System.out.println(cnum);
		cservice.delete(cnum);
		return "success";
	}
	
}
