package com.mybook.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mybook.dto.MemberDTO;
import com.mybook.dto.PageDTO;
import com.mybook.service.CategoryService;
import com.mybook.service.QnaService;

@RequestMapping("/admin/a_qna")
@Controller
public class AdminQnaController {
	@Autowired
	private QnaService qservice;
	
	

	@GetMapping("a_qna")
	public String a_notice(Model model, HttpSession session, String pageNum) {

		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
		
			pageNum = pageNum==null?"1":pageNum;
			int page=Integer.parseInt(pageNum);
			
			HashMap<String, Object> hm = new HashMap<>();
			int cnt = qservice.getCount(hm);
			int totalCount = cnt;
			
			int pageSize=5;
			int pageBlock= 3;
			int pageCount = (int) Math.ceil((double) totalCount / pageSize);
			int startPage = ((page / pageBlock) - (page % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			
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
			
			int startRow =(page-1)*pageSize;
			hm.put("startRow",startRow);
			hm.put("pageSize", pageSize);
			
			List<MemberDTO> lists = qservice.findAll(hm);
			
			model.addAttribute("qnalist", lists);
			model.addAttribute("count", cnt);
			model.addAttribute("pageDto",pageDto);
		
		return "/admin/a_qna/a_qna";
		
		
		}else {
			return "redirect:/";
		}
	}
}
