package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Order;
import com.cubesofttech.model.Permission;


@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public void save(Order order) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(order);
        session.flush();
        
		
	}

	@Override
	public void update(Order order) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(order);
        session.flush();
		
	}

	@Override
	public void delete(Order order) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(order);
        session.flush();
		
	}

	@Override
	public List<Order> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Order> order = null;
		try {
			order = session.createCriteria(Order.class).list();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer maxId = 0;

		try {

			Criteria criteria = session.createCriteria(Order.class).setProjection(Projections.max("id"));
			maxId = (Integer) criteria.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			return new Integer(0);

		} finally {

		}
		if (maxId != null) {
			return maxId;
		} else {
			return new Integer(0);
		}
	}

	@Override
	public List<Order> deleteByQuotationId(String quotation_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Order> orderList = null;
		try {
			String sql = "DELETE FROM quotation_order WHERE quotation_id='"+quotation_id+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderList;
	}

}