package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cubesofttech.model.Company;

@Repository
public class CompanyDAOImpl implements CompanyDAO{

	 @Autowired
	 private SessionFactory sessionFactory;

	@Override
	public void save(Company company) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(company);
        session.flush();
	}
	@Override
	public void update(Company company) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(company);
        session.flush();
		
	}

	@Override
	public void delete(Company company) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(company);
        session.flush();
		
	}
	@Override
	public List<Company> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Company> companyList = null;
		try {
			String sql = " SELECT * FROM company order by company_id ;";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			companyList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return companyList;
	}
	@Override
	public Company findById(String company_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
	    Company company = null;
	    try {
	        company = (Company) session.get(Company.class, company_id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    }        
	    return company;
	}

}