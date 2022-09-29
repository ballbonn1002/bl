package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cubesofttech.model.Quotation;
import com.cubesofttech.model.Sys_role;

@Repository
public class QuotationDAOImpl implements QuotationDAO{
	
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public void save(Quotation quotation) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(quotation);
        session.flush();
		
	}

	@Override
	public void update(Quotation quotation) throws Exception {
		 Session session = this.sessionFactory.getCurrentSession();
	        session.clear();
	        session.update(quotation);
	        session.flush();
		
	}

	@Override
	public void delete(Quotation quotation) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(quotation);
        session.flush();
        //session.close();
		
	}

	@Override
	public List<Quotation> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Quotation> quotation = null;
		try {
			quotation = session.createCriteria(Quotation.class).list();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return quotation;
	}

	@Override
	public List<Quotation> listQuotation() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Quotation> quotationList = null;
		try {
			String sql = "SELECT quotation_id, company_name, DATE(time_create) AS create_date, end_date, quotation_status, saleperson \r\n"
						 + "FROM `quotation`;";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			quotationList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return quotationList;
	}

	@Override
	public Quotation findById(String quotation_id) throws Exception {
		 Session session = this.sessionFactory.getCurrentSession();
	        Quotation quotation = null;
	        try {
	        	quotation = (Quotation) session.get(Quotation.class, quotation_id);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally{
	            //session.close();
	        }        
	        return quotation;
	}

}
