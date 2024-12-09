package me.thlshop.dao;

import java.util.List;

import me.thlshop.entity.CategoryEntity;

public interface ICategoryDAO {
	List<CategoryEntity> findAll();
	CategoryEntity findOne(Integer categoryId);
	CategoryEntity findByName(String name);
	Integer insert(CategoryEntity categoryEntity);
	void update(CategoryEntity categoryEntity);
}
