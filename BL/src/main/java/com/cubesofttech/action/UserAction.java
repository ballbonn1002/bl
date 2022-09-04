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

import com.cubesofttech.dao.Sys_roleDAO;
import com.cubesofttech.dao.SysuserDAO;
import com.cubesofttech.model.Sys_role;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.MD5;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2280661337420278284L;
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String User = "userList";
	public static final String Role = "roleList";
	public static final String ONLINEUSER = "onlineUser";
	public static final String Sysuser = "sysuser";

	@Autowired
	private Sys_roleDAO sys_roleDAO;
	
	@Autowired
	private SysuserDAO sysuserDAO;


	private String confirmpassword;

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	

	public String save_sysuser() {
	    try {
	    		Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
	    		String loginUser = ur.getSys_user_id(); // Username login
	    		
	                Sysuser sysuser = new Sysuser();
	                String userid = request.getParameter("IDuser");
	                String name = request.getParameter("user_name");
	                String role = request.getParameter("user_role");
	                String email = request.getParameter("user_email");
	                
	                String tel = request.getParameter("user_tel");
	                log.debug(tel);
	                String phone = tel.replace("-","");
	                log.debug(phone);
	                
	                String nameth = request.getParameter("user_nameth");
	                String isactive = request.getParameter("user_isactive");
	                String password = request.getParameter("password");  
	                String passwor =  MD5.getInstance().hashData(password.getBytes());
	                
	               Sysuser sys_chk =  sysuserDAO.findById(userid);
	                if(sys_chk == null) {
	                	sysuser.setSys_user_id(userid);
	                	sysuser.setSys_role_id(role);
	                	sysuser.setUser_id(name);
	                	sysuser.setEmail(email);
	                	sysuser.setName_th(nameth);
	                	sysuser.setIs_active(isactive);
	                	sysuser.setPhone(phone);
	                	sysuser.setUser_create(loginUser);
	                	sysuser.setUser_update(loginUser);
	                	sysuser.setTimeCreate(DateUtil.getCurrentTime());
	                	sysuser.setTimeUpdate(DateUtil.getCurrentTime());
	                	sysuser.setPassword(passwor);
	                	sysuserDAO.save(sysuser);
	                }
	                else{
	                	sysuser.setSys_role_id(role);
	                	sysuser.setEmail(email);
	                	sysuser.setName_th(nameth);
	                	sysuser.setPhone(phone);
	                	sysuser.setUser_id(name);
	                	sysuser.setUser_update(loginUser);
	                	sysuser.setIs_active(isactive);
	                	sysuser.setSys_user_id(userid);
	                	sysuser.setTimeUpdate(DateUtil.getCurrentTime());
	                	String uc = sys_chk.getUser_create();
	                	sysuser.setUser_create(uc);
	                	Timestamp tc = sys_chk.getTimeCreate();
	                	sysuser.setTimeCreate(tc);
	                	String pass = sys_chk.getPassword();
	                	if(pass.equals(password)){
	                        sysuser.setPassword(password);
	                   }else if (!password.equals(pass)) {
	                   	String passw =  MD5.getInstance().hashData(password.getBytes());
	                   	sysuser.setPassword(passw);
	                   }
	                	sysuserDAO.update(sysuser);
	                }  
	                
	                sysuser = sysuserDAO.findById(userid);
	        		request.setAttribute("sysuserList", sysuser);
	
	        		
	        		List<Sys_role> sysroleList = sys_roleDAO.findAll();
	        		request.setAttribute("sysroleList", sysroleList);
	
	                return SUCCESS;
	            } catch (Exception e) {
	            	//e.printStackTrace();
	                return ERROR;
	            }
	       } 
	
	public String listuser() {
		try {
			
			List<Sys_role> sysroleList = sys_roleDAO.findAll();
			request.setAttribute("sysroleList", sysroleList);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String sys_userList() {
		try {
			List<Sysuser> sysuserList = sysuserDAO.findAll();
			request.setAttribute("sysuserList", sysuserList);
			
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	public String Userdelete() {
		try{
			String sysuserId = request.getParameter("sys_user_id");
			Sysuser sysuser = new Sysuser();
			sysuser = sysuserDAO.findById(sysuserId);
			sysuserDAO.delete(sysuser);
			
			List<Sysuser> sysuserList = sysuserDAO.findAll();
			request.setAttribute("sysuserList", sysuserList);
			return SUCCESS;
		}catch (Exception e){
			//e.printStackTrace();
			return ERROR;
		}
	}
	public String SysuserEdit(){
		try{
			String sysuserId = request.getParameter("sysuser_id");
	
			log.debug(sysuserId);
			Sysuser sysuserList = new Sysuser();	
			
			sysuserList = sysuserDAO.findById(sysuserId);
			request.setAttribute("sysuserList", sysuserList);  
			
			List<Sys_role> sysroleList = sys_roleDAO.findAll();
			request.setAttribute("sysroleList", sysroleList);
	
			return SUCCESS;
		}catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	public String CheckUserID() {
		try {
			String id = request.getParameter("sysuserCheckID");
			Map<String, String> obj = new HashMap<>();
			List<Map<String, Object>> sysuser = sysuserDAO.findById2(id);
			log.debug(sysuser);
			String s = sysuser.toString();
			if (s.equals("[]")) {
				String x = "0";
				obj.put("flag", x);
			} else {
				String a = "1";
				obj.put("flag", a);
			} 
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
	        String json = gson.toJson(obj);
	        PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close(); 
			
	        //return null;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	 }
	
	
	public String Changecheckbox() {
		try {
			Sysuser sysuser = new Sysuser();
			String userId = request.getParameter("userId");
			sysuser = sysuserDAO.findById(userId);
			log.debug(userId);
			String Isactive = request.getParameter("Isactive");
			log.debug(Isactive);
			sysuser.setIs_active(Isactive);
			sysuserDAO.update(sysuser);
			
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
	        String json = gson.toJson(sysuser);
	        request.setAttribute("json", json);
			return SUCCESS;
		}catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String user_profile() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser");
			String loginUser = ur.getSys_user_id();
			//log.debug(loginUser);
			List<Sysuser> sysuserList = sysuserDAO.findBySysuserID(loginUser);
			//log.debug(sysuserList);
			request.setAttribute("sysuserList", sysuserList);
			
			return SUCCESS;
		}catch (Exception e){
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String CheckCurrent(){
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser");
			String loginUser = ur.getSys_user_id();
			String current = request.getParameter("current");
			String current_m = MD5.getInstance().hashData(current.getBytes());
			//log.debug(current_m);
			
			Map<String, String> obj = new HashMap<>();
			List<Map<String, Object>> sysuser = sysuserDAO.CheckCurrent(current_m , loginUser );
			//log.debug(sysuser);
			String s = sysuser.toString();
			if (s.equals("[]")) {
				String x = "0";
				obj.put("flag", x);
			} else {
				String a = "1";
				obj.put("flag", a);
			} 
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
	        String json = gson.toJson(obj);
	        PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();  
			
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String Change_Password() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser");
			String loginUser = ur.getSys_user_id();
			
			String pw = request.getParameter("password");
			String pw_m = MD5.getInstance().hashData(pw.getBytes());
			Sysuser sysuser = new Sysuser();
	
			sysuser = sysuserDAO.findById(loginUser);
			sysuser.setPassword(pw_m);
			sysuser.setTimeUpdate(DateUtil.getCurrentTime());
			sysuser.setUser_update(loginUser);
			sysuserDAO.update(sysuser);
			//log.debug(sysuser);
			
			List<Sysuser> sysuserList = sysuserDAO.findBySysuserID(loginUser);
			request.setAttribute("sysuserList", sysuserList);
			
			return SUCCESS;
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
