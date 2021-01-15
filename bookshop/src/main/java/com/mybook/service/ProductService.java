package com.mybook.service;

import java.util.HashMap;
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
	//상품전체보기(페이징 추가)
	public List<Books> findAllwithPage(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return productRepository.findAllwithPage(hm);
	}
	//상품수정
	public void update(Books book) {
		productRepository.update(book);
	}
	//상품삭제
	public void delete(int book_id) {
		productRepository.delete(book_id);
	}
	public int getCount(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return productRepository.getCount(hm);
	}
	
	
	public Books findById(int book_id) {
		return productRepository.findById(book_id);
	}
	//카테고리별로 상품전체보기
	public List<Books> findAllwithPageNcate(HashMap<String, Object> hm) {
		
		return productRepository.findAllwithPageNcate(hm);
	}
	public List<Books> findAllSearch(HashMap<String, Object> hm) {
		
		return productRepository.findAllSearch(hm);
	}
	public List<Books> cateCount() {
		// TODO Auto-generated method stub
		return productRepository.cateCount();
	}
	public List<Books> bestseller() {
		// TODO Auto-generated method stub
		return productRepository.bestseller();
	}
}
