package com.mybook.mapper;

import java.util.List;

import com.mybook.dto.BooksCategory;
import com.mybook.dto.MemberDTO;

public interface CategoryMapper {
	//상품카테고리 전체보기
	List<BooksCategory> findAll();

	void insert(BooksCategory cate);

}
