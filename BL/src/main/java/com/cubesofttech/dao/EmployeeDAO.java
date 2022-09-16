package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Employee;

public interface EmployeeDAO {

public void save(Employee employee) throws Exception;
    
    public void update(Employee employee) throws Exception;
    
    public void delete(Employee employee) throws Exception;
    
    public List<Employee> findByEmployee_id(String id) throws Exception;
    
    public List<Employee> findAll() throws Exception;
    
    public Employee findById(String employee_id) throws Exception;
}
