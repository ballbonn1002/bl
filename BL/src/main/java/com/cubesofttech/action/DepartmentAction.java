package com.cubesofttech.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;


public class DepartmentAction extends ActionSupport {
	private static final Logger log = Logger.getLogger(DepartmentAction.class);
	private static final long serialVersionUID = 1L;
	
	@Autowired
	public DepartmentDAO departmentDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Department = "departmentList";
	
	public String list() {
		try {
			List<Department> departmentList = departmentDAO.findAll();
			log.debug(departmentList);
			request.setAttribute(Department, departmentList);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	public String saveDepartment() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser");
			log.debug(ur);
			String logonUser = ur.getSys_user_id();
			
			Department depart = new Department();
			String idDepart = request.getParameter("ID");
			log.debug(idDepart);
			String name		= request.getParameter("name");
			log.debug(name);
			String descrip	= request.getParameter("description");
			String prefix	= request.getParameter("prefix_id");
			
			String date		= request.getParameter("date");
			
			Department departmentCheck = departmentDAO.findById(idDepart);
			if ( departmentCheck == null ) {
				depart.setTimeCreate(DateUtil.getCurrentTime());
				depart.setTimeUpdate(DateUtil.getCurrentTime());
				depart.setDepartment_id(idDepart);
				depart.setName(name);
				depart.setUsercreate(logonUser);
				depart.setDescription(descrip);
				depart.setPrefix_id(prefix);
				
				departmentDAO.save(depart);
			} else {
				request.setAttribute("flag", "1");
				return INPUT;
			}
			
			List<Department> departmentList = departmentDAO.findAll();
			request.setAttribute(Department, departmentList);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	
	public String deleteDepartment() {
		try {
			String idDepart = request.getParameter("ID");
			log.debug(idDepart);
			Department depart = new Department();
			
			depart = departmentDAO.findById(idDepart);
			departmentDAO.delete(depart);
			List<Department> departmentList = departmentDAO.findAll();
			request.setAttribute(Department, departmentList);
			return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
	public String updateDepartment(){
		try{
			String idDepart = request.getParameter("ID");
			log.debug(idDepart);
			Department departmentList = new Department();
			departmentList = departmentDAO.findById(idDepart);
			request.setAttribute(Department, departmentList);  
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	public String addDepartment() {
		try {
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
	public String CheckDuplicateDepart() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getSys_user_id(); // Username login 
			String idDepart = request.getParameter("ID");
			
			Department departmentCheck =  departmentDAO.findById(idDepart); // ทำการหา ID
			Map<String,String> flag = new HashMap<String, String>();
			
			
			
			if(departmentCheck != null){ // Check ว่า Id มีการซ้ำไหม ถ้าซ้ำ return input
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
	
//	public String CheckDuplicateDepart() {
//		try {
//			String id = request.getParameter("ID");
//			Map<String, String> obj = new HashMap<>();
//			List<Map<String, Object>> sysuser = departmentDAO.findById(idDepart);
//			log.debug(idDepart);
//			String s = idDepart.toString();
//			if(s.equals(obj))
//		}
//	}
	
	public String editDepartment(){
		
		try{
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			String logonUser = ur.getSys_user_id(); // Username login 
			
			Department depart = new Department();
			String idDepart = request.getParameter("ID");
			depart = departmentDAO.findById(idDepart);
			
//			à¸ªà¹ˆà¸§à¸™à¸‚à¸­à¸‡ GET PARAMETER
			log.debug(idDepart);
			String name		= request.getParameter("name");
			log.debug(name);
			String descrip	= request.getParameter("description");
			log.debug(descrip);
			String prefix	= request.getParameter("prefix_id");
			log.debug(prefix);
			String date		= request.getParameter("date");
//			String time = request.getParameter("time");

			//Timestamp ts = DateUtil.dateToTimestamp(date, time);
			
			depart.setUserupdate(logonUser);
			depart.setName(name);
			depart.setDescription(descrip);
			depart.setPrefix_id(prefix);
			//depart.setTimeUpdate(ts);
			
			departmentDAO.update(depart);
			
			List<Department> departmentList = departmentDAO.findAll();
			request.setAttribute(Department, departmentList);
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}

//		
//		try{
//			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
//			String logonUser = ur.getSys_user_id(); // Username login 
//			
//			Department depart = new Department();
//			String idDepart = request.getParameter("ID");
//			depart = departmentDAO.findById(idDepart);
//			log.debug(idDepart);
//			
////			ส่วนของ GET PARAMETER
//			
//			
//			String name = request.getParameter("name");
//			String deptdes = request.getParameter("description");
//			String prefixId = request.getParameter("prefix_id");
//			
//			String date = request.getParameter("date");
////			String time = request.getParameter("time");
////
////			Timestamp ts = DateUtil.dateToTimestamp(date, time);
//			
//			depart.setUserupdate(logonUser);
//			depart.setName(name);
//			depart.setDescription(deptdes);
//			depart.setPrefix_id(prefixId);
////			depart.setTimeUpdate(ts);
//			
//			departmentDAO.update(depart);
//			
//			List<Department> departmentList = departmentDAO.findAll();
//			request.setAttribute(Department, departmentList);
//			
//			return SUCCESS;
//		}catch (Exception e){
//			
//			return ERROR;
//		}
//	}
//	
	
	
//	public String editDepartment(){
//		try{
//			Department depart = new Department();
//			String idDepart = request.getParameter("ID");
//	
//			log.debug(idDepart);	
//			departmentDAO.update(depart);
//			List<Department> departmentList = departmentDAO.findAll();
//			request.setAttribute(Department, departmentList);
//	
//			return SUCCESS;
//		}catch (Exception e){
//			e.printStackTrace();
//			return ERROR;
//		}
//	
//	}
}

