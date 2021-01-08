package com.mybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybook.dto.Books;
import com.mybook.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	//상품추가
	public void insert(Books book) {
		productRepository.insert(book);
	}
	//상품전체보기
	public List<Books> findAll() {
		// TODO Auto-generated method stub
		return productRepository.findAll();
	}
	//상품수정
	public void update(Books book) {
		productRepository.update(book);
	}
	//상품삭제
	public void delete(int book_id) {
		productRepository.delete(book_id);
	}
}
