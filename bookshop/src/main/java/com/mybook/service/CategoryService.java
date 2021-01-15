package com.mybook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mybook.dto.BooksCategory;
import com.mybook.dto.MemberDTO;
import com.mybook.repository.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;
	public List<BooksCategory> findAll() {
		return categoryRepository.findAll();
	}
	public void insert(BooksCategory cate) {
		categoryRepository.insert(cate);
		
	}
	public void delete(String cateCode) {
		categoryRepository.delete(cateCode);
	}

}
