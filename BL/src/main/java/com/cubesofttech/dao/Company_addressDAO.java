package com.cubesofttech.dao;

import java.util.List;
import com.cubesofttech.model.Company_address;

public interface Company_addressDAO {

	public void save(Company_address company_address) throws Exception;
    
    public void update(Company_address company_address) throws Exception;
    
    public void delete(Company_address company_address) throws Exception;
    
    Integer getMaxId() throws Exception;
    
    public  List<Company_address> findByCompayny_id(String id) throws Exception;
    
    public Company_address findById(Integer company_address_id) throws Exception;
}
