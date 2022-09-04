package com.cubesofttech.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

public class DashboardAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(DashboardAction.class);
	private static final long serialVersionUID = 1L;


	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public String list() {
		try {

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}
	

	public String pageTest() {
		try {

			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String getTable() {
		try {

			JSONArray ja = new JSONArray();

			JSONObject mainObj = new JSONObject();
			mainObj.put("table", ja);

			PrintWriter out = response.getWriter();
			out.print(mainObj);
			out.flush();
			out.close();

			// return null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
