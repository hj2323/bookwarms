package com.mybook.mapper;

import java.util.List;

import com.mybook.dto.Books;

public interface ProductMapper {
	// 상품추가
		public void insert(Books book);

		// 상품전체보기
		public List<Books> findAll();

		// 상품수정
		public void update(Books book);

		// 상품삭제
		public void delete(int book_id);
}
