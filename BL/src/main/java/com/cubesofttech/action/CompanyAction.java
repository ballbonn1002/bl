package com.cubesofttech.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.hibernate.mapping.Array;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.CompanyDAO;
import com.cubesofttech.dao.Company_addressDAO;
import com.cubesofttech.dao.Company_contactDAO;
import com.cubesofttech.dao.Company_salesDAO;
import com.cubesofttech.dao.EmployeeDAO;
import com.cubesofttech.model.Company;
import com.cubesofttech.model.Company_address;
import com.cubesofttech.model.Company_contact;
import com.cubesofttech.model.Company_sales;
import com.cubesofttech.model.Employee;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.MD5;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class CompanyAction extends ActionSupport {
	
	 private static final Logger log = Logger.getLogger(PagemenuAction.class);
	 private static final long serialVersionUID = 1L;
	 
	 @Autowired
	    public CompanyDAO companyDAO;
	 
	 @Autowired
	    public Company_addressDAO company_addressDAO;
	 
	 @Autowired
	    public Company_contactDAO company_contactDAO;
	 
	 @Autowired
	    public Company_salesDAO company_salesDAO;
	 
	 @Autowired
	    public EmployeeDAO employeeDAO;
	 
	 HttpServletRequest request = ServletActionContext.getRequest();
	 HttpServletResponse response = ServletActionContext.getResponse();
	 
	 public String Companylist() {
		 try {
			 List<Company> companyList = companyDAO.findAll();
			 request.setAttribute("companyList", companyList);
			 return SUCCESS;
		 }catch(Exception e) {
			 log.debug(e);
			 return ERROR;
		 }
	 }
	 
	 public String CompanyDelete() {
		 try {
			 String id = request.getParameter("id");
			 log.debug(id);
			 Company company = new Company();
			 company = companyDAO.findById(id);
			 companyDAO.delete(company);
			 
			 List<Company> companyList = companyDAO.findAll();
			 request.setAttribute("companyList", companyList);
			 return SUCCESS;
		 }catch(Exception e) {
			 log.debug(e);
			 return ERROR;
		 }
	 }
	 
	 public String CheckboxCompanyList() {
		 try {
			 	Company company = new Company();
				String companyID = request.getParameter("CompanyID");
				company = companyDAO.findById(companyID);
				log.debug(company);
				String Isactive = request.getParameter("Isactive");
				log.debug(Isactive);
				company.setIs_active(Isactive);
				companyDAO.update(company);
				
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
		        String json = gson.toJson(company);
		        request.setAttribute("json", json);
				return SUCCESS;
			 
		 }catch(Exception e){
			log.debug(e);
			return ERROR;
		 }
	 }
	 
	 public String form_add() {
		 try {
			 Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
	    	 String loginUser = ur.getSys_user_id(); // Username login
			 String code = request.getParameter("code");
			 String tax = request.getParameter("tax");
			 String name_en = request.getParameter("name_en");
			 String name_th = request.getParameter("name_th");
			 String industry = request.getParameter("industry");
			 String status = request.getParameter("status");
			 String is_active = request.getParameter("is_active");
			 String website = request.getParameter("website");
			 
			 log.debug(code);
			 log.debug(tax);
			 log.debug(name_en);
			 log.debug(name_th);
			 log.debug(industry);
			 log.debug(status);
			 
			 if(is_active == null) {
				 is_active = "0";
			 }else {
				 is_active = "1";
			 }
			  
			 log.debug(is_active);
			 Company company = new Company();
			 company.setCompany_code(code);
			 company.setTax_number(tax);
			 company.setCompany_en(name_en);
			 company.setCompany_th(name_th);
			 company.setIndusty(industry);
			 company.setStatus(status);
			 company.setIs_active(is_active);
			 company.setWebsite(website);
			 company.setUser_create(loginUser);
			 company.setUser_update(loginUser);
			 company.setTime_create(DateUtil.getCurrentTime());
			 company.setTime_update(DateUtil.getCurrentTime());
			 companyDAO.save(company);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     String json = gson.toJson(company);
		     request.setAttribute("json", json);
			 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String EditCompany() {
		 try {
			 String id = request.getParameter("id");
			 log.debug(id);
			 Company company = new Company();
			 
			 company = companyDAO.findById(id);
			 request.setAttribute("company", company);
			 
			 List<Company_address>addressList = company_addressDAO.findByCompayny_id(id);
		 	 request.setAttribute("addressList", addressList);
		 	 
		 	 List<Company_contact>contactList = company_contactDAO.findByCompany_id(id);
		 	 request.setAttribute("contactList", contactList);
		 	 
		 	 List<Company_sales>salesList = company_salesDAO.findByCompany_id(id);
		 	 request.setAttribute("salesList", salesList);
		 	 
		 	 List<Employee>employeeList = employeeDAO.findAll();
		 	 request.setAttribute("employeeList", employeeList);
			 
			 return SUCCESS;
		 }catch(Exception e) {
			 log.debug(e);
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String add_address() {
		 try {
			 Company_address company_address = new Company_address();
			 Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
	    	 String loginUser = ur.getSys_user_id(); // Username login
			 String address_name = request.getParameter("address_name");
			 String address = request.getParameter("address");
			 String id = request.getParameter("id");
			 log.debug(address_name);
			 log.debug(address);
			 log.debug(id);
			 company_address.setCompany_id(id);
			 company_address.setAddress_name(address_name);
			 company_address.setAddress(address);
			 company_address.setUser_create(loginUser);
			 company_address.setUser_update(loginUser);
			 company_address.setTime_create(DateUtil.getCurrentTime());
			 company_address.setTime_update(DateUtil.getCurrentTime());
			 company_addressDAO.save(company_address);
		 	 
			 List<Company_address>addressList = company_addressDAO.findByCompayny_id(id);
		 	 request.setAttribute("addressList", addressList);
		 	 
		 	 List<Company_contact>contactList = company_contactDAO.findByCompany_id(id);
		 	 request.setAttribute("contactList", contactList);
		 	 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     String json = gson.toJson(company_address);
		     request.setAttribute("json", json); 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String add_contact() {
		 try {
			 	Company_contact contact = new Company_contact();
			 	Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
		    	String loginUser = ur.getSys_user_id(); // Username login
		    	String contact_name = request.getParameter("contact_name");
		    	String position = request.getParameter("position");
		    	String phone = request.getParameter("con_phone");
		    	String email = request.getParameter("con_email");
		    	String location = request.getParameter("add_location");
		    	String id = request.getParameter("id");
		    	
		    	log.debug(id);
		    	log.debug(contact_name);
		    	log.debug(position);
		    	log.debug(phone);
		    	log.debug(email);
		    	log.debug(location);
		    	
		    	contact.setCompany_id(id);
		    	contact.setContact_name(contact_name);
		    	contact.setPosition(position);
		    	contact.setPhone(phone);
		    	contact.setEmail(email);
		    	contact.setAddress_location(location);
		    	contact.setUser_create(loginUser);
		    	contact.setUser_update(loginUser);
		    	contact.setTime_create(DateUtil.getCurrentTime());
		    	contact.setTime_update(DateUtil.getCurrentTime());
		    	company_contactDAO.save(contact);
		    	
		    	List<Company_address>addressList = company_addressDAO.findByCompayny_id(id);
			 	request.setAttribute("addressList", addressList);
			 	
			 	List<Company_contact>contactList = company_contactDAO.findByCompany_id(id);
			 	request.setAttribute("contactList", contactList);
			 	
		    	Gson gson = new GsonBuilder().setPrettyPrinting().create();
			    String json = gson.toJson(contact);
			    request.setAttribute("json", json); 
			    
			 	return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String SelectAddressLocation() {
		 try {
			 String id = request.getParameter("id");
			 log.debug(id);
			 List<Company_address>addressList = company_addressDAO.findByCompayny_id(id);
			 log.debug(addressList);
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     String json = gson.toJson(addressList);
		     request.setAttribute("json", json); 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String Contact_delete() {
		 try {
			 String id = request.getParameter("id");
			 log.debug(id);
			 Company_contact contact = company_contactDAO.findById(id);
			 company_contactDAO.delete(contact);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     String json = gson.toJson(contact);
		     request.setAttribute("json", json); 
		 	 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String Address_delete() {
		 try {
			 String id = request.getParameter("id");
			 log.debug(id);
			 Company_address address = company_addressDAO.findById(id);
			 company_addressDAO.delete(address);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     String json = gson.toJson(address);
		     request.setAttribute("json", json); 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String add_sales() {
		 try {
			 Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
		     String loginUser = ur.getSys_user_id(); // Username login
			 String value = request.getParameter("value");
			 log.debug(value);
			 
			 JSONParser parser = new JSONParser();
			 JSONArray a = (JSONArray) parser.parse(value);
			 ArrayList<String> emp_idListarr = new ArrayList<String>();
			 ArrayList<String> com_idListarr = new ArrayList<String>();
			 ArrayList<String> name_enListarr = new ArrayList<String>();
			 ArrayList<String> name_thListarr = new ArrayList<String>();
			 ArrayList<String> phoneListarr = new ArrayList<String>();
			 ArrayList<String> emailListarr = new ArrayList<String>();
			 for (Object o : a) {
					JSONObject user = (JSONObject) o;
					emp_idListarr.add((String) user.get("employee_id"));
					com_idListarr.add((String) user.get("company_id"));
					name_enListarr.add((String) user.get("name_en"));
					name_thListarr.add((String) user.get("name_th"));
					phoneListarr.add((String) user.get("phone"));
					emailListarr.add((String) user.get("email"));
				}
				log.debug(emp_idListarr);
				List<String> idList = new ArrayList<String>();
				for(int i=0; i < emp_idListarr.size(); i++) {
					Company_sales sales = new Company_sales();
					sales.setEmployee_id(emp_idListarr.get(i));
					sales.setCompany_id(com_idListarr.get(i));
					sales.setName_en(name_enListarr.get(i));
					sales.setName_th(name_thListarr.get(i));
					sales.setEmail(emailListarr.get(i));
					sales.setPhone(phoneListarr.get(i));
					sales.setUser_create(loginUser);
					sales.setUser_update(loginUser);
					sales.setTime_create(DateUtil.getCurrentTime());
					sales.setTime_update(DateUtil.getCurrentTime());
					company_salesDAO.save(sales);
					log.debug(sales.getCompany_sales_id());
					idList.add(sales.getCompany_sales_id());
				}
				log.debug(idList);
				Gson gson = new GsonBuilder().setPrettyPrinting().create();
			     String json = gson.toJson(idList);
			     request.setAttribute("json", json); 
				
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String Sales_delete() {
		 try {
			 String id = request.getParameter("id");
			 log.debug(id);
			 Company_sales sales = company_salesDAO.findById(id);
			 company_salesDAO.delete(sales);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     String json = gson.toJson(sales);
		     request.setAttribute("json", json); 
			 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
}
