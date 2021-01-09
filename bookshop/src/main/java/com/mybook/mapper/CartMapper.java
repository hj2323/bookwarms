package com.mybook.mapper;

import java.util.List;

import com.mybook.dto.Cart;

public interface CartMapper {
	// 상품추가
	public void insert(Cart cart);

	// 상품전체보기
	public List<Cart> findAll(String userid);

	// 상품수정
	public void update(Cart cart);

	// 상품삭제
	public void delete(int cart_id);

	public List<Cart> findbyUserid(String userid);
}
