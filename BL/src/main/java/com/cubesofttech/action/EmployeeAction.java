package com.cubesofttech.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.EmployeeDAO;
import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.Employee;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(EmployeeAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	public EmployeeDAO employeeDAO;

	@Autowired
	private DepartmentDAO departmentDAO;

	@Autowired
	private PositionDAO positionDAO;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String DepartmentList = "departmentList";
 	public static final String PositionList = "positionList";
	public static String Employee = "employeeList";

	public String list() {
		try {
			List<Employee> employeeList = employeeDAO.findAllEmployee();
			request.setAttribute(Employee, employeeList);
			log.debug(employeeList);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String addEmployee() {
		try {
			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
			request.setAttribute("departmentList", departmentList);
			List<Map<String,Object>> positionList = positionDAO.sequense();
			request.setAttribute("positionList", positionList);
			return SUCCESS;
			
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String save_employ() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
    		String loginUser = ur.getSys_user_id(); // Username login
    		log.debug(ur);
    		
    		Employee employee = new Employee();
    		String gender = request.getParameter("Gender");
    		String titleEn = request.getParameter("titleEN");
    		String nameEn = request.getParameter("nameEN");
    		String nicknameEn = request.getParameter("nicknameEN");
    		String titleTh = request.getParameter("titleTH");
    		String nameTh = request.getParameter("nameTH");
    		String nicknameTh = request.getParameter("nicknameTH");
    		String idEmploy = request.getParameter("employID");
    		String departmentID = request.getParameter("user.departmentID");
    	    String positionID = request.getParameter("user.positionID");
    	    String email = request.getParameter("Email");
    	    String phone = request.getParameter("Phone");
    	    String phonee = phone.replace("-", "");
    	    String address = request.getParameter("Address");
    	    
    	    String isactive = request.getParameter("user_isactive");
    	    String date = request.getParameter("date");
    	    log.debug(date);
    	    
    	    Employee employ_check = employeeDAO.findById(idEmploy);
    	    log.debug(employ_check);
    	    if (employ_check == null) {
    	    	employee.setGender(gender);
    	    	employee.setTitle_name_en(titleEn);
    	    	employee.setName_en(nameEn);
    	    	employee.setNickname_en(nicknameEn);
    	    	
    	    	employee.setTitle_name_th(titleTh);
    	    	employee.setName_th(nameTh);
    	    	employee.setNickname_th(nicknameTh);
    	    	
    	    	employee.setEmployee_id(idEmploy);
    	    	employee.setDepartment_id(departmentID);
    	    	employee.setPosition_id(positionID);
    	    	employee.setEmail(email);
    	    	employee.setPhone(phonee);
    	    	employee.setAddress(address);
    	    	employee.setEnable(isactive);
    	    	
    	    	employee.setTime_create(DateUtil.getCurrentTime());
            	employee.setTime_update(DateUtil.getCurrentTime());
            	employeeDAO.save(employee);
            	
    	    } else {
    	    	request.setAttribute("flag", "1");
    	    	return INPUT;
    	    }
    	    
    	    employee = employeeDAO.findById(idEmploy);
    	    request.setAttribute("employeeList", employee);
    	    return SUCCESS;
    		
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String ChangeCheckBoxemploy() {
		try {
			Employee employee = new Employee();
			String idEmploy = request.getParameter("idEmploy");
			employee = employeeDAO.findById(idEmploy);
			log.debug(idEmploy);
			String Isactive = request.getParameter("Isactive");
			log.debug(Isactive);
			employee.setEnable(Isactive);
			employeeDAO.update(employee);
			
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(employee);
			request.setAttribute("json", json);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String edit_employ() {
		try {

			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getSys_user_id(); // Username login 
			String idEmploy = request.getParameter("employID");
			log.debug(idEmploy);

			List<Map<String, Object>> employeeList = employeeDAO.findByEmployee_id(idEmploy);
			request.setAttribute(Employee, employeeList);
			log.debug(employeeList);
			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
			request.setAttribute("departmentList", departmentList);
			List<Map<String,Object>> positionList = positionDAO.sequense();
			request.setAttribute("positionList", positionList);
			
			return SUCCESS;
			
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String deleteEmployee() {
		try {
			String idEmploy = request.getParameter("employID");
			log.debug(idEmploy);
			Employee employee = new Employee();

			employee = employeeDAO.findById(idEmploy);
			log.debug(employee);
			employeeDAO.delete(employee);
			List<Employee> employeeList = employeeDAO.findAll();
			request.setAttribute(Employee, employeeList);
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String updateEmployee() {
		try {
			String idEmploy = request.getParameter("Employee_id");
			log.debug(idEmploy);
			Employee employee = new Employee();
    		String gender = request.getParameter("Gender");
    		String titleEn = request.getParameter("titleEN");
    		String nameEn = request.getParameter("nameEN");
    		String nicknameEn = request.getParameter("nicknameEN");
    		String titleTh = request.getParameter("titleTH");
    		String nameTh = request.getParameter("nameTH");
    		String nicknameTh = request.getParameter("nicknameTH");
    		String departmentID = request.getParameter("user.departmentID");
    	    String positionID = request.getParameter("user.positionID");
    	    String email = request.getParameter("Email");
    	    String phone = request.getParameter("Phone");
    	    String phonee = phone.replace("-", "");
    	    String address = request.getParameter("Address");
    	    
    	    String isactive = request.getParameter("user_isactive");
    	    String date = request.getParameter("date");
			
    	    employee = employeeDAO.findById(idEmploy);
    	    
    	    employee.setGender(gender);
    	    employee.setTitle_name_en(titleEn);
    	    employee.setName_en(nameEn);
    	    employee.setNickname_en(nicknameEn);
    	    employee.setTitle_name_th(titleTh);
    	    employee.setName_th(nameTh);
    	    employee.setNickname_th(nicknameTh);
    	    employee.setDepartment_id(departmentID);
    	    employee.setPosition_id(positionID);
    	    employee.setEmail(email);
    	    employee.setPhone(phonee);
    	    employee.setAddress(address);
    	    employee.setEnable(isactive);
    	    employeeDAO.update(employee);
    	    
	    	
	    	employee.setTime_create(DateUtil.getCurrentTime());
        	employee.setTime_update(DateUtil.getCurrentTime());
    	    

			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
			request.setAttribute("departmentList", departmentList);
			List<Map<String,Object>> positionList = positionDAO.sequense();
			request.setAttribute("positionList", positionList);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String CheckDuplicateEmploy() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getSys_user_id(); // Username login 
			String idEmploy = request.getParameter("Employee_id");
			
			Employee employeeCheck =  employeeDAO.findById(idEmploy); // ทำการหา ID
			Map<String,String> flag = new HashMap<String, String>();
			
			
			
			if(employeeCheck != null){ // Check ว่า Id มีการซ้ำไหม ถ้าซ้ำ return input
				flag.put("flag", "1");
			}else {
				flag.put("flag", "0");
			}
			log.debug(flag);
			Gson gson = new Gson();
			String json = gson.toJson(flag); 
			request.setAttribute("json",json);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
}
