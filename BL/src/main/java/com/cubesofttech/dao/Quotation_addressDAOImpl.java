package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Order;
import com.cubesofttech.model.Quotation;
import com.cubesofttech.model.Quotation_address;

@Repository
public class Quotation_addressDAOImpl implements Quotation_addressDAO{

	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public void save(Quotation_address quotation_address) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(quotation_address);
        session.flush();
		
	}

	@Override
	public void update(Quotation_address quotation_address) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(quotation_address);
        session.flush();
		
	}

	@Override
	public void delete(Quotation_address quotation_address) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(quotation_address);
        session.flush();
        //session.close();
		
	}

	@Override
	public List<Quotation_address> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Quotation_address> quotation_address = null;
		try {
			quotation_address = session.createCriteria(Quotation_address.class).list();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return quotation_address;
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer maxId = 0;

		try {

			Criteria criteria = session.createCriteria(Quotation_address.class).setProjection(Projections.max("id"));
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

}
