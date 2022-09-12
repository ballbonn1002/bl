package com.cubesofttech.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.CompanyDAO;
import com.cubesofttech.model.Company;
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
	 
	 private String company_id;
	 
	 	public String getComapny_id() {
			return company_id;
		}

		public void setCompany_id(String company_id) {
			this.company_id = company_id;
		}
	 
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
			 log.debug(company);
			 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
}
