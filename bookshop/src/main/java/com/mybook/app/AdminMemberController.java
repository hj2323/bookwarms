package com.mybook.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mybook.dto.MemberDTO;
import com.mybook.dto.PageDTO;
import com.mybook.service.MemberService;

@RequestMapping("/admin/a_member")
@Controller
public class AdminMemberController {
	@Autowired MemberService mservice;
	
	
	@GetMapping("a_member")
	public String a_notice(Model model, String field, String word, String pageNum) {
		pageNum = pageNum==null?"1":pageNum;
		int page=Integer.parseInt(pageNum);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("field", field);
		hm.put("word", word);
		
		int cnt = mservice.getCount(hm);
		int totalCount = cnt;
		
		//페이징
		int pageSize=5;
		int pageBlock= 3;
		int pageCount = (int) Math.ceil((double) totalCount / pageSize);
		int startPage = ((page / pageBlock) - (page % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		//int startPage = ((page)/pageBlock)*pageBlock+1;
		//1/3*3+1 ==> 1
		//4/3*3+1 ==> 4
		//5/3*3+1 ==> 5
		
		//page가 pageBlock의 배수 즉, 3, 6, 9, 12....일때 처리 해주는 부분이 - (page % pageBlock == 0 ? 1 : 0)
				
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		PageDTO pageDto = new PageDTO();
		pageDto.setPageCount(pageCount);
		pageDto.setPageBlock(pageBlock);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		pageDto.setTotalCount(totalCount);
		
		pageDto.setPageNum(pageNum);
		
		//startRow 맨위에 첫번째 글에 인덱스
		int startRow =(page-1)*pageSize;
		hm.put("startRow",startRow);
		hm.put("pageSize", pageSize);
		
		List<MemberDTO> lists = mservice.findAll(hm);
		
		model.addAttribute("memberlist", lists);
		model.addAttribute("count", cnt);
		model.addAttribute("pageDto",pageDto);
		
		return "/admin/a_member/a_member";
	}
	
	@GetMapping("viewPath/{userid}")
	public String view(@PathVariable String userid, Model model) {
		MemberDTO member = mservice.findById(userid);
		model.addAttribute("member",member);
		return "/admin/a_member/a_memberView";
	}
	
	// 수정
	@PostMapping("update")
	public String update(@ModelAttribute MemberDTO member, HttpServletRequest request) {
		mservice.update(member);
		return "redirect:a_member";
	} 
	@DeleteMapping("delete/{userid}")
	@ResponseBody
	public String delete(@PathVariable String userid) {
		//System.out.println(num);
		mservice.delete(userid);
		return "success";
	}
	
	
}
