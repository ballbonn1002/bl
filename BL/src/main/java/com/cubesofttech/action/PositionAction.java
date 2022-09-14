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

import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.model.Position;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.dao.DepartmentDAO;
/*import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.Position;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.model.User;*/
import com.cubesofttech.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class PositionAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(PositionAction.class);
	private static final long serialVersionUID = 1L;
	
	 @Autowired public PositionDAO positionDAO;
	
	 @Autowired public DepartmentDAO departmentDAO;
	 

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String Position = "positionList";

	public String list() {
		try {
			
			  List<Position> positionList = positionDAO.findAllPosition();
			  request.setAttribute(Position, positionList);
			 
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);

			return ERROR;
		}
	}

	public String addPosition() {
		try {
			
			  List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment(); request.setAttribute("departmentList",departmentList);
			 
			log.debug(departmentList);
			return SUCCESS;

		} catch (Exception e) {

			return ERROR;
		}
	}

	
	public String checkPositionID() {
		try {
			String id = request.getParameter("position_id");
			Map<String, String> obj = new HashMap<>();
			List<Map<String, Object>> positionId = positionDAO.findPositionId(id);
			Position positionCheck =  positionDAO.findById(id); 
			log.debug(positionId);
			log.debug(positionCheck);
			
			if(positionCheck == null) {
			
				obj.put("flag", "0");
			} else {
		
		
				obj.put("flag", "1");
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
	
	
	public String savePosition() {
		try{
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			log.debug(ur);
			String logonUser = ur.getSys_user_id(); // Username login 

			Position position = new Position();
			String positionId = request.getParameter("positionId");
			String departmentId = request.getParameter("user.departmentId");
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			String prefix = request.getParameter("prefix");
		
			
			String date = request.getParameter("date");
			//String time = request.getParameter("time");
			log.debug(date);
			//log.debug(time);
			
			//Timestamp ts = DateUtil.dateToTimestamp(date, time);
			//log.debug(ts);
			
			Position positionCheck =  positionDAO.findById(positionId); // ทำการหา ID
			if(positionCheck == null){ // Check ว่า Id มีการซ้ำไหม ถ้าไม่ซ้ำ Save
				
				position.setPositionId(positionId);
				position.setDepartmentId(departmentId);
				position.setName(name);
				position.setDescription(description);
				position.setPrefixId(prefix);
				position.setUserCreate(logonUser);
				position.setUserUpdate(logonUser);
				position.setTimeCreate(DateUtil.getCurrentTime());
				position.setTimeUpdate(DateUtil.getCurrentTime());
				//log.debug(position);
				
			positionDAO.save(position);
			}else{ // ถ้าซ้ำ ทำการ Alert โดยสร้าง Flag ไว้ในหน้า department_add
				//String posiCheck = positionCheck.toString();
				//log.debug(posiCheck);
				request.setAttribute("flag", "1");
			}
			//List<Position> positionList = positionDAO.findAllPosition();
			//request.setAttribute(Position, positionList);
			//return SUCCESS;
			
			log.debug(positionCheck);
			Gson gson = new Gson(); 
            String json = gson.toJson(positionCheck); 
           request.setAttribute("json", json);	
           
			return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
	

	public String editPosition(){
		try{
			String positionId = request.getParameter("position_id");
			
			Position positionList = new Position();
			positionList = positionDAO.findById(positionId);
			request.setAttribute(Position, positionList);  
			
			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
		//	String departmentId = request.getParameter("department_id");
		//	Department departmentList = new Department();
		//	departmentList = departmentDAO.findById(departmentId);
			request.setAttribute("departmentList", departmentList);
		//	request.setAttribute("departmentList", departmentList);
			
			
			
			
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}

	public String updatePosition(){
		try{
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login 
			log.debug(ur);
			String logonUser = ur.getSys_user_id(); // Username login 
			
			Position position = new Position();
			
			String positionId = request.getParameter("positionId");
			log.debug(positionId);
			position = positionDAO.findById(positionId);
			

			String departmentId = request.getParameter("departmentId");
			String name = request.getParameter("name");
			String description = request.getParameter("description");

			
			
			
			position.setName(name);
			position.setDepartmentId(departmentId);
			position.setDescription(description);
			position.setTimeUpdate(DateUtil.getCurrentTime());
			position.setUserUpdate(logonUser);
			
			positionDAO.update(position);
			
			Gson gson = new Gson(); 
            String json = gson.toJson(null); 
           request.setAttribute("json", json);	
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}
	}
	public String deletePosition(){
		try{
			String positionId = request.getParameter("position_id");	
			Position position = positionDAO.findById(positionId);
			log.debug(position);
			positionDAO.delete(position);
			List<Position> positionList = positionDAO.findAllPosition();
			request.setAttribute(Position, positionList);
			return SUCCESS;
		}catch (Exception e){
			
			return ERROR;
		}

}
	

}