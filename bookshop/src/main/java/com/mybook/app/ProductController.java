package com.mybook.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/a_product")
@Controller
public class ProductController {
	@GetMapping("a_product")
	public String a_notice() {
		return "/admin/a_product/a_product";
	}
}
