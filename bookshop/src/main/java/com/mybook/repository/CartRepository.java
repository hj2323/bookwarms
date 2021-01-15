package com.mybook.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybook.dto.Cart;
import com.mybook.mapper.CartMapper;

@Repository
public class CartRepository {
	@Autowired
	private CartMapper cartMapper;
	// 상품추가
		public void insert(Cart cart) {
			cartMapper.insert(cart);
		}

		// 상품전체보기
		public List<Cart> findAll(String userid) {
			// TODO Auto-generated method stub
			return cartMapper.findAll(userid);
		}

		// 상품수정
		public void update(Cart cart) {
			cartMapper.update(cart);
		}

		// 상품삭제
		public void delete(int cart_id) {
			cartMapper.delete(cart_id);
		}

		public List<Cart> findbyUserid(String userid) {
			return cartMapper.findbyUserid(userid);
		}

		public Cart findByCartid(int cart_id) {
			System.out.println(cartMapper.findByCartid(cart_id));
			return cartMapper.findByCartid(cart_id);
		}
}

	

	