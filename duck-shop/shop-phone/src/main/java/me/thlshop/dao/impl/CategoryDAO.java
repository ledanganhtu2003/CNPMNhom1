package me.thlshop.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import me.thlshop.dao.ICategoryDAO;
import me.thlshop.entity.CategoryEntity;
import me.thlshop.utils.DBUtil;

public class CategoryDAO implements ICategoryDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<CategoryEntity> findAll() {
		Transaction transaction = null;
		List<CategoryEntity> list = null;
		String hql = "FROM CategoryEntity";
		try {
			Session session = DBUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery(hql);
			list = query.list();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public CategoryEntity findOne(Integer categoryId) {
		Transaction transaction = null;
		CategoryEntity categoryEntity = null;
		try {
			Session session = DBUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			categoryEntity = session.get(CategoryEntity.class, categoryId);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return categoryEntity;
	}

	@Override
	public CategoryEntity findByName(String name) {
		Transaction transaction = null;
		CategoryEntity entity = null;
		String hql = "FROM CategoryEntity e WHERE e.categoryName = :categoryName";
		try {
			Session session = DBUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			@SuppressWarnings("rawtypes")
			Query query = session.createQuery(hql);
			query.setParameter("categoryName", name);
			entity = (CategoryEntity) query.uniqueResult();
			transaction.commit();
			session.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return entity;
	}

	@Override
	public Integer insert(CategoryEntity categoryEntity) {
		Transaction transaction = null;
		try {
			Session session = DBUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			Integer id = (Integer) session.save(categoryEntity);
			transaction.commit();
			session.close();
			return id;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void update(CategoryEntity categoryEntity) {
		Transaction transaction = null;
		try {
			Session session = DBUtil.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			session.update(categoryEntity);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

}
