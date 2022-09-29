package com.cubesofttech.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cubesofttech.model.Employee;
import com.cubesofttech.model.Position;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO{

	@Autowired
	 private SessionFactory sessionFactory;

	@Override
	public void save(Employee employee) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.save(employee);
        session.flush();
		
	}

	@Override
	public void update(Employee employee) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.update(employee);
        session.flush();
		
	}

	@Override
	public void delete(Employee employee) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(employee);
        session.flush();
		
	}

	@Override
	public List<Map<String, Object>> findByEmployee_id(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>>  employeeList = null;
		try {
			String sql = " SELECT * FROM employee WHERE employee_id = '"+id+"' ";
					
			SQLQuery query = session.createSQLQuery(sql);

			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			employeeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employeeList;
	}

	@Override
	public Employee findById(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Employee employee = null;
	    try {
	    	employee = (Employee) session.get(Employee.class, id);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	    }        
	    return employee;
	}

	@Override
	public List<Employee> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Employee> employeeList = null;
		try {
			String sql = "SELECT * FROM employee where enable = '1';" ;  
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			employeeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employeeList;
	}
	@Override
	public List<Employee> findAllEmployee() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Employee> employee = null;
		try {
			String sql = " SELECT * FROM employee";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			employee = query.list();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return employee;
	}

	@Override
	public List<Employee> findNotInCompany_Sales(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Employee> employeeList = null;
		try {
			String sql = "SELECT employee.* , company.company_id FROM employee \r\n"
					+ "			JOIN company WHERE employee_id NOT IN \r\n"
					+ "			(SELECT employee_id FROM company_sales WHERE company_id = '"+id+"')\r\n"
					+ "			GROUP BY employee.employee_id;" ;  
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			employeeList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return employeeList;
	}
	
}
