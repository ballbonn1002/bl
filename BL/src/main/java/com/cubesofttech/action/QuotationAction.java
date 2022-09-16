package com.cubesofttech.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.opensymphony.xwork2.ActionSupport;

public class QuotationAction extends ActionSupport{
	private static final Logger log = Logger.getLogger(Sys_roleAction.class);
	private static final long serialVersionUID = 1L;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	public String saveQuotation() {
		try {
			String id = request.getParameter("id");
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String tax = request.getParameter("tax");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String customer = request.getParameter("customer");
			String orderList = request.getParameter("orderList");
			String saleList = request.getParameter("saleList");
			String addressList = request.getParameter("addressList");
			String description = request.getParameter("description");
			String sub_total = request.getParameter("sub_total");
			String dc_percent = request.getParameter("dc_percent");
			String discount = request.getParameter("discount");
			String sum_discount = request.getParameter("sum_discount");
			String tax_type = request.getParameter("tax_type");
			String vat = request.getParameter("vat");
			String total_vat = request.getParameter("total_vat");
			String grand_total = request.getParameter("grand_total");
			log.debug(id);
			log.debug(orderList);
			log.debug(orderList.getClass());
			
			JSONParser parser = new JSONParser();
			JSONArray listOfOrder = (JSONArray) parser.parse(orderList);
			log.debug(listOfOrder);
			log.debug(listOfOrder.get(0));
			
			/*JSONParser parser = new JSONParser();
			JSONArray a = (JSONArray) parser.parse(orderList);
			ArrayList<String> orderListarr = new ArrayList<String>();
			
			for (Object o : a) {
				JSONObject user = (JSONObject) o;
				orderListarr.add((String) user.get("sys_user_id"));
			}
			log.debug(userListarr);*/
			
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
