package com.mybook.app;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/reply/*")
@RestController
public class QnaReplyController {
	@Autowired
	private CommentService cservice;
	//��� �߰�
	@PostMapping("commentInsert")
	@ResponseBody
	public String insert(@RequestBody CommentDTO comment, HttpSession session) {//@RequestBody �� ������̼��� �ٿ���� ���̽� ���·� ������ �Ѿ�´�
		String writer = (String) session.getAttribute("sessid");
		comment.setUserid(writer);;
		cservice.insert(comment);
		System.out.println(comment);
		return "success";//���� ��Ʈ���� �並 ��� ������ ResponseBody�� �ٿ��ִ� ���̴�. 
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
