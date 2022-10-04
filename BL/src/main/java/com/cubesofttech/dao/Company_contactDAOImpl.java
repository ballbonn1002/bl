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

import com.cubesofttech.model.Company;
import com.cubesofttech.model.Company_address;
import com.cubesofttech.model.Company_contact;
import com.cubesofttech.model.Fileupload;

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
	public Company_contact findById(Integer company_contact_id) throws Exception {
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

	@Override
	public List<Company_contact> contactwithFile(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Company_contact> company_contactList = null;
		try {
			String sql = " select company_contact.* , file.path \r\n"
					+ "FROM company_contact\r\n"
					+ "LEFT JOIN file ON company_contact.file_id = file.file_id\r\n"
					+ "WHERE company_contact.company_id = '"+id+"'";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			company_contactList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return company_contactList;
	}

	@Override
	public List<Company_contact> contactwithFileById(String id , Integer file_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Company_contact> company_contactList = null;
		try {
			String sql = " select company_contact.* , file.path \r\n"
					+ "FROM company_contact\r\n"
					+ "LEFT JOIN file ON company_contact.file_id = file.file_id\r\n"
					+ "WHERE company_contact.company_id = '"+id+"'  AND company_contact.file_id = '"+file_id+"'";
					
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			company_contactList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return company_contactList;
	}

	@Override
	public Integer getMaxId() throws Exception {
			Session session = this.sessionFactory.getCurrentSession();
			Integer maxId = 0;

			try {

				Criteria criteria = session.createCriteria(Company_contact.class).setProjection(Projections.max("company_contact_id"));
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
