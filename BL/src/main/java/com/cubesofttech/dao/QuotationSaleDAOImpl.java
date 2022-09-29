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
import com.cubesofttech.model.QuotationSale;

@Repository
public class QuotationSaleDAOImpl implements QuotationSaleDAO {
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public void save(QuotationSale quotation_sale) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(quotation_sale);
        session.flush();
        
		
	}

	@Override
	public void update(QuotationSale quotation_sale) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(quotation_sale);
        session.flush();
		
	}

	@Override
	public void delete(QuotationSale quotation_sale) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(quotation_sale);
        session.flush();
		
	}

	@Override
	public List<QuotationSale> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<QuotationSale> quotation_sale = null;
		try {
			quotation_sale = session.createCriteria(QuotationSale.class).list();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return quotation_sale;
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer maxId = 0;

		try {

			Criteria criteria = session.createCriteria(QuotationSale.class).setProjection(Projections.max("id"));
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
	public List<QuotationSale> deleteByQuotationId(String quotation_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<QuotationSale> saleList = null;
		try {
			String sql = "DELETE FROM quotation_sale WHERE quotation_id='"+quotation_id+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return saleList;
	}

}
