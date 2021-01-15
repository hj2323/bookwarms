package com.mybook.app;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mybook.dto.Books;
import com.mybook.dto.Cart;
import com.mybook.dto.MemberDTO;
import com.mybook.dto.Order;
import com.mybook.dto.OrderDetail;
import com.mybook.service.CartService;
import com.mybook.service.MemberService;
import com.mybook.service.OrderService;
import com.mybook.service.ProductService;

@RequestMapping("/order")
@Controller
public class OrderController {
 @Autowired
 private OrderService orderservice;
 @Autowired
	private CartService cartservice;
 @Autowired 
 private MemberService mservice;
 @Autowired
 private ProductService pservice;
	
 	@GetMapping("order")
 	public String order(Model model, int book_id, int amount,  HttpSession session) {
 		String userid = (String) session.getAttribute("sessid");
 		MemberDTO member = mservice.findById(userid);
 		Books book = pservice.findById(book_id);
		
 		model.addAttribute("amount", amount);
		model.addAttribute("book", book);
		model.addAttribute("member", member);
 		return "order/order";
 	}
 	
// 	@GetMapping("orderFromCart")
// 	public String orderFromCart(Model model, int book_id, int amount,  HttpSession session) {
// 		String userid = (String) session.getAttribute("sessid");
// 		MemberDTO member = mservice.findById(userid);
// 	
//		
// 		List<Books> booklist = new ArrayList<Books>();
//		for(String bookid : booklist) {
//			booklist.add(pservice.findById(book_id));
//		}
// 		
// 		model.addAttribute("amount", amount);
//		model.addAttribute("book", book);
//		model.addAttribute("member", member);
// 		return "order/order";
// 	}
 	
 	@PostMapping("insert")
 	public String insert(Order order, int book_id) {
 		//달력 메서드(Calendar)이용하여 연/월/일을 추출하고 6자리의 랜덤 숫자로 만들어진
 		//subNum을 더하여 [날짜]_[랜덤숫자] 로 이루어진, 최대한 중복되지 않는 고유한 문자열을 생성합니다.
 		Calendar cal = Calendar.getInstance();
 		 int year = cal.get(Calendar.YEAR);
 		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
 		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
 		 String subNum = "";
 		 
 		 for(int i = 1; i <= 6; i ++) {
 		  subNum += (int)(Math.random() * 10);
 		 }
 		 
 		 String order_id = ymd + "_" + subNum;
 		
 		System.out.println(order_id);
 		order.setOrder_id(order_id);
 		orderservice.insert(order);
 		
 		
 		OrderDetail orderdetail = new OrderDetail();
 		orderdetail.setBook_id(book_id);
 		orderdetail.setOrder_id(order_id);
 		orderdetail.setAmount(order.getAmount());
 		orderservice.insertDetail(orderdetail);
 		
 		
 		return "redirect:/mypage/myorder";
 		
 	}
 
 	
 	
 	@PostMapping("order")
 	//@ResponseBody
	public String order(HttpServletRequest request, Model model,  HttpSession session) {
 		//int result = 0;
 		
 		String userid = (String) session.getAttribute("sessid");
 		MemberDTO member = mservice.findById(userid);
		int cart_id = 0;
		List<Cart> cartlist = new ArrayList<Cart>();
		
		String[] chArr = request.getParameterValues("items");
		for(String i : chArr) {
			cart_id = Integer.parseInt(i);
			cartlist.add(cartservice.findByCartid(cart_id));
		}
		//System.out.println(cartlist);
		
		//HashMap<String, Object> hm = new HashMap<>();
		
//		hm.put("startRow",startRow);
//		hm.put("pageSize", pageSize);
//		hm.put("cateCode", cateCode);
		
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("member", member);
		//result=1;
		return "order/order";
	}
 	
 	
 	
 
}
