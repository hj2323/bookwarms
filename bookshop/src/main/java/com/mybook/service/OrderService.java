package com.mybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mybook.dto.Order;
import com.mybook.dto.OrderDetail;
import com.mybook.mapper.OrderDetailMapper;
import com.mybook.mapper.ProductMapper;
import com.mybook.repository.OrderRepository;
import com.mybook.repository.ProductRepository;

@Service
public class OrderService {
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private OrderDetailMapper orderdetailmapper;
	@Autowired
	private ProductMapper productMapper;
	
	//주문하기
	
		public void insert(Order order) {
			orderRepository.insert(order);
			System.out.println(order.getOrder_id());
			
		}
		@Transactional
		public void insertDetail(OrderDetail orderdetail) {
			
			orderdetailmapper.insert(orderdetail);
			
			productMapper.updateOrderCnt(orderdetail.getBook_id(), 1);
		}
		//전체보기
		public List<Order> findAll() {
			// TODO Auto-generated method stub
			return orderRepository.findAll();
		}
		//주문수정
		public void update(Order order) {
			orderRepository.update(order);
		}
		// 주문취소
		public void delete(String order_id) {
			orderRepository.delete(order_id);
		}
		public Order findById(String order_id) {
			
			return orderRepository.findById(order_id);
		}
		// 나의 주문 목록
		public List<Order> orderList(String userid) {
			
			return orderRepository.orderList(userid);
		}

		
}
