package me.thlshop.service;

import java.util.List;

import me.thlshop.dto.CategoryDTO;
import me.thlshop.entity.CategoryEntity;

public interface ICategoryService {
	List<CategoryEntity> findAll();
	CategoryEntity findOne(Integer categoryId);
	CategoryEntity findByName(String name);
	CategoryEntity insert(CategoryDTO categoryDTO);
	void update(CategoryDTO categoryDTO);
}
