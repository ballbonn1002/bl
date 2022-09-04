package com.cubesofttech.action;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PageDAO;
import com.cubesofttech.dao.PermissionDAO;
import com.cubesofttech.model.Page;
import com.cubesofttech.model.Permission;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class PermissionAction extends ActionSupport{
	private static final Logger log = Logger.getLogger(PageGroupAction.class);
	private static final long serialVersionUID = 1L;
	@Autowired
	public PermissionDAO permissionDAO;
	
	@Autowired
	public PageDAO pageDAO;
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Permission = "permissionList";
	
	public String list() {
		try {
					List<Permission> permissionList = permissionDAO.findAll();
					request.setAttribute(Permission, permissionList);
					log.debug(permissionList);
					return SUCCESS;
				} catch (Exception e) {
					log.error(e);
					
					return ERROR;
				}
		   }
	
	public String changePerActive() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getSys_user_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id").equals("")?"0":request.getParameter("permission_Id");
			String Id_page = request.getParameter("pId");
			log.debug(Id_page);
			String Id_role = request.getParameter("roleId");
			log.debug(Id_role);
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			String pmt_active = request.getParameter("Active");
			log.debug(pmt_active);
			List<Map<String, Object>> permissionList = permissionDAO.findPermissionBypageId(Id_page, Id_role);
			if (permissionList.size() > 0) {
				 Map<String, Object> map  = (Map<String, Object>) permissionList.get(0);
				 
				log.debug("here: "+"hello world");
				log.debug(map.get("page_name"));
				 permission.setPermission_id((BigInteger) map.get("permission_id"));
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(Id_page);
				 permission.setPage_name(map.get("page_name").toString());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active(map.get("page_group_active").toString());
				 permission.setPage_active(pmt_active);
				 permission.setView(map.get("view").toString());
				 permission.setCreate_update(map.get("create_update").toString());
				 permission.setDelete_role(map.get("delete_role").toString());
				 permission.setApprove(map.get("approve").toString());
				 permission.setUser_create(map.get("user_create").toString());
				 permission.setUser_update(logonUser);
				 permission.setTime_create((Timestamp) map.get("time_create"));
				 permission.setTime_update(DateUtil.getCurrentTime());
				 
				 log.debug("Permission: "+permission);
				 permissionDAO.update(permission);
				 
			}else {
				Page page = pageDAO.findById(Id_page);
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(page.getPage_id());
				 permission.setPage_name(page.getPage_name());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active("1");
				 permission.setPage_active(pmt_active);
				 permission.setView("0");
				 permission.setCreate_update("0");
				 permission.setDelete_role("0");
				 permission.setApprove("0");
				 permission.setUser_create(logonUser);
				 permission.setUser_update(logonUser);
				 permission.setTime_create(DateUtil.getCurrentTime());
				 permission.setTime_update(DateUtil.getCurrentTime());
				permissionDAO.save(permission);
			}
		
			
			
			// log.debug(page);
			 
			/* permission.setPage_active(pmt_active);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);*/
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		e.printStackTrace();
		
		return ERROR;
		
		}
	}
	public String changeView() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getSys_user_id(); // Username login
			
			Permission permission= new Permission();
			
			String Id_permission = request.getParameter("permission_Id").equals("")?"0":request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			String Id_page = request.getParameter("pId");
			log.debug(Id_page);
			String Id_role = request.getParameter("roleId");
			log.debug(Id_role);
			String pmt_view = request.getParameter("View");
			log.debug(pmt_view);
			List<Map<String, Object>> permissionList = permissionDAO.findPermissionBypageId(Id_page, Id_role);
			log.debug(permissionList);
			log.debug(permissionList.size());
			if (permissionList.size() > 0) {
				 Map<String, Object> map  = (Map<String, Object>) permissionList.get(0);
				 
				log.debug("here: "+"hello world");
				log.debug(map.get("page_name"));
				 permission.setPermission_id((BigInteger) map.get("permission_id"));
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(Id_page);
				 permission.setPage_name(map.get("page_name").toString());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active(map.get("page_group_active").toString());
				 permission.setPage_active(map.get("page_active").toString());
				 permission.setView(pmt_view);
				 permission.setCreate_update(map.get("create_update").toString());
				 permission.setDelete_role(map.get("delete_role").toString());
				 permission.setApprove(map.get("approve").toString());
				 permission.setUser_create(map.get("user_create").toString());
				 permission.setUser_update(logonUser);
				 permission.setTime_create((Timestamp) map.get("time_create"));
				 permission.setTime_update(DateUtil.getCurrentTime());
				 
				 permissionDAO.update(permission);
				 
			}else {
				Page page = pageDAO.findById(Id_page);
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(page.getPage_id());
				 permission.setPage_name(page.getPage_name());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active("1");
				 permission.setPage_active("0");
				 permission.setView(pmt_view);
				 permission.setCreate_update("0");
				 permission.setDelete_role("0");
				 permission.setApprove("0");
				 permission.setUser_create(logonUser);
				 permission.setUser_update(logonUser);
				 permission.setTime_create(DateUtil.getCurrentTime());
				 permission.setTime_update(DateUtil.getCurrentTime());
				permissionDAO.save(permission);
			}
			/*log.debug("Permission: "+permission);
			int yy =  permissionDAO.updateorInsert(permission);
			log.debug(yy);*/
			/* 
			
		
			
			
			// log.debug(page);
			 
			 permission.setView(pmt_view);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			 
			
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);*/
			// log.debug(pageList);
		   return SUCCESS;
	}catch(Exception e) {
		e.printStackTrace();
		
		return ERROR;
		
		}
	}
	public String changeCreateUpdate() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getSys_user_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id").equals("")?"0":request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			String Id_page = request.getParameter("pId");
			log.debug(Id_page);
			String Id_role = request.getParameter("roleId");
			log.debug(Id_role);
			String pmt_view = request.getParameter("View");
			log.debug(pmt_view);
			String pmt_create_update = request.getParameter("CreateUpdate");
			log.debug(pmt_create_update);
		    List<Map<String, Object>> permissionList = permissionDAO.findPermissionBypageId(Id_page, Id_role);
			
		    if (permissionList.size() > 0) {
				 Map<String, Object> map  = (Map<String, Object>) permissionList.get(0);
				 
				log.debug("here: "+"hello world");
				log.debug(map.get("page_name"));
				 permission.setPermission_id((BigInteger) map.get("permission_id"));
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(Id_page);
				 permission.setPage_name(map.get("page_name").toString());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active(map.get("page_group_active").toString());
				 permission.setPage_active(map.get("page_active").toString());
				 permission.setView(map.get("view").toString());
				 permission.setCreate_update(pmt_create_update);
				 permission.setDelete_role(map.get("delete_role").toString());
				 permission.setApprove(map.get("approve").toString());
				 permission.setUser_create(map.get("user_create").toString());
				 permission.setUser_update(logonUser);
				 permission.setTime_create((Timestamp) map.get("time_create"));
				 permission.setTime_update(DateUtil.getCurrentTime());
				 
				 permissionDAO.update(permission);
				 
			}else {
				Page page = pageDAO.findById(Id_page);
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(page.getPage_id());
				 permission.setPage_name(page.getPage_name());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active("1");
				 permission.setPage_active("0");
				 permission.setView("0");
				 permission.setCreate_update(pmt_create_update);
				 permission.setDelete_role("0");
				 permission.setApprove("0");
				 permission.setUser_create(logonUser);
				 permission.setUser_update(logonUser);
				 permission.setTime_create(DateUtil.getCurrentTime());
				 permission.setTime_update(DateUtil.getCurrentTime());
				permissionDAO.save(permission);
			}
			// log.debug(page);
			 
			/* permission.setCreate_update(pmt_create_update);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);
			// log.debug(pageList);*/
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	}
	public String changeDelete() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getSys_user_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id").equals("")?"0":request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			String Id_page = request.getParameter("pId");
			log.debug(Id_page);
			String Id_role = request.getParameter("roleId");
			log.debug(Id_role);
			String pmt_delete = request.getParameter("Delete");
			log.debug(pmt_delete);
			 List<Map<String, Object>> permissionList = permissionDAO.findPermissionBypageId(Id_page, Id_role);
		
			 if (permissionList.size() > 0) {
				 Map<String, Object> map  = (Map<String, Object>) permissionList.get(0);
				 
				log.debug("here: "+"hello world");
				log.debug(map.get("page_name"));
				 permission.setPermission_id((BigInteger) map.get("permission_id"));
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(Id_page);
				 permission.setPage_name(map.get("page_name").toString());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active(map.get("page_group_active").toString());
				 permission.setPage_active(map.get("page_active").toString());
				 permission.setView(map.get("view").toString());
				 permission.setCreate_update(map.get("create_update").toString());
				 permission.setDelete_role(pmt_delete);
				 permission.setApprove(map.get("approve").toString());
				 permission.setUser_create(map.get("user_create").toString());
				 permission.setUser_update(logonUser);
				 permission.setTime_create((Timestamp) map.get("time_create"));
				 permission.setTime_update(DateUtil.getCurrentTime());
				 
				 permissionDAO.update(permission);
				 
			}else {
				Page page = pageDAO.findById(Id_page);
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(page.getPage_id());
				 permission.setPage_name(page.getPage_name());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active("1");
				 permission.setPage_active("0");
				 permission.setView("0");
				 permission.setCreate_update("0");
				 permission.setDelete_role(pmt_delete);
				 permission.setApprove("0");
				 permission.setUser_create(logonUser);
				 permission.setUser_update(logonUser);
				 permission.setTime_create(DateUtil.getCurrentTime());
				 permission.setTime_update(DateUtil.getCurrentTime());
				permissionDAO.save(permission);
			}
			
			// log.debug(page);
			 
			/* permission.setDelete_role(pmt_delete);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);
			// log.debug(pageList);*/
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	}
	public String changeApprove() {
		try { 
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getSys_user_id(); // Username login
			
			Permission permission= new Permission();
			String Id_permission = request.getParameter("permission_Id").equals("")?"0":request.getParameter("permission_Id");
			Integer idValue = Integer.valueOf(Id_permission);
			log.debug(idValue);
			String Id_page = request.getParameter("pId");
			log.debug(Id_page);
			String Id_role = request.getParameter("roleId");
			log.debug(Id_role);
			String pmt_approve = request.getParameter("Approve");
			log.debug(pmt_approve);
			
			List<Map<String, Object>> permissionList = permissionDAO.findPermissionBypageId(Id_page, Id_role);
			
			 if (permissionList.size() > 0) {
				 Map<String, Object> map  = (Map<String, Object>) permissionList.get(0);
				 
				log.debug("here: "+"hello world");
				log.debug(map.get("page_name"));
				 permission.setPermission_id((BigInteger) map.get("permission_id"));
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(Id_page);
				 permission.setPage_name(map.get("page_name").toString());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active(map.get("page_group_active").toString());
				 permission.setPage_active(map.get("page_active").toString());
				 permission.setView(map.get("view").toString());
				 permission.setCreate_update(map.get("create_update").toString());
				 permission.setDelete_role(map.get("delete_role").toString());
				 permission.setApprove(pmt_approve);
				 permission.setUser_create(map.get("user_create").toString());
				 permission.setUser_update(logonUser);
				 permission.setTime_create((Timestamp) map.get("time_create"));
				 permission.setTime_update(DateUtil.getCurrentTime());
				 
				 permissionDAO.update(permission);
				 
			}else {
				Page page = pageDAO.findById(Id_page);
				 permission.setSys_role_id(Id_role);
				 permission.setPage_id(page.getPage_id());
				 permission.setPage_name(page.getPage_name());
				 //permission.setDescription(map.get("description").toString());
				 permission.setPage_group_active("1");
				 permission.setPage_active("0");
				 permission.setView("0");
				 permission.setCreate_update("0");
				 permission.setDelete_role("0");
				 permission.setApprove(pmt_approve);
				 permission.setUser_create(logonUser);
				 permission.setUser_update(logonUser);
				 permission.setTime_create(DateUtil.getCurrentTime());
				 permission.setTime_update(DateUtil.getCurrentTime());
				permissionDAO.save(permission);
			}
			
			
			// log.debug(page);
			 
			/* permission.setApprove(pmt_approve);
			 permission.setUser_update(logonUser);
			 permission.setTime_update(DateUtil.getCurrentTime());
			
			 permissionDAO.update(permission);
			 
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permission);
			 request.setAttribute("json", json);
			// log.debug(pageList);*/
		   return SUCCESS;
	}catch(Exception e) {
		
		
		return ERROR;
		
		}
	}
	public String changeStatus() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login log.debug(ur);
			String logonUser = ur.getSys_user_id(); // Username login
			
			Permission permission =new Permission();
			String id_page_group = request.getParameter("page_group_id");
			log.debug(id_page_group);
			String id_sys_role = request.getParameter("sys_role_id");
			log.debug(id_sys_role);
			String page_status = request.getParameter("status");
			log.debug(page_status);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			String datenow = sdf.format(timestamp).toString();
			Timestamp nowdate = Timestamp.valueOf(datenow);
			log.debug(nowdate);
			List<Permission> permissionList=permissionDAO.updateStatus(id_sys_role, id_page_group, page_status, logonUser);
			// permission.setUser_update(logonUser);
			// permission.setTime_update(DateUtil.getCurrentTime());
			
			
			 

			
			 Gson gson = new GsonBuilder().setPrettyPrinting().create();
			 String json = gson.toJson(permissionList);
			 request.setAttribute("json", json);
			
			return SUCCESS;
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
}
