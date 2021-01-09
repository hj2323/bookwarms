package com.mybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybook.dto.Cart;
import com.mybook.repository.CartRepository;

@Service
public class CartService {
	@Autowired
	private CartRepository cartRepository;
	//상품추가
		public void insert(Cart cart) {
			cartRepository.insert(cart);
		}
		//상품전체보기
		public List<Cart> findAll(String userid) {
			// TODO Auto-generated method stub
			return cartRepository.findAll(userid);
		}
		//상품수정
		public void update(Cart cart) {
			cartRepository.update(cart);
		}
		//상품삭제
		public void delete(int cart_id) {
			cartRepository.delete(cart_id);
		}
		public List<Cart> findbyUserid(String userid) {
			// TODO Auto-generated method stub
			return cartRepository.findbyUserid(userid);
		}
}

