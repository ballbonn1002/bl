package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Company;

public interface CompanyDAO {
	
    public void save(Company company) throws Exception;
    
    public void update(Company company) throws Exception;
    
    public void delete(Company company) throws Exception;
    
    Integer getMaxId() throws Exception;
    
    public List<Company> findAll() throws Exception;
    
    public List<Company> findByCompany_ID(String id) throws Exception;
    
    public Company findById(String company_id) throws Exception;
    
    public List<Company> findAllCompany() throws Exception;
    
}
