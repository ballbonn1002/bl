package com.cubesofttech.action;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.EmployeeDAO;
import com.cubesofttech.dao.FileuploadDAO;
import com.cubesofttech.dao.Sys_roleDAO;
import com.cubesofttech.dao.SysuserDAO;
import com.cubesofttech.model.Employee;
import com.cubesofttech.model.Fileupload;
import com.cubesofttech.model.Sys_role;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
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
	private String name;
	private String role;
	private String email;
	private String tel;
	private String title;
	private String isactive;
	private String nameth;
	private String userid;
	private String password;
	private String confirmpassword;
	private String filesize;
	private String fileUploadFileName;
	private File fileUpload;
	private Integer file_ID;
	@Autowired
	private Sys_roleDAO sys_roleDAO;
	
	@Autowired
	private SysuserDAO sysuserDAO;
	
	@Autowired
	private EmployeeDAO employeeDAO;

	@Autowired
	private FileuploadDAO fileuploadDAO;
	
	
	
	public Integer getFile_ID() {
		return file_ID;
	}

	public void setFile_ID(Integer file_ID) {
		this.file_ID = file_ID;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIsactive() {
		return isactive;
	}

	public void setIsactive(String isactive) {
		this.isactive = isactive;
	}

	public String getNameth() {
		return nameth;
	}

	public void setNameth(String nameth) {
		this.nameth = nameth;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

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
	    		log.debug("userid " + userid);
	    		log.debug("fileUpload "+fileUpload);	
	    		log.debug("filesize "+filesize);	
	                Sysuser sysuser = new Sysuser();
	              /*  String userid = request.getParameter("IDuser");
	                String name = request.getParameter("user_name");
	                String role = request.getParameter("user_role");
	                String email = request.getParameter("user_email");
	                String title = request.getParameter("title");
					
					String tel = request.getParameter("user_tel"); 
					
					 
	                
	                String nameth = request.getParameter("user_nameth");
	                String isactive = request.getParameter("user_isactive");
	                String password = request.getParameter("password");  */
	                log.debug(tel); 
					String phone = tel.replace("-",""); 
					log.debug(phone);
	                String passwor =  MD5.getInstance().hashData(password.getBytes());
	          
	               Sysuser sys_chk =  sysuserDAO.findById(userid);
	                if(sys_chk == null) {
	                	if(fileUpload != null) {
			                 Fileupload file = new Fileupload();
			   		    	 ServletContext context = request.getServletContext();
			   				 String fileServerPath = context.getRealPath("/");
			   				 double fileSize = Double.parseDouble(filesize);
			   				 String FileSize = FileUtil.getFileSize(fileSize);
			   				 String filename = fileUploadFileName;
			   				 int l = filename.length();
			   				 int split = filename.indexOf(".");
			   				 String fname = filename.substring(0, split);
			   				 String type = (String) filename.subSequence(split, l);
			   				 int maxId = fileuploadDAO.getMaxId()+1;
			   				 log.debug("filename "+filename);
			   				 log.debug("type "+type);
			   				 FileUtil.upload(fileUpload, fileServerPath + "upload/sys_user/", maxId + "_" + filename);
			   				 file.setFile_id(maxId);
			   				 file.setName(fname);
			   				 file.setSize(FileSize);
			   				 file.setPath("/upload/sys_user/" + maxId + "_" + filename);
			   				 file.setPage("sys_user");
			   				 file.setType(type);
			   				 file.setUser_create(loginUser);
			   				 file.setUser_update(loginUser);
			   				 file.setTime_create(DateUtil.getCurrentTime());
			   				 file.setTime_update(DateUtil.getCurrentTime());
			   				 fileuploadDAO.save(file); 
			   				 log.debug(file);
			   				 Integer f_id = file.getFile_id();
			   				 sysuser.setFile_id(f_id);
	                	}
	                	
	                	sysuser.setSys_user_id(userid);
	                	sysuser.setSys_role_id(role);
	                	
	                	sysuser.setTitle(title);
	                	sysuser.setUser_id(name);
	                	sysuser.setEmail(email);
	                	sysuser.setName(nameth);
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
	                	String uc = sys_chk.getUser_create();
	                	Timestamp tc = sys_chk.getTimeCreate();
	                	if(fileUpload != null && file_ID==null) {
	                		 Fileupload file = new Fileupload();
			   		    	 ServletContext context = request.getServletContext();
			   				 String fileServerPath = context.getRealPath("/");
			   				 double fileSize = Double.parseDouble(filesize);
			   				 String FileSize = FileUtil.getFileSize(fileSize);
			   				 String filename = fileUploadFileName;
			   				 int l = filename.length();
			   				 int split = filename.indexOf(".");
			   				 String fname = filename.substring(0, split);
			   				 String type = (String) filename.subSequence(split, l);
			   				 int maxId = fileuploadDAO.getMaxId()+1;
			   				 log.debug("filename "+filename);
			   				 log.debug("type "+type);
			   				 FileUtil.upload(fileUpload, fileServerPath + "upload/sys_user/", maxId + "_" + filename);
			   				 file.setFile_id(maxId);
			   				 file.setName(fname);
			   				 file.setSize(FileSize);
			   				 file.setPath("/upload/sys_user/" + maxId + "_" + filename);
			   				 file.setPage("sys_user");
			   				 file.setType(type);
			   				 file.setUser_create(uc);
			   				 file.setUser_update(loginUser);
			   				 //file.setTime_create(DateUtil.getCurrentTime());
			   				 file.setTime_create(tc);
			   				 file.setTime_update(DateUtil.getCurrentTime());
			   				 fileuploadDAO.save(file); 
			   				 log.debug(file);
			   				 Integer f_id = file.getFile_id();
			   				 sysuser.setFile_id(f_id);
	                	} 
	                	else if (fileUpload != null && file_ID!=null) {
	                		Fileupload file = new Fileupload();
			   		    	 ServletContext context = request.getServletContext();
			   				 String fileServerPath = context.getRealPath("/");
			   				 double fileSize = Double.parseDouble(filesize);
			   				 String FileSize = FileUtil.getFileSize(fileSize);
			   				 String filename = fileUploadFileName;
			   				 int l = filename.length();
			   				 int split = filename.indexOf(".");
			   				 String fname = filename.substring(0, split);
			   				 String type = (String) filename.subSequence(split, l);
			   				// int maxId = fileuploadDAO.getMaxId()+1;
			   				 log.debug("filename "+filename);
				   			 log.debug("type "+type);
				   			 log.debug("fileid "+file_ID);
				   			 FileUtil.upload(fileUpload, fileServerPath + "upload/sys_user/", file_ID + "_" + filename);
			   				 file.setFile_id(file_ID);
			   				 file.setName(fname);
			   				 file.setSize(FileSize);
			   				 file.setPath("/upload/sys_user/" + file_ID + "_" + filename);
			   				 file.setPage("sys_user");
			   				 file.setType(type);
			   				 file.setUser_create(uc);
			   				 file.setUser_update(loginUser);
			   				 file.setTime_create(tc);
			   				 file.setTime_update(DateUtil.getCurrentTime());
			   				 fileuploadDAO.update(file);
			   				 log.debug(file);
			   				// Integer f_id = file.getFile_id();
			   				   sysuser.setFile_id(file_ID);
	                		
	                		
	                	}
	                	else if (fileUpload == null && file_ID!=null) {
	                		 Fileupload file = fileuploadDAO.findById(file_ID);
			   				 fileuploadDAO.update(file);
			   				 log.debug(file);
			   				// Integer f_id = file.getFile_id();
			   				   sysuser.setFile_id(file_ID);
	                		
	                		
	                	}
	                 
	                	sysuser.setSys_role_id(role);
	                	sysuser.setEmail(email);
	                	sysuser.setTitle(title);
	                	sysuser.setName(nameth);
						sysuser.setPhone(phone);
	                	sysuser.setUser_id(name);
	                	sysuser.setUser_update(loginUser);
	                	sysuser.setIs_active(isactive);
	                	sysuser.setSys_user_id(userid);
	                	sysuser.setTimeUpdate(DateUtil.getCurrentTime());
	                	
	                	sysuser.setUser_create(uc);
	                	
	                	sysuser.setTimeCreate(tc);
	                	String pass = sys_chk.getPassword();
	                	log.debug(pass);
	                
	                	String passw =  MD5.getInstance().hashData(password.getBytes());
	                	log.debug(passw);
	                	if(passw.equals(pass)){
	                		log.debug("c"+1);
	                        sysuser.setPassword(pass);
	                   }else if ("".equals(password)) {
	               		log.debug("c"+2);
	                   	sysuser.setPassword(pass);
	                   }
	                   else if (!passw.equals(pass)) {
	                	   log.debug("c"+3);
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
	            	
	                return ERROR;
	            }
	       } 
	
	public String listuser() {
		try {
			List<Employee> userList = employeeDAO.findAllEmployee();
			request.setAttribute("userList", userList);
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
			Fileupload file = fileuploadDAO.findById(sysuser.getFile_id());
			sysuserDAO.delete(sysuser);
			fileuploadDAO.delete(file);
			
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
			List<Sysuser> sysuserList = sysuserDAO.findByIdWithImg(sysuserId);
			
			
			log.debug("sysuserlist "+sysuserList);
			request.setAttribute("sysuserList", sysuserList);  
			List<Employee> userList = employeeDAO.findAllEmployee();
			request.setAttribute("userList", userList);
			List<Sys_role> sysroleList = sys_roleDAO.findAll();
			request.setAttribute("sysroleList", sysroleList);
			log.debug(sysroleList);
	
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
