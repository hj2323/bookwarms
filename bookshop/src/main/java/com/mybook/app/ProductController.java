package com.mybook.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mybook.dto.Books;
import com.mybook.dto.BooksCategory;
import com.mybook.dto.MemberDTO;
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
	public String a_product(Model model, HttpSession session) {
		

		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
		
			List<Books> lists = pservice.findAll();
			List<BooksCategory> catelists = cateservice.findAll();
			
			model.addAttribute("categorylist", catelists);
			model.addAttribute("Booklist", lists);
		
			return "/admin/a_product/a_product";
		
		
		}else {
			return "redirect:/";
		}
		
	}
	
	@GetMapping("a_product_insert")
	public String a_product_insert(Model model, HttpSession session) {
		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
	
		
		return "/admin/a_product/a_product_insert";
		
		
		}else {
			return "redirect:/";
		}
	}
	
}
