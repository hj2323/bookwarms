package com.mybook.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mybook.dto.BooksCategory;
import com.mybook.dto.MemberDTO;
import com.mybook.service.CategoryService;

@RequestMapping("/admin/a_productcategory")
@Controller
public class ProductCategoryController {
	@Autowired
	private CategoryService cateservice;
	
	

	@GetMapping("a_productcategory")
	public String a_notice(Model model, HttpSession session) {

		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
		
			List<BooksCategory> lists = cateservice.findAll();
		
			model.addAttribute("categorylist", lists);
		
		return "/admin/a_productcategory/a_productcategory";
		
		
		}else {
			return "redirect:/";
		}
	}
	
	@PostMapping("insert")
	@ResponseBody
	public String insert(@RequestBody BooksCategory cate) {
		cateservice.insert(cate);
		return "success";
	}
	
	
	
}
