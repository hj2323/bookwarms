package com.mybook.mapper;

import java.util.List;

import com.mybook.dto.Order;
import com.mybook.dto.OrderDetail;

public interface OrderDetailMapper {
	// 주문하기
	public void insert(OrderDetail orderdetail);

}
