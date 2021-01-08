package com.mybook.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybook.dto.Books;
import com.mybook.mapper.ProductMapper;

@Repository
public class ProductRepository {
	@Autowired
	private ProductMapper productMapper;

	// 상품추가
	public void insert(Books book) {
		productMapper.insert(book);
	}

	// 상품전체보기
	public List<Books> findAll() {
		// TODO Auto-generated method stub
		return productMapper.findAll();
	}

	// 상품수정
	public void update(Books book) {
		productMapper.update(book);
	}

	// 상품삭제
	public void delete(int book_id) {
		productMapper.delete(book_id);
	}
}
