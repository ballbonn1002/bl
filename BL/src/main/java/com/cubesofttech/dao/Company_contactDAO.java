package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Company_contact;

public interface Company_contactDAO {

	public void save(Company_contact company_contact) throws Exception;
    
    public void update(Company_contact company_contact) throws Exception;
    
    public void delete(Company_contact company_contact) throws Exception;
    
    public List<Company_contact> findByCompany_id(String id) throws Exception;
    
    public Company_contact findById(String company_contact_id) throws Exception;
}
