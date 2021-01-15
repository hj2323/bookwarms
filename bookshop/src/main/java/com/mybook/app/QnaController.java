package com.mybook.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.mybook.dto.CommentDTO;
import com.mybook.dto.MemberDTO;
import com.mybook.dto.PageDTO;
import com.mybook.dto.Qna;
import com.mybook.service.CommentService;
import com.mybook.service.QnaService;

@RequestMapping("/qna/*")
@Controller
public class QnaController {
	@Autowired
	private QnaService qservice;
	@Autowired
	private CommentService cservice;
	
	@GetMapping("qna")
	public String qna(Model model,String pageNum) {
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
		
		
		return "qna/qna";
	}
	
	@GetMapping("qna_insert")
	public String qna_insert() {
		return "qna/qna_insert";
	}
	
	@PostMapping("insert")
	public String insert(@ModelAttribute Qna qna, HttpServletRequest req, HttpSession session) {
		String writer = (String) session.getAttribute("sessid");
		qna.setQ_ip(req.getRemoteAddr());
		qna.setQ_writer(writer);
		qservice.insert(qna);
		
		return "redirect:qna";
	}
	
	@GetMapping("viewPath")
	public String view( int q_no, Model model) {
		Qna qna = qservice.findByQno(q_no);
		model.addAttribute("qna",qna);
		
		List<CommentDTO> clist = cservice.getList(q_no);
		model.addAttribute("clist", clist);
		return "/qna/qna_view";
	}
	@GetMapping("qna_update")
	public String update(int q_no, Model model, HttpServletResponse response, HttpSession session) throws Exception {
		Qna qna = qservice.findByQno(q_no);
		String sessid = (String) session.getAttribute("sessid");
		String writer = qna.getQ_writer();
		if(writer.equals(sessid)||sessid.equals("admin")) {
			model.addAttribute("qna",qna);
			return "/qna/qna_update";	
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
            out.println("<script>alert('수정권한이 없습니다'); </script>");
            out.flush();
            return "redirect:/qna/viewPath?q_no="+q_no;
        }
    }
	@PostMapping("update")
	public String update(@ModelAttribute Qna qna) {
		qservice.update(qna);
		return "redirect:/qna/qna";
	} 
	
	@DeleteMapping("delete/{q_no}")
	@ResponseBody
	public String delete(@PathVariable int q_no) {
		//System.out.println(num);
		qservice.delete(q_no);
		return "success";
	}
	
}
