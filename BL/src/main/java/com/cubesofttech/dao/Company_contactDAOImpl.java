package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Company;
import com.cubesofttech.model.Company_address;
import com.cubesofttech.model.Company_contact;

@Repository
public class Company_contactDAOImpl implements Company_contactDAO{
	
	 @Autowired
	 private SessionFactory sessionFactory;
	 
	@Override
	public void save(Company_contact company_contact) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(company_contact);
        session.flush();
		
	}

	@Override
	public void update(Company_contact company_contact) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(company_contact);
        session.flush();
		
	}

	@Override
	public void delete(Company_contact company_contact) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(company_contact);
        session.flush();
		
	}

	@Override
	public List<Company_contact> findByCompany_id(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Company_contact> company_contactList = null;
		try {
			String sql = " SELECT * FROM company_contact where company_id = '"+id+"' order by company_contact_id ;";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			company_contactList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return company_contactList;
	}

	@Override
	public Company_contact findById(String company_contact_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
	    Company_contact company_contact = null;
	    try {
	    	company_contact = (Company_contact) session.get(Company_contact.class, company_contact_id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    }        
	    return company_contact;
	}

}
