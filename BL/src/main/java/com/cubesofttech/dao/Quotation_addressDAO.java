package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Quotation_address;

public interface Quotation_addressDAO {
	
	public void save(Quotation_address quotation_address) throws Exception;
    
    public void update(Quotation_address quotation_address) throws Exception;
    
    public void delete(Quotation_address quotation_address) throws Exception;
    
    public List<Quotation_address> findAll() throws Exception;
    
    public Integer getMaxId() throws Exception;

}
