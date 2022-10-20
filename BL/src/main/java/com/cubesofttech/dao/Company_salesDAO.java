package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Company_sales;

public interface Company_salesDAO {

	public void save(Company_sales company_sales) throws Exception;
    
    public void update(Company_sales company_sales) throws Exception;
    
    public void delete(Company_sales company_sales) throws Exception;
    
    Integer getMaxId() throws Exception;
    
    public List<Company_sales> findByCompany_id(String id) throws Exception;
    
    public Company_sales findById(Integer company_sales_id) throws Exception;
    
    
}
