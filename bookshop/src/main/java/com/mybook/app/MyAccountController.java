package com.mybook.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/mypage/myaccount/*")
@Controller
public class MyAccountController {
	@GetMapping("myaccount")
	public String myaccount(Model model) {
		return "/mypage/myaccount/myaccount";
	}
}
