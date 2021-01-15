package com.mybook.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mybook.dto.BooksCategory;
import com.mybook.dto.MemberDTO;
import com.mybook.mapper.CategoryMapper;

@Repository
public class CategoryRepository {
	@Autowired
	private CategoryMapper categoryMapper;
	
	public List<BooksCategory> findAll() {
		return categoryMapper.findAll();
	}

	public void insert(BooksCategory cate) {
		categoryMapper.insert(cate);
		
	}
	
	public void delete(String cateCode) {
		categoryMapper.delete(cateCode);
	}

}
