package me.thlshop.service.impl;

import java.util.List;

import javax.inject.Inject;

import me.thlshop.dao.ICategoryDAO;
import me.thlshop.dto.CategoryDTO;
import me.thlshop.entity.CategoryEntity;
import me.thlshop.service.ICategoryService;

public class CategoryService implements ICategoryService {

    @Inject
    private ICategoryDAO categoryDAO;

    @Override
    public List<CategoryEntity> findAll() {
        return categoryDAO.findAll();
    }

    @Override
    public CategoryEntity findOne(Integer categoryId) {
        return categoryDAO.findOne(categoryId);
    }

    @Override
    public CategoryEntity findByName(String name) {
        return categoryDAO.findByName(name);
    }

    @Override
    public CategoryEntity insert(CategoryDTO categoryDTO) {
        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity.setCategoryId(categoryDTO.getCategoryId());
        categoryEntity.setCategoryName(categoryDTO.getCategoryName());
        Integer id = categoryDAO.insert(categoryEntity);
        return categoryDAO.findOne(id);
    }

    @Override
    public void update(CategoryDTO categoryDTO) {
        CategoryEntity categoryEntity = new CategoryEntity();
        categoryEntity.setCategoryId(categoryDTO.getCategoryId());
        categoryEntity.setCategoryName(categoryDTO.getCategoryName());
        categoryDAO.update(categoryEntity);
    }

}
