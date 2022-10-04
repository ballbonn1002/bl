package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Quotation_address;

public interface Quotation_addressDAO {
	
	public void save(Quotation_address quotation_address) throws Exception;
    
    public void update(Quotation_address quotation_address) throws Exception;
    
    public void delete(Quotation_address quotation_address) throws Exception;
    
    public List<Quotation_address> findAll() throws Exception;
    
    public Integer getMaxId() throws Exception;
    
    public List<Quotation_address> findByQuotationId(String id) throws Exception;
    
    public List<Quotation_address> deleteByQuotationId(String quotation_id) throws Exception;
    
    public Quotation_address findById(Integer id) throws Exception;

}
