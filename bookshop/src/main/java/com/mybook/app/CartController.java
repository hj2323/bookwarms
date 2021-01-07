package com.mybook.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cart")
@Controller
public class CartController {
	@GetMapping("cart")
	public String signup() {
		return "cart/cart";
	}
	
}
