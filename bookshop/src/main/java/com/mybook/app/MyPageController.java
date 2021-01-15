package com.mybook.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mybook.dto.MemberDTO;
import com.mybook.dto.Order;
import com.mybook.dto.PageDTO;
import com.mybook.service.MemberService;
import com.mybook.service.OrderService;
import com.mybook.service.QnaService;
@RequestMapping("/mypage/*")
@Controller
public class MyPageController {
	@Autowired
	private QnaService qservice;
	@Autowired
	private MemberService mservice;
	 @Autowired
	 private OrderService orderservice;
	
	@GetMapping("myaccount")
	public String myaccount(Model model,HttpSession session) {
		String sessid = (String) session.getAttribute("sessid");
		MemberDTO member = mservice.findById(sessid);
		
		model.addAttribute("member", member);
		return "/mypage/myaccount";
	}
	
	@GetMapping("modify_myaccount")
	public String modify_myaccount(Model model,HttpSession session) {
		String sessid = (String) session.getAttribute("sessid");
		MemberDTO member = mservice.findById(sessid);
		
		model.addAttribute("member", member);
		return "/mypage/modify_myaccount";
	}
	
	@PostMapping("myaccount/update")
	public String update(MemberDTO member) {
		mservice.update(member);
		
		return "redirect:/mypage/myaccount";
	}
	
	@PostMapping("myaccount/delete/{userid}")
	public String delete(@PathVariable("userid") String userid ) {
		mservice.delete(userid);
		
		return "success";
	}
	
	
	
	@GetMapping("myqna")
	public String myqna(Model model, HttpSession session, String pageNum) {
		String sessid = (String) session.getAttribute("sessid");
		
		MemberDTO member = mservice.findById(sessid);
		String q_writer = member.getUsername();
		
		pageNum = pageNum==null?"1":pageNum;
		int page=Integer.parseInt(pageNum);
		
		HashMap<String, Object> hm = new HashMap<>();
		int cnt = qservice.mypageGetCount(hm);
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
		hm.put("q_writer", q_writer);
		
		
		List<MemberDTO> lists = qservice.myqna(hm);
		
		model.addAttribute("qnalist", lists);
		model.addAttribute("count", cnt);
		model.addAttribute("pageDto",pageDto);
		return "/mypage/myqna";
	}
	
	// 나의 주문 목록
	 	@GetMapping("myorder")
	 	public void getOrderList(HttpSession session, Order order, Model model) throws Exception {
	 	
	 	 
	 	String sessid = (String) session.getAttribute("sessid");
	 	 
	 	 List<Order> orderList = orderservice.orderList(sessid);
	 	 
	 	 model.addAttribute("orderList", orderList);
	 	 
	 	}
	 // 주문상세보기
	 	 	@GetMapping("myorder_view")
	 	 	public void myorder_view(HttpSession session, String order_id, Model model) throws Exception {
	 	 	
	 	 	 
	 	 	String sessid = (String) session.getAttribute("sessid");
	 	 	
	 	 	 Order order = orderservice.findById(order_id);
	 	 	 
	 	 	 model.addAttribute("order", order);
	 	 	 
	 	 	}
	 	
	
	
}
