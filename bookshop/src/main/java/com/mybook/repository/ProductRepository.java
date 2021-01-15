package com.mybook.repository;

import java.util.HashMap;
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

	// 상품전체보기(페이징추가)
	public List<Books> findAllwithPage(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return productMapper.findAllwithPage(hm);
	}

	// 상품수정
	public void update(Books book) {
		productMapper.update(book);
	}

	// 상품삭제
	public void delete(int book_id) {
		productMapper.delete(book_id);
	}
	//카운트
	public int getCount(HashMap<String, Object> hm) {
		return productMapper.getCount(hm);
	}
	// 상품전체보기
	public List<Books> findAll() {
		return productMapper.findAll();
	}

	public Books findById(int book_id) {
		return productMapper.findById(book_id);
	}
	//카테고리별로 상품전체보기
	public List<Books> findAllwithPageNcate(HashMap<String, Object> hm) {
		return productMapper.findAllwithPageNcate(hm);
	}

	public List<Books> findAllSearch(HashMap<String, Object> hm) {
		
		return productMapper.findAllSearch(hm);
	}

	public List<Books> cateCount() {
		// TODO Auto-generated method stub
		return productMapper.cateCount();
	}

	public List<Books> bestseller() {
		// TODO Auto-generated method stub
		return productMapper.bestseller();
	}


}
