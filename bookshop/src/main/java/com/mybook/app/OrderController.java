package com.mybook.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mybook.dto.Order;
import com.mybook.service.OrderService;

@RequestMapping("/order")
@Controller
public class OrderController {
 @Autowired
 private OrderService orderservice;
	
	
	@GetMapping("order")
	public String order() {
		return "order/order";
	}
}
