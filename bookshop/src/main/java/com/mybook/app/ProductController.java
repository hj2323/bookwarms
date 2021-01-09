package com.mybook.app;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mybook.dto.Books;
import com.mybook.dto.BooksCategory;
import com.mybook.dto.MemberDTO;
import com.mybook.dto.PageDTO;
import com.mybook.service.CategoryService;
import com.mybook.service.ProductService;

@RequestMapping("/admin/a_product")
@Controller
public class ProductController {
	@Autowired
	private ProductService pservice;
	@Autowired
	private CategoryService cateservice;
	
	@GetMapping("a_product")
	public String a_product(Model model, HttpSession session, String pageNum) {
		

		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
			pageNum = pageNum==null?"1":pageNum;
			int page=Integer.parseInt(pageNum);
			
			HashMap<String, Object> hm = new HashMap<>();
			int cnt = pservice.getCount(hm);
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
			
			List<Books> lists = pservice.findAllwithPage(hm);
			
			model.addAttribute("Booklist", lists);
			model.addAttribute("count", cnt);
			model.addAttribute("pageDto",pageDto);
			return "/admin/a_product/a_product";
		
		
		}else {
			return "redirect:/";
		}
		
	}
	
	@GetMapping("a_product_insert")
	public String a_product_insert(Model model, Books book, HttpSession session) {
		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
			
			List<BooksCategory> catelists = cateservice.findAll();
			model.addAttribute("categorylist", catelists);
		return "/admin/a_product/a_product_insert";
		
		}else {
			return "redirect:/";
		}
	}
	
	@PostMapping("insert")
	public String insert(Books book) {
		
		pservice.insert(book);
		return "redirect:/admin/a_product/a_product";
	}
	
	@GetMapping("update")
	public String update(Model model, int book_id, HttpSession session) {
		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
			Books book = pservice.findById(book_id);
			List<BooksCategory> catelists = cateservice.findAll();
			
			model.addAttribute("book", book);
			model.addAttribute("categorylist", catelists);
		return "/admin/a_product/a_product_update";
		
		}else {
			return "redirect:/";
		}
	}
	@PostMapping("update")
	public String update(@ModelAttribute Books book) {
		System.out.println(book.getBook_releaseDate());
		pservice.update(book);
		return "redirect:/admin/a_product/a_product";
	}
	
	@PostMapping("delete")
	@ResponseBody
	public int delete(@RequestParam(value = "chbox[]")List<String> chArr) {
		int result = 0;
		int book_id = 0;
		for(String i : chArr) {
			book_id = Integer.parseInt(i);
			pservice.delete(book_id);
		}
		result=1;
		return result;
	}
	
	
}
