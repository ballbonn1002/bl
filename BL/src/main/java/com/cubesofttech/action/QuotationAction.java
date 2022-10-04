package com.cubesofttech.action;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.cubesofttech.dao.EmployeeDAO;
import com.cubesofttech.dao.OrderDAO;
import com.cubesofttech.dao.QuotationDAO;
import com.cubesofttech.dao.Quotation_addressDAO;
import com.cubesofttech.model.Company;
import com.cubesofttech.model.Company_address;
import com.cubesofttech.model.Company_contact;
import com.cubesofttech.model.Employee;
import com.cubesofttech.model.Order;
import com.cubesofttech.model.Quotation;
import com.cubesofttech.model.Quotation_address;
import com.cubesofttech.model.Sys_role;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class QuotationAction extends ActionSupport{
	private static final Logger log = Logger.getLogger(QuotationAction.class);
	private static final long serialVersionUID = 1L;
	
	@Autowired
	public QuotationDAO quotationDAO;
	
	@Autowired
	public OrderDAO orderDAO;
	
	@Autowired
	public CompanyDAO companyDAO;
	
	@Autowired
	public Company_contactDAO company_contactDAO;
	
	@Autowired
	public Company_addressDAO company_addressDAO;
	
	@Autowired
	public EmployeeDAO employeeDAO;
	
	@Autowired
	public Quotation_addressDAO quotation_addressDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public String listQuotation() {
		try {
			List<Quotation> quotationList = quotationDAO.listQuotation();
			log.debug(quotationList);
			request.setAttribute("quotationList", quotationList);
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String delelteQuotation() {
		try {
			String id = request.getParameter("quotation_id");
			log.debug(id);
			
			Quotation quotation = quotationDAO.findById(id);
			//log.debug(quotation);
			quotationDAO.delete(quotation);
			orderDAO.deleteByQuotationId(id);
			quotation_addressDAO.deleteByQuotationId(id);
			
			List<Quotation> quotationList = quotationDAO.listQuotation();
			//log.debug(quotationList);
			request.setAttribute("quotationList", quotationList);
			
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson("Delete Success!!");
			 request.setAttribute("json", json);
			 
			 return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String saveQuotation() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String loginUser = ur.getSys_user_id(); // Username login
			
			String status = request.getParameter("status");
			
			String id = request.getParameter("id");
			
			String start = request.getParameter("start");
			//log.debug(start);
			SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date date = sdf1.parse(start);
			java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
			log.debug(sqlStartDate);
			 
			String end = request.getParameter("end");
			SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");
			java.util.Date date2 = sdf2.parse(end);
			java.sql.Date sqlEndDate = new java.sql.Date(date2.getTime()); 
			log.debug(sqlEndDate);
			
			String company_id = request.getParameter("company_id");
			String tax = request.getParameter("tax");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String customer = request.getParameter("customer");
			String salesperson = request.getParameter("salesperson");
			String orderList = request.getParameter("orderList");
			//String saleList = request.getParameter("saleList");
			String addressList = request.getParameter("addressList");
			String description = request.getParameter("description");
			String tax_type = request.getParameter("tax_type");
			
			String sub = request.getParameter("sub_total");
			BigDecimal sub_total = new BigDecimal(sub.replace(",",""));
			
			BigDecimal discount_percent;
			String dc_percent = request.getParameter("dc_percent");
			if(dc_percent.equals("")) {
				discount_percent = new BigDecimal(0.00);
			}else {
				discount_percent = new BigDecimal(dc_percent.replace(",",""));
			}
			String dc = request.getParameter("discount");
			BigDecimal discount;
			if(dc.equals("")) {
				discount = new BigDecimal(0.00);
			}else{
				discount = new BigDecimal(dc.replace(",",""));
			}
			
			String more_dc = request.getParameter("additional_discount");
			BigDecimal more_discount;
			if(more_dc.equals("")) {
				more_discount = new BigDecimal(0.00);
			}else {
				more_discount = new BigDecimal(more_dc.replace(",",""));
			}
			
			
			
			String vat = request.getParameter("vat");
			BigDecimal percent_tax;
			if(vat.equals("")) {
				percent_tax = new BigDecimal(0.00);
			}else {
				percent_tax = new BigDecimal(vat.replace(",",""));
			}
			
			String total_vat = request.getParameter("total_vat");
			BigDecimal total_tax;
			if(total_vat.equals("")) {
				total_tax = new BigDecimal(0.00);
			}else {
				total_tax = new BigDecimal(total_vat.replace(",",""));
			}
			
			String grand = request.getParameter("grand_total");
			BigDecimal grand_total = new BigDecimal(grand.replace(",",""));
			
			log.debug(id);
			log.debug(company_id);
			log.debug(tax);
			log.debug(contact);  //ไอดีของ contact นั้น
			log.debug(email);
			log.debug(phone1);
			log.debug(phone2);
			log.debug(customer);
			log.debug(salesperson);
			log.debug(description);
			log.debug(sub_total);
			log.debug(dc_percent);
			log.debug(discount);
			log.debug(more_dc);
			log.debug(tax_type);
			log.debug(vat);
			log.debug(total_vat);
			log.debug(grand);
			//log.debug(addressList);
			
			
			if(status.equals("1")) {
				log.debug("status = 1");
				JSONParser parserAddress = new JSONParser();
				JSONArray listOfAddress = (JSONArray) parserAddress.parse(addressList);
				log.debug(listOfAddress);
				for(int i = 0; i < listOfAddress.size();i++) {
					Quotation_address address = new Quotation_address();
					Map<String, Object> map_address  = (Map<String, Object>) listOfAddress.get(i);
					Integer pMaxId = quotation_addressDAO.getMaxId() + 1;
					
					address.setQuotation_address_id(pMaxId);
					address.setQuotation_id(id);
					address.setAddress_name(map_address.get("address_name").toString());
					address.setAddress(map_address.get("address_detail").toString());
					address.setDelivery_check(map_address.get("delivery_address").toString());
					address.setUser_create(loginUser);
					address.setUser_update(loginUser);
					address.setTime_create(DateUtil.getCurrentTime());
					address.setTime_update(DateUtil.getCurrentTime());
					
					quotation_addressDAO.save(address);
				}
				
				
				
				Company_contact contactInfo = company_contactDAO.findById(contact);
				String contact_name = contactInfo.getContact_name();
				
				
				List<Map<String, Object>> employee = employeeDAO.findByEmployee_id(salesperson);
				log.debug(employee.get(0));
				Map<String, Object> map_employee  = (Map<String, Object>) employee.get(0);
				String sale = map_employee.get("name_en").toString();
				log.debug(sale);
				
				Quotation quotation = new Quotation();
				quotation.setQuotation_id(id);
				quotation.setCompany_id(company_id);
				quotation.setCompany_name(customer);
				quotation.setContact_name(contact_name);
				quotation.setTax_number(tax);
				quotation.setEmail(email);
				quotation.setPhone(phone1);
				if(!phone2.equals("")) {
					quotation.setPhone_2(phone2);
				}
				quotation.setStart_date(sqlStartDate);
				quotation.setEnd_date(sqlEndDate);
				quotation.setSaleperson(sale);
				if(!description.equals("")) {
					quotation.setDescription(description);
				}
				quotation.setSub_total(sub_total);
				if(!dc.equals("")) {
					quotation.setDiscount(discount);
				}
				if(!dc_percent.equals("")) {
					quotation.setPercent_discount(discount_percent);
				}
				if(!more_dc.equals("")) {
					quotation.setAdditional_discounts(more_discount);
				}
				quotation.setTax_type(tax_type);
				if(!vat.equals("")) {
					quotation.setPercent_tax(percent_tax);
				}
				if(!total_vat.equals("")) {
					quotation.setTax(total_tax);
				}
				quotation.setGrand_total(grand_total);
				quotation.setQuotation_status(status);
				quotation.setUser_create(loginUser);
				quotation.setUser_update(loginUser);
				quotation.setTime_create(DateUtil.getCurrentTime());
				quotation.setTime_update(DateUtil.getCurrentTime());
				quotationDAO.save(quotation);
				
				JSONParser parser = new JSONParser();
				JSONArray listOfOrder = (JSONArray) parser.parse(orderList);
				log.debug(listOfOrder);
				for(int i = 0; i < listOfOrder.size();i++) {
					Order quotationOrder = new Order();
					Map<String, Object> map_order  = (Map<String, Object>) listOfOrder.get(i);
					Integer pMaxId = orderDAO.getMaxId() + 1;
					log.debug(pMaxId);
					
					quotationOrder.setOrder_id(pMaxId);
					quotationOrder.setQuotation_id(id);
					
					quotationOrder.setName(map_order.get("product_name").toString());
					log.debug(map_order.get("product_name").toString());
					
					quotationOrder.setDescription(map_order.get("description").toString());
					log.debug(map_order.get("description").toString());
					
					String quantity = map_order.get("quantity").toString().replace(",","");
					Integer many = new Integer(quantity);
					log.debug(quantity);
					log.debug(many.getClass());
					quotationOrder.setQuantity(many);
					
					BigDecimal price = new BigDecimal(map_order.get("unit_price").toString().replace(",",""));
					log.debug(price);
					log.debug(price.getClass());
					quotationOrder.setUnit_price(price);
					
					BigDecimal total = new BigDecimal(map_order.get("total").toString().replace(",",""));
					log.debug(total);
					log.debug(total.getClass());
					quotationOrder.setTotal(total);
					
					
					quotationOrder.setUser_create(loginUser);
					quotationOrder.setUser_update(loginUser);
					quotationOrder.setTime_create(DateUtil.getCurrentTime());
					quotationOrder.setTime_update(DateUtil.getCurrentTime());
					log.debug(quotationOrder.toString());
					orderDAO.save(quotationOrder);
				}
			}
				if(status.equals("2")) {
					Quotation quote = new Quotation();
					List<Quotation> quoteList = quotationDAO.findByQuotationId(id);
					log.debug("status = 2");
					if(quoteList == null || quoteList.isEmpty()) {
						JSONParser parserAddress = new JSONParser();
						JSONArray listOfAddress = (JSONArray) parserAddress.parse(addressList);
						log.debug(listOfAddress);
						for(int i = 0; i < listOfAddress.size();i++) {
							Quotation_address address = new Quotation_address();
							Map<String, Object> map_address  = (Map<String, Object>) listOfAddress.get(i);
							Integer pMaxId = quotation_addressDAO.getMaxId() + 1;
							
							address.setQuotation_address_id(pMaxId);
							address.setQuotation_id(id);
							address.setAddress_name(map_address.get("address_name").toString());
							address.setAddress(map_address.get("address_detail").toString());
							address.setDelivery_check(map_address.get("delivery_address").toString());
							address.setUser_create(loginUser);
							address.setUser_update(loginUser);
							address.setTime_create(DateUtil.getCurrentTime());
							address.setTime_update(DateUtil.getCurrentTime());
							
							quotation_addressDAO.save(address);
						}
						
						
						
						Company_contact contactInfo = company_contactDAO.findById(contact);
						String contact_name = contactInfo.getContact_name();
						
						
						List<Map<String, Object>> employee = employeeDAO.findByEmployee_id(salesperson);
						log.debug(employee.get(0));
						Map<String, Object> map_employee  = (Map<String, Object>) employee.get(0);
						String sale = map_employee.get("name_en").toString();
						log.debug(sale);
						
						Quotation quotation = new Quotation();
						quotation.setQuotation_id(id);
						quotation.setCompany_id(company_id);
						quotation.setCompany_name(customer);
						quotation.setContact_name(contact_name);
						quotation.setTax_number(tax);
						quotation.setEmail(email);
						quotation.setPhone(phone1);
						if(!phone2.equals("")) {
							quotation.setPhone_2(phone2);
						}
						quotation.setStart_date(sqlStartDate);
						quotation.setEnd_date(sqlEndDate);
						quotation.setSaleperson(sale);
						if(!description.equals("")) {
							quotation.setDescription(description);
						}
						quotation.setSub_total(sub_total);
						if(!dc.equals("")) {
							quotation.setDiscount(discount);
						}
						if(!dc_percent.equals("")) {
							quotation.setPercent_discount(discount_percent);
						}
						if(!more_dc.equals("")) {
							quotation.setAdditional_discounts(more_discount);
						}
						quotation.setTax_type(tax_type);
						if(!vat.equals("")) {
							quotation.setPercent_tax(percent_tax);
						}
						if(!total_vat.equals("")) {
							quotation.setTax(total_tax);
						}
						quotation.setGrand_total(grand_total);
						quotation.setQuotation_status(status);
						quotation.setUser_create(loginUser);
						quotation.setUser_update(loginUser);
						quotation.setTime_create(DateUtil.getCurrentTime());
						quotation.setTime_update(DateUtil.getCurrentTime());
						quotationDAO.save(quotation);
						
						JSONParser parser = new JSONParser();
						JSONArray listOfOrder = (JSONArray) parser.parse(orderList);
						log.debug(listOfOrder);
						for(int i = 0; i < listOfOrder.size();i++) {
							Order quotationOrder = new Order();
							Map<String, Object> map_order  = (Map<String, Object>) listOfOrder.get(i);
							Integer pMaxId = orderDAO.getMaxId() + 1;
							log.debug(pMaxId);
							
							quotationOrder.setOrder_id(pMaxId);
							quotationOrder.setQuotation_id(id);
							
							quotationOrder.setName(map_order.get("product_name").toString());
							log.debug(map_order.get("product_name").toString());
							
							quotationOrder.setDescription(map_order.get("description").toString());
							log.debug(map_order.get("description").toString());
							
							String quantity = map_order.get("quantity").toString().replace(",","");
							Integer many = new Integer(quantity);
							log.debug(quantity);
							log.debug(many.getClass());
							quotationOrder.setQuantity(many);
							
							BigDecimal price = new BigDecimal(map_order.get("unit_price").toString().replace(",",""));
							log.debug(price);
							log.debug(price.getClass());
							quotationOrder.setUnit_price(price);
							
							BigDecimal total = new BigDecimal(map_order.get("total").toString().replace(",",""));
							log.debug(total);
							log.debug(total.getClass());
							quotationOrder.setTotal(total);
							
							
							quotationOrder.setUser_create(loginUser);
							quotationOrder.setUser_update(loginUser);
							quotationOrder.setTime_create(DateUtil.getCurrentTime());
							quotationOrder.setTime_update(DateUtil.getCurrentTime());
							log.debug(quotationOrder.toString());
							orderDAO.save(quotationOrder);
					}
				}else {
					quote = quotationDAO.findById(id);
					quote.setQuotation_status(status);
					log.debug(quote.toString());
					quotationDAO.update(quote);
				}
			}
			
				
			
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson("success");
			 request.setAttribute("json", json);
			
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String listForQuotation_add() {
		try {
			List<Company> companyList = companyDAO.findAllCompany();
			log.debug(companyList);
			request.setAttribute("companyList", companyList);
			
			List<Employee> employeeList = employeeDAO.findAll();
			log.debug(employeeList);
			request.setAttribute("employeeList", employeeList);
			
			
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String edit_quotation() {
		try {
			String id = request.getParameter("id");
			log.debug(id);
			
			List<Company> companyList = companyDAO.findAllCompany();
			log.debug(companyList);
			request.setAttribute("companyList", companyList);
			
			List<Quotation> quotationList = quotationDAO.findByQuotationId(id);
			log.debug(quotationList.toString());
			request.setAttribute("quotationList", quotationList);
			
			Map<String, Object> map  = (Map<String, Object>) quotationList.get(0);
			List<Company_contact> contactList = company_contactDAO.findByCompany_id(map.get("company_id").toString());
			log.debug(contactList);
			request.setAttribute("contactList", contactList);
			
			List<Employee> employeeList = employeeDAO.findAll();
			log.debug(employeeList);
			request.setAttribute("employeeList", employeeList);
			
			List<Company_address> addressList = company_addressDAO.findByCompayny_id(map.get("company_id").toString());
			request.setAttribute("addressList", addressList);
			log.debug(addressList);
			
			List<Quotation_address> quotation_addressList = quotation_addressDAO.findByQuotationId(id);
			log.debug(quotation_addressList);
			request.setAttribute("quotation_addressList", quotation_addressList);
			
			List<Order> orderList = orderDAO.findByQuotationId(id);
			log.debug(orderList);
			request.setAttribute("orderList", orderList);
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String listContactCompany() {
		try {
			String id = request.getParameter("id");
			log.debug(id);
			List<Company_contact> contactList = company_contactDAO.findByCompany_id(id);
			log.debug(contactList);
			
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(contactList);
			 request.setAttribute("json", json);
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String findDataContact() {
		try {
			String id = request.getParameter("contact_id");
			log.debug(id);
			Company_contact contactInfo = company_contactDAO.findById(id);
			log.debug(contactInfo.toString());
			
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(contactInfo);
			 request.setAttribute("json", json);
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String listofAddressCompany() {
		try {
			String id = request.getParameter("company_id");
			log.debug(id);
			List<Company_address> addressList = company_addressDAO.findByCompayny_id(id);
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
	public String checkId() {
		try {
			String id = request.getParameter("id");
			log.debug(id);
			Map<String, String> obj = new HashMap<>();
			List<Quotation> list = quotationDAO.findByQuotationId(id);
			String s = list.toString();
			if (s.equals("[]")) {
				String x = "0";
				obj.put("flag", x);
			} else {
				String a = "1";
				obj.put("flag", a);
			}
			Gson gson = new GsonBuilder().create();
			String jsonObjStr = gson.toJson(obj);
			PrintWriter out = response.getWriter();
			out.print(jsonObjStr);
			out.flush();
			out.close();
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String deleteQuoteAddress() {
		try {
			String id = request.getParameter("id");
			log.debug(id);
			Integer address_id = Integer.valueOf(id);
			Quotation_address quotation_address = new Quotation_address();
			quotation_address = quotation_addressDAO.findById(address_id);
			quotation_addressDAO.delete(quotation_address);
			
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson("delete success");
			 request.setAttribute("json", json);
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
