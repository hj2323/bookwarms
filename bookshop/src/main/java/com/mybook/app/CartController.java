package com.mybook.app;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mybook.dto.Cart;
import com.mybook.service.CartService;

@RequestMapping("/cart")
@Controller
public class CartController {
	@Autowired
	private CartService cartservice;
	
	
	@GetMapping("cart")
	public String cart(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("sessid");
		List<Cart> lists = cartservice.findAll(userid);
		//System.out.println(lists+"hgfhg");
		model.addAttribute("cartlist", lists);
		
		
		return "cart/cart";
	}
	
	@PostMapping("insert")
	@ResponseBody
	public String insert(@RequestBody Cart cart,  HttpSession session) {
		String userid = (String) session.getAttribute("sessid");
		cart.setUserid(userid);
		
		
		//같은 book_id가 db에 이미 있는지 찾는 부분
//		int book_id = cart.getBook_id();
//		List<Cart> cartWithUserid = cartservice.findbyUserid(userid);
//		for(Cart cart_userid: cartWithUserid) {
//			if(cart_userid.getBook_id().equals(book_id){
//				cartservice.update(cart);
//			}else{
//				cartservice.insert(cart);
//			}
//		}
		
		cartservice.insert(cart);
		
		//System.out.println(cart);
		return "success";
	}
	
	@PostMapping("update")
	@ResponseBody
	public String update(@RequestBody Cart cart) {
		cartservice.update(cart);
		return "success";
	}
	
	@PostMapping("delete")
	@ResponseBody
	public int delete(@RequestParam(value = "chbox[]")List<String> chArr) {
		int result = 0;
		int cart_id = 0;
		for(String i : chArr) {
			cart_id = Integer.parseInt(i);
			cartservice.delete(cart_id);
		}
		result=1;
		return result;
	}
}
