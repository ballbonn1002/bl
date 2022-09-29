package com.cubesofttech.dao;

import java.util.List;


import com.cubesofttech.model.Quotation;

public interface QuotationDAO {
	public void save(Quotation quotation) throws Exception;
	
	public void update(Quotation quotation) throws Exception;
	
	public void delete(Quotation quotation) throws Exception;
	
	public List<Quotation> findAll() throws Exception;
	
	public List<Quotation> listQuotation() throws Exception; 
	
	public Quotation findById(String quotation_id) throws Exception;

}
