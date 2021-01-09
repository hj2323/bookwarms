package com.mybook.mapper;

import java.util.HashMap;
import java.util.List;

import com.mybook.dto.Books;

public interface ProductMapper {
	// 상품추가
		public void insert(Books book);

		// 상품전체보기(페이징추가)
		public List<Books> findAllwithPage(HashMap<String, Object> hm);

		// 상품수정
		public void update(Books book);

		// 상품삭제
		public void delete(int book_id);

		public int getCount(HashMap<String, Object> hm);
		// 상품전체보기
		public List<Books> findAll();

		public Books findById(int book_id);
		//카테고리별로 상품전체보기
		public List<Books> findAllwithPageNcate(HashMap<String, Object> hm);
}
