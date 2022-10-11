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

import com.cubesofttech.model.Company_contact;
import com.cubesofttech.model.Company_sales;
import com.cubesofttech.model.Employee;

@Repository
public class Company_salesDAOImpl implements Company_salesDAO{

	@Autowired
	 private SessionFactory sessionFactory;

	@Override
	public void save(Company_sales company_sales) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(company_sales);
        session.flush();
		
	}

	@Override
	public void update(Company_sales company_sales) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(company_sales);
        session.flush();
		
	}

	@Override
	public void delete(Company_sales company_sales) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(company_sales);
        session.flush();
		
	}

	@Override
	public List<Company_sales> findByCompany_id(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Company_sales> companysalesList = null;
		try {
			String sql = " SELECT company_sales.* , file.path FROM company_sales \r\n"
					+ "LEFT JOIN employee ON company_sales.employee_id = employee.employee_id\r\n"
					+ "LEFT JOIN file ON file.file_id = employee.file_id\r\n"
					+ "where company_id = '"+id+"' order by employee_id; ;";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			companysalesList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return companysalesList;
	}
	
	@Override
	public List<Company_sales> findByCompany_sales_id(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Company_sales> companysalesList = null;
		try {
			String sql = " SELECT company_sales.* , file.path FROM company_sales \r\n"
					+ "LEFT JOIN employee ON company_sales.employee_id = employee.employee_id\r\n"
					+ "LEFT JOIN file ON file.file_id = employee.file_id\r\n"
					+ "where company_sales.company_sales_id = '"+id+"' order by employee_id; ;";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			companysalesList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return companysalesList;
	}

	@Override
	public Company_sales findById(Integer company_sales_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Company_sales companysalesList = null;
	    try {
	    	companysalesList = (Company_sales) session.get(Company_sales.class, company_sales_id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    }        
	    return companysalesList;
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer maxId = 0;

		try {

			Criteria criteria = session.createCriteria(Company_sales.class).setProjection(Projections.max("company_sales_id"));
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
