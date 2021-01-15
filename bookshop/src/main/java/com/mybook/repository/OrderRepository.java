package com.mybook.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybook.dto.Order;
import com.mybook.mapper.OrderMapper;

@Repository
public class OrderRepository {
	@Autowired
	private OrderMapper orderMapper;

	// 주문하기
	public void insert(Order order) {
		orderMapper.insert(order);
	}

	// 전체보기
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		return orderMapper.findAll();
	}

	// 주문수정
	public void update(Order order) {
		orderMapper.update(order);
	}

	// 주문취소
	public void delete(String order_id) {
		orderMapper.delete(order_id);
	}

	public Order findById(String order_id) {
		
		return orderMapper.findById(order_id);
	}

	public List<Order> orderList(String userid) {
		
		return orderMapper.orderList(userid);
	}
}


	