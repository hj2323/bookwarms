package com.mybook.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/a_productcategory")
@Controller
public class ProductCategoryController {
	@GetMapping("a_productcategory")
	public String a_notice() {
		return "/admin/a_productcategory/a_productcategory";
	}
	
}
