package com.mybook.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mybook.service.NoticeService;

@RequestMapping("/admin/a_notice/*")
@Controller
public class NoticeController {
	@Autowired
	private NoticeService nservice;

	@GetMapping("a_notice")
	public String a_notice(Model model) {
		model.addAttribute("notice", nservice.list());
		return "/admin/a_notice/a_notice";
	}
	
	
	
}
