package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
			String sql = " SELECT * FROM company_sales where company_id = '"+id+"' order by employee_id ;";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			companysalesList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return companysalesList;
	}

	@Override
	public Company_sales findById(String company_sales_id) throws Exception {
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

}
