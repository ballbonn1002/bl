package com.cubesofttech.action;

import java.io.File;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.CompanyDAO;
import com.cubesofttech.dao.Company_addressDAO;
import com.cubesofttech.dao.Company_contactDAO;
import com.cubesofttech.dao.Company_salesDAO;
import com.cubesofttech.dao.EmployeeDAO;
import com.cubesofttech.dao.FileuploadDAO;
import com.cubesofttech.model.Company;
import com.cubesofttech.model.Company_address;
import com.cubesofttech.model.Company_contact;
import com.cubesofttech.model.Company_sales;
import com.cubesofttech.model.Employee;
import com.cubesofttech.model.Fileupload;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class CompanyAction extends ActionSupport {
	
	 private static final Logger log = Logger.getLogger(CompanyAction.class);
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
	 
	 @Autowired
	 	public FileuploadDAO fileuploadDAO;
	 
	 HttpServletRequest request = ServletActionContext.getRequest();
	 HttpServletResponse response = ServletActionContext.getResponse();
	
	private Integer company_ID;
	public File fileUpload;
    private String fileUploadFileName;
	private String code;
	private String tax;
	private String name_en;
	private String name_th;
	private String industry;
	private String status;
	private String is_active;
	private String website;
	private String filesize;
	private String contact_title_name;
	private String contact_name;
	private String position;
	private String con_phone;
	private String con_email;
	private String add_location;
	
	
	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getCon_phone() {
		return con_phone;
	}

	public void setCon_phone(String con_phone) {
		this.con_phone = con_phone;
	}

	public String getCon_email() {
		return con_email;
	}

	public void setCon_email(String con_email) {
		this.con_email = con_email;
	}

	public String getAdd_location() {
		return add_location;
	}

	public void setAdd_location(String add_location) {
		this.add_location = add_location;
	}

	public String getContact_title_name() {
		return contact_title_name;
	}

	public void setContact_title_name(String contact_title_name) {
		this.contact_title_name = contact_title_name;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public Integer getCompany_ID() {
		return company_ID;
	}

	public void setCompany_ID(Integer company_ID) {
		this.company_ID = company_ID;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getName_en() {
		return name_en;
	}

	public void setName_en(String name_en) {
		this.name_en = name_en;
	}

	public String getName_th() {
		return name_th;
	}

	public void setName_th(String name_th) {
		this.name_th = name_th;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIs_active() {
		return is_active;
	}

	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	} 

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
			 Integer com_id = Integer.valueOf(id);
			 company = companyDAO.findById(com_id);
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
				String ID = request.getParameter("CompanyID");
				Integer com_id = Integer.valueOf(ID);
				company = companyDAO.findById(com_id);
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
			 log.debug(fileUpload);
			 Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
	    	 String loginUser = ur.getSys_user_id(); // Username login
	    	 Company company = new Company();
	    	 if(is_active == null) {
				 is_active = "0";
			 }else {
				 is_active = "1";
			 }
	    	 
	    if(fileUpload != null) {	 
	    	
		    	 Fileupload file = new Fileupload();
		    	 ServletContext context = request.getServletContext();
				 String fileServerPath = context.getRealPath("/");
				 double fileSize = Double.parseDouble(filesize);
				 String FileSize = FileUtil.getFileSize(fileSize);
				 String filename = fileUploadFileName;
				 int l = filename.length();
				 int split = filename.indexOf(".");
				 String name = filename.substring(0, split);
				 String type = (String) filename.subSequence(split, l);
				 int maxId = fileuploadDAO.getMaxId()+1;
				 FileUtil.upload(fileUpload, fileServerPath + "upload/company/", maxId + "_" + filename);
				 file.setFile_id(maxId);
				 file.setName(name);
				 file.setSize(FileSize);
				 file.setPath("/upload/company/" + maxId + "_" + filename);
				 file.setPage("company");
				 file.setType(type);
				 file.setUser_create(loginUser);
				 file.setUser_update(loginUser);
				 file.setTime_create(DateUtil.getCurrentTime());
				 file.setTime_update(DateUtil.getCurrentTime());
				 fileuploadDAO.save(file);
				 log.debug(file);
				 Integer f_id = file.getFile_id();
			
				 int maxid = companyDAO.getMaxId()+1;
				 company.setCompany_id(maxid);
				 company.setFile_id(f_id);
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
				 company_ID = company.getCompany_id();
				 
	    }else if(fileUpload == null) {
	    	
		        int maxid = companyDAO.getMaxId()+1;
		    	company.setCompany_id(maxid);
		    	company.setFile_id(null);
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
				company_ID = company.getCompany_id();
	    }
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String EditCompany() {
		 try {
			 String id = request.getParameter("id");
			 String com_id = String.valueOf(company_ID);
		if(id != null && company_ID == null) {	 
			 List<Company>company = companyDAO.findByCompany_ID(id);
			 request.setAttribute("company", company);
			 log.debug(company);
			 List<Company_address>addressList = company_addressDAO.findByCompayny_id(id);
		 	 request.setAttribute("addressList", addressList);
		 	 List<Company_contact>contactList = company_contactDAO.contactwithFile(id);
		 	 request.setAttribute("contactList", contactList);
		 	 List<Company_sales>salesList = company_salesDAO.findByCompany_id(id);
		 	 request.setAttribute("salesList", salesList); 	 
		}
		else if(company_ID != null) {
			 	List<Company>company = companyDAO.findByCompany_ID(com_id);
				request.setAttribute("company", company);
				List<Company_address>addressList = company_addressDAO.findByCompayny_id(com_id);
				request.setAttribute("addressList", addressList);
				List<Company_contact>contactList = company_contactDAO.contactwithFile(com_id);
				request.setAttribute("contactList", contactList);
				List<Company_sales>salesList = company_salesDAO.findByCompany_id(com_id);
				request.setAttribute("salesList", salesList);
		}
		
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
			 int maxId = company_addressDAO.getMaxId()+1;
			 company_address.setCompany_address_id(maxId);
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
				 Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			     String loginUser = ur.getSys_user_id(); // Username login
				 Fileupload file = new Fileupload();
		    	 ServletContext context = request.getServletContext();
				 String fileServerPath = context.getRealPath("/");
				 double fileSize = Double.parseDouble(filesize);
				 String FileSize = FileUtil.getFileSize(fileSize);;
				 String filename = fileUploadFileName;
				 int l = filename.length();
				 int split = filename.indexOf(".");
				 String name = filename.substring(0, split);
				 String type = (String) filename.subSequence(split, l);
				 int maxId = fileuploadDAO.getMaxId()+1;
				 FileUtil.upload(fileUpload, fileServerPath + "upload/company/", maxId + "_" + filename);
				 file.setFile_id(maxId);
				 file.setName(name);
				 file.setSize(FileSize);
				 file.setPage("company_contact");
				 file.setPath("/upload/company/" + maxId + "_" + filename);
				 file.setType(type);
				 file.setUser_create(loginUser);
				 file.setUser_update(loginUser);
				 file.setTime_create(DateUtil.getCurrentTime());
				 file.setTime_update(DateUtil.getCurrentTime());
				 fileuploadDAO.save(file);
				 log.debug(file);
				 Integer f_id = file.getFile_id();
			 
				Company_contact contact = new Company_contact();
				String com_id = String.valueOf(company_ID);
		    	log.debug(com_id);
		    	log.debug(fileUpload);
		    	log.debug(contact_title_name);
		    	log.debug(contact_name);
		    	log.debug(con_phone);
		    	log.debug(con_email);
		    	log.debug(position);
		    	log.debug(add_location);
		    	log.debug(filesize);
		    	log.debug(fileUploadFileName);
		    	int maxid = company_contactDAO.getMaxId()+1;
		    	contact.setCompany_contact_id(maxid);
		    	contact.setFile_id(f_id);
		    	contact.setCompany_id(company_ID);
		    	contact.setTitle_name_en(contact_title_name);
		    	contact.setContact_name(contact_name);
		    	contact.setPosition(position);
		    	contact.setPhone(con_phone);
		    	contact.setEmail(con_email);
		    	contact.setAddress_location(add_location);
		    	contact.setUser_create(loginUser);
		    	contact.setUser_update(loginUser);
		    	contact.setTime_create(DateUtil.getCurrentTime());
		    	contact.setTime_update(DateUtil.getCurrentTime()); 
		    	company_contactDAO.save(contact);
		    	
		    	List<Company_address>addressList = company_addressDAO.findByCompayny_id(com_id);
			 	request.setAttribute("addressList", addressList);
			 	
			 	List<Company_contact>contactList = company_contactDAO.contactwithFileById(com_id , f_id);
			 	log.debug(contactList);
			 	
		    	Gson gson = new GsonBuilder().setPrettyPrinting().create();
			    String json = gson.toJson(contactList);
			    request.setAttribute("json", json); 
			    log.debug(json);
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
			 String f_id = request.getParameter("file_id");
			 Integer file_id = Integer.parseInt(f_id);
			 Integer con_id = Integer.parseInt(id);
			 Company_contact contact = company_contactDAO.findById(con_id);
			 company_contactDAO.delete(contact);
			 Fileupload file = fileuploadDAO.findById(file_id);
			 fileuploadDAO.delete(file);
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     String json = gson.toJson("delete success");
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
			 Integer address_id = Integer.parseInt(id);
			 Company_address address = company_addressDAO.findById(address_id);
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
			 ArrayList<String> title_nameListarr = new ArrayList<String>();
			 ArrayList<String> phoneListarr = new ArrayList<String>();
			 ArrayList<String> emailListarr = new ArrayList<String>();
			 for (Object o : a) {
					JSONObject user = (JSONObject) o;
					emp_idListarr.add((String) user.get("employee_id"));
					com_idListarr.add((String) user.get("company_id"));
					name_enListarr.add((String) user.get("name_en"));
					title_nameListarr.add((String) user.get("title_name_en"));
					phoneListarr.add((String) user.get("phone"));
					emailListarr.add((String) user.get("email"));
				}
				log.debug(emp_idListarr);
				List<String> idList = new ArrayList<String>();
				for(int i=0; i < emp_idListarr.size(); i++) {
					Company_sales sales = new Company_sales();
					int maxId = company_salesDAO.getMaxId()+1;
					sales.setCompany_sales_id(maxId);
					sales.setEmployee_id(emp_idListarr.get(i));
					sales.setCompany_id(com_idListarr.get(i));
					sales.setName_en(name_enListarr.get(i));
					sales.setTitle_name_en(title_nameListarr.get(i));
					sales.setEmail(emailListarr.get(i));
					sales.setPhone(phoneListarr.get(i));
					sales.setUser_create(loginUser);
					sales.setUser_update(loginUser);
					sales.setTime_create(DateUtil.getCurrentTime());
					sales.setTime_update(DateUtil.getCurrentTime());
					company_salesDAO.save(sales);
					log.debug(sales.getCompany_sales_id());
					String sales_id = String.valueOf(sales.getCompany_sales_id());
					idList.add(sales_id);
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
			 Integer sales_id = Integer.parseInt(id);
			 Company_sales sales = company_salesDAO.findById(sales_id);
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
	 
	 public String update_information() {
		 try {
			 log.debug(fileUpload);
			 log.debug(filesize);
			 Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
		     String loginUser = ur.getSys_user_id(); // Username login
			 Company company = companyDAO.findById(company_ID);
			 log.debug(company.getFile_id());
			 if(is_active == null) {
				 is_active = "0";
			 }else {
				 is_active = "1";
			 }
			 
			 if(company.getFile_id() != null) {	
					 if(fileUpload == null && fileUploadFileName == null && filesize == "") {
						 company.setFile_id(company.getFile_id());
						 company.setCompany_en(name_en);
						 company.setCompany_th(name_th);
						 company.setIndusty(industry);
						 company.setCompany_code(code);
						 company.setStatus(status);
						 company.setIs_active(is_active);
						 company.setTax_number(tax);
						 company.setWebsite(website);
						 company.setUser_update(loginUser);
						 company.setTime_update(DateUtil.getCurrentTime());
						 companyDAO.update(company);

					 }else if(fileUpload != null && fileUploadFileName != null && filesize != ""){
						 Fileupload file = fileuploadDAO.findById(company.getFile_id());
						 log.debug(file);
				    	 ServletContext context = request.getServletContext();
						 String fileServerPath = context.getRealPath("/");
						 double fileSize = Double.parseDouble(filesize);
						 String FileSize = FileUtil.getFileSize(fileSize);;
						 String filename = fileUploadFileName;
						 int l = filename.length();
						 int split = filename.indexOf(".");
						 String name = filename.substring(0, split);
						 String type = (String) filename.subSequence(split, l);
						 FileUtil.upload(fileUpload, fileServerPath + "upload/company/", company.getFile_id() + "_" + filename);
						 file.setName(name);
						 file.setPage("company");
						 file.setSize(FileSize);
						 file.setPath("/upload/company/" + company.getFile_id() + "_" + filename);
						 file.setType(type);
						 file.setUser_update(loginUser);
						 file.setTime_update(DateUtil.getCurrentTime());
						 fileuploadDAO.update(file);
						 log.debug(file);
						 Integer id = file.getFile_id();
						 
						 company.setFile_id(id);
						 company.setUser_update(loginUser);
						 company.setTime_update(DateUtil.getCurrentTime());
						 companyDAO.update(company); 
					 }
			 }else if(company.getFile_id() == null) {
			    	 Fileupload files = new Fileupload();
			    	 ServletContext context = request.getServletContext();
					 String fileServerPath = context.getRealPath("/");
					 double fileSize = Double.parseDouble(filesize);
					 String FileSize = FileUtil.getFileSize(fileSize);;
					 String filename = fileUploadFileName;
					 int l = filename.length();
					 int split = filename.indexOf(".");
					 String name = filename.substring(0, split);
					 String type = (String) filename.subSequence(split, l);
					 int maxId = fileuploadDAO.getMaxId()+1;
					 FileUtil.upload(fileUpload, fileServerPath + "upload/company/", maxId + "_" + filename);
					 files.setFile_id(maxId);
					 files.setName(name);
					 files.setSize(FileSize);
					 files.setPage("company");
					 files.setPath("/upload/company/" + maxId + "_" + filename);
					 files.setType(type);
					 files.setUser_create(loginUser);
					 files.setUser_update(loginUser);
					 files.setTime_create(DateUtil.getCurrentTime());
					 files.setTime_update(DateUtil.getCurrentTime());
					 fileuploadDAO.save(files);
					 log.debug(files);
					 Integer f_id = files.getFile_id();
					 log.debug(f_id);
					 
					 company.setFile_id(f_id);
					 company.setCompany_code(code);
					 company.setTax_number(tax);
					 company.setCompany_en(name_en);
					 company.setCompany_th(name_th);
					 company.setIndusty(industry);
					 company.setStatus(status);
					 company.setIs_active(is_active);
					 company.setWebsite(website);
					 company.setUser_update(loginUser);
					 company.setTime_update(DateUtil.getCurrentTime());
					 companyDAO.update(company);
					 log.debug(company);
				 }
			 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
	 
	 public String Delete_image() {
		 try {
			 Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
		     String loginUser = ur.getSys_user_id(); // Username login
			 String f_id = request.getParameter("file_id");
			 String c_id = request.getParameter("company_id");
			 Integer fi_id = Integer.parseInt(f_id);
			 Fileupload file_id = fileuploadDAO.findById(fi_id);
			 fileuploadDAO.delete(file_id);
			 Integer com_id = Integer.parseInt(c_id);
			 Company company = companyDAO.findById(com_id);
			 company.setFile_id(null);
			 company.setUser_update(loginUser);
			 company.setTime_update(DateUtil.getCurrentTime());
			 companyDAO.update(company);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
		     String json = gson.toJson("SUCCESS");
		     request.setAttribute("json", json); 
			 
			 return SUCCESS;
		 }catch(Exception e) {
			 e.printStackTrace();
			 return ERROR;
		 }
	 }
}
