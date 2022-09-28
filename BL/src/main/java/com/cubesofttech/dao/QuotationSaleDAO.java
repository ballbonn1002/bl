package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.QuotationSale;



public interface QuotationSaleDAO {
	public void save(QuotationSale quotation_sale) throws Exception;
	
	public void update(QuotationSale quotation_sale) throws Exception;
	
	public void delete(QuotationSale quotation_sale) throws Exception;
	
	public List<QuotationSale> findAll() throws Exception;
	
	public Integer getMaxId() throws Exception;
	
	public List<QuotationSale> deleteByQuotationId(String quotation_id) throws Exception;

}
