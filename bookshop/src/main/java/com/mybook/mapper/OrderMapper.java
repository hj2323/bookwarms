package com.mybook.mapper;

import java.util.List;

import com.mybook.dto.Order;

public interface OrderMapper {
	// 주문하기
	public void insert(Order order);

	// 상품전체보기
	public List<Order> findAll();

	// 주문수정
	public void update(Order order);

	// 주문취소
	public void delete(int order_id);
}
