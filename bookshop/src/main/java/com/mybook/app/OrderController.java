package com.mybook.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mybook.dto.Cart;
import com.mybook.dto.MemberDTO;
import com.mybook.dto.Order;
import com.mybook.service.CartService;
import com.mybook.service.MemberService;
import com.mybook.service.OrderService;

@RequestMapping("/order")
@Controller
public class OrderController {
 @Autowired
 private OrderService orderservice;
 @Autowired
	private CartService cartservice;
 @Autowired 
 private MemberService mservice;
	
 	@GetMapping("order")
 	public String order() {
 		return "order/order";
 	}
 
 	@PostMapping("order")
	@ResponseBody
	public String order(@RequestParam(value = "chbox[]")List<String> chArr, Model model,  HttpSession session) {
 		//int result = 0;
 		String userid = (String) session.getAttribute("sessid");
 		MemberDTO member = mservice.findById(userid);
		int cart_id = 0;
		List<Cart> cartlist = null;
		for(String i : chArr) {
			cart_id = Integer.parseInt(i);
			cartlist = cartservice.findByCartid(cart_id);
		}
		
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("member", member);
		//result=1;
		return "/order/order";
	}
}
