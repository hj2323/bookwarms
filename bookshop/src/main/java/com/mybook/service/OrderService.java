package com.mybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybook.dto.Order;
import com.mybook.repository.OrderRepository;

@Service
public class OrderService {
	@Autowired
	private OrderRepository orderRepository;
	//주문하기
		public void insert(Order book) {
			orderRepository.insert(book);
		}
		//전체보기
		public List<Order> findAll() {
			// TODO Auto-generated method stub
			return orderRepository.findAll();
		}
		//주문수정
		public void update(Order book) {
			orderRepository.update(book);
		}
		// 주문취소
		public void delete(int order_id) {
			orderRepository.delete(order_id);
		}
		public List<Order> findById(int cart_id) {
			// TODO Auto-generated method stub
			return orderRepository.findById(cart_id);
		}
}
