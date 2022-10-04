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
import com.cubesofttech.model.Company_address;
import com.cubesofttech.model.Company_contact;

@Repository
public class Company_addressDAOImpl implements Company_addressDAO{
	
	 @Autowired
	 private SessionFactory sessionFactory;

	@Override
	public void save(Company_address company_address) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(company_address);
        session.flush();
		
	}

	@Override
	public void update(Company_address company_address) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(company_address);
        session.flush();
		
	}

	@Override
	public void delete(Company_address company_address) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(company_address);
        session.flush();
		
	}

	@Override
	public List<Company_address> findByCompayny_id(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Company_address> company_addressList = null;
		try {
			String sql = " SELECT * FROM company_address where company_id = '"+id+"' order by company_address_id ;";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			company_addressList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return company_addressList;
	}

	@Override
	public Company_address findById(Integer company_address_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Company_address company_address = null;
	    try {
	    	company_address = (Company_address) session.get(Company_address.class, company_address_id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    }        
	    return company_address;
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer maxId = 0;

		try {

			Criteria criteria = session.createCriteria(Company_address.class).setProjection(Projections.max("company_address_id"));
			maxId = (Integer) criteria.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			maxId = new Integer(0);

		} finally {

		}
		if (maxId != null) {
			return maxId;
		} else {
			return new Integer(0);
		}
	}
}
