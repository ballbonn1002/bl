package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import com.cubesofttech.model.Employee;

public interface EmployeeDAO {

public void save(Employee employee) throws Exception;
    
    public void update(Employee employee) throws Exception;
    
    public void delete(Employee employee) throws Exception;
    
    Integer getMaxId() throws Exception;
    
    public List<Map<String, Object>> findByEmployee_id(String id) throws Exception;
    
    public List<Employee> findAll() throws Exception;
    public List<Employee> findAllEmployee() throws Exception;
    
    public List<Employee> findNotInCompany_Sales(String id) throws Exception;
    
    public Employee findById(String employee_id) throws Exception;
}
