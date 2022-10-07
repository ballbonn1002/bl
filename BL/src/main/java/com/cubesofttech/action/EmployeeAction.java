package com.cubesofttech.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.DepartmentDAO;
import com.cubesofttech.dao.EmployeeDAO;
import com.cubesofttech.dao.FileuploadDAO;
import com.cubesofttech.dao.PositionDAO;
import com.cubesofttech.model.Company;
import com.cubesofttech.model.Company_address;
import com.cubesofttech.model.Company_contact;
import com.cubesofttech.model.Company_sales;
import com.cubesofttech.model.Department;
import com.cubesofttech.model.Employee;
import com.cubesofttech.model.Fileupload;
import com.cubesofttech.model.Sysuser;
import com.cubesofttech.util.DateUtil;
import com.cubesofttech.util.FileUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeeAction extends ActionSupport {

	private static final Logger log = Logger.getLogger(EmployeeAction.class);
	private static final long serialVersionUID = 1L;

	@Autowired
	public EmployeeDAO employeeDAO;

	@Autowired
	private DepartmentDAO departmentDAO;

	@Autowired
	private PositionDAO positionDAO;

	@Autowired
	public FileuploadDAO fileuploadDAO;

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	public static final String DepartmentList = "departmentList";
	public static final String PositionList = "positionList";
	public static String Employee = "employeeList";

	public File fileUpload;
	private String fileUploadFileName;
	private String filesize;
	private Integer file_ID;

	private String Gender;
	private String titleEN;
	private String nameEN;
	private String nicknameEN;
	private String titleTH;
	private String nameTH;
	private String nicknameTH;
	private String employID;
	private String departmentID;
	private String positionID;
	private String Phone;
	private String Address;
	private String user_isactive;
	private String Email;

	
	public Integer getFile_ID() {
		return file_ID;
	}

	public void setFile_ID(Integer file_ID) {
		this.file_ID = file_ID;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getTitleEN() {
		return titleEN;
	}

	public void setTitleEN(String titleEN) {
		this.titleEN = titleEN;
	}

	public String getNameEN() {
		return nameEN;
	}

	public void setNameEN(String nameEN) {
		this.nameEN = nameEN;
	}

	public String getNicknameEN() {
		return nicknameEN;
	}

	public void setNicknameEN(String nicknameEN) {
		this.nicknameEN = nicknameEN;
	}

	public String getTitleTH() {
		return titleTH;
	}

	public void setTitleTH(String titleTH) {
		this.titleTH = titleTH;
	}

	public String getNameTH() {
		return nameTH;
	}

	public void setNameTH(String nameTH) {
		this.nameTH = nameTH;
	}

	public String getNicknameTH() {
		return nicknameTH;
	}

	public void setNicknameTH(String nicknameTH) {
		this.nicknameTH = nicknameTH;
	}

	public String getEmployID() {
		return employID;
	}

	public void setEmployID(String employID) {
		this.employID = employID;
	}

	public String getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(String departmentID) {
		this.departmentID = departmentID;
	}

	public String getPositionID() {
		return positionID;
	}

	public void setPositionID(String positionID) {
		this.positionID = positionID;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getUser_isactive() {
		return user_isactive;
	}

	public void setUser_isactive(String user_isactive) {
		this.user_isactive = user_isactive;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
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

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public String list() {
		try {
			List<Employee> employeeList = employeeDAO.findAllEmployee();
			request.setAttribute(Employee, employeeList);
			log.debug(employeeList);
			return SUCCESS;
		} catch (Exception e) {
			log.error(e);
			return ERROR;
		}
	}

	public String addEmployee() {
		try {
			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
			request.setAttribute("departmentList", departmentList);
			List<Map<String, Object>> positionList = positionDAO.sequense();
			request.setAttribute("positionList", positionList);
			return SUCCESS;

		} catch (Exception e) {
			return ERROR;
		}
	}

	public String save_employ() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login
			String loginUser = ur.getSys_user_id(); // Username login
			log.debug(ur);
			Employee employee = new Employee();
			String phonee = Phone.replace("-", "");

			if (fileUpload != null) {
				Fileupload file = new Fileupload();
				ServletContext context = request.getServletContext();
				String fileServerPath = context.getRealPath("/");
				double fileSize = Double.parseDouble(filesize);
				log.debug("test" + filesize);
				log.debug("test" + fileUploadFileName);
				String FileSize = FileUtil.getFileSize(fileSize);
				String filename = fileUploadFileName;
				int l = filename.length();
				int split = filename.indexOf(".");
				String name = filename.substring(0, split);
				String type = (String) filename.subSequence(split, l);
				int maxId = fileuploadDAO.getMaxId() + 1;
				FileUtil.upload(fileUpload, fileServerPath + "upload/employee/", maxId + "_" + filename);
				file.setFile_id(maxId);
				file.setName(name);
				file.setSize(FileSize);
				file.setPath("/upload/employee/" + maxId + "_" + filename);
				file.setPage("employee");
				file.setType(type);
				file.setUser_create(loginUser);
				file.setUser_update(loginUser);
				file.setTime_create(DateUtil.getCurrentTime());
				file.setTime_update(DateUtil.getCurrentTime());
				fileuploadDAO.save(file);
				log.debug(file);

				Integer f_id = file.getFile_id();
				employee.setFile_id(f_id);

				employee.setGender(Gender);
				employee.setTitle_name_en(titleEN);
				employee.setName_en(nameEN);
				employee.setNickname_en(nicknameEN);

				employee.setTitle_name_th(titleTH);
				employee.setName_th(nameTH);
				employee.setNickname_th(nicknameTH);

				employee.setEmployee_id(employID);
				employee.setDepartment_id(departmentID);
				employee.setPosition_id(positionID);
				employee.setEmail(Email);
				employee.setPhone(phonee);
				employee.setAddress(Address);
				employee.setEnable(user_isactive);
				log.debug(user_isactive);

				employee.setTime_create(DateUtil.getCurrentTime());
				employee.setTime_update(DateUtil.getCurrentTime());
				employeeDAO.save(employee);
				request.setAttribute("flag", "1");
				List<Employee> employeeList = employeeDAO.findAllEmployee();
				request.setAttribute(Employee, employeeList);

			} else if (fileUpload == null) {
				employee.setFile_id(null);
				employee.setGender(Gender);
				employee.setTitle_name_en(titleEN);
				employee.setName_en(nameEN);
				employee.setNickname_en(nicknameEN);

				employee.setTitle_name_th(titleTH);
				employee.setName_th(nameTH);
				employee.setNickname_th(nicknameTH);

				employee.setEmployee_id(employID);
				employee.setDepartment_id(departmentID);
				employee.setPosition_id(positionID);
				employee.setEmail(Email);
				employee.setPhone(phonee);
				employee.setAddress(Address);
				employee.setEnable(user_isactive);

				employee.setTime_create(DateUtil.getCurrentTime());
				employee.setTime_update(DateUtil.getCurrentTime());
				employeeDAO.save(employee);
			}

			List<Employee> employeeList = employeeDAO.findAllEmployee();
			request.setAttribute(Employee, employeeList);
			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String ChangeCheckBoxemploy() {
		try {
			Employee employee = new Employee();
			String idEmploy = request.getParameter("idEmploy");
			employee = employeeDAO.findById(idEmploy);
			log.debug(idEmploy);
			String Isactive = request.getParameter("Isactive");
			log.debug(Isactive);
			employee.setEnable(Isactive);
			employeeDAO.update(employee);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String json = gson.toJson(employee);
			request.setAttribute("json", json);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String edit_employ() {
		try {

			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getSys_user_id(); // Username login
			String em_id = String.valueOf(employID);
			String id = request.getParameter("id");
			log.debug(employID);
			
			if(id != null && employID == null) {	 
				 List<Map<String, Object>>employee = employeeDAO.findByEmployee_id(id);
				 request.setAttribute("employee", employee);
				 log.debug(employee);
			} else if(employID != null) {
				List<Map<String, Object>>employee = employeeDAO.findByEmployee_id(em_id);
				 request.setAttribute("employee", employee);
				 log.debug(employee);
		}

			List<Map<String, Object>> employeeList = employeeDAO.findByEmployee_id(employID);
			request.setAttribute(Employee, employeeList);
			log.debug(employeeList);
			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
			request.setAttribute("departmentList", departmentList);
			List<Map<String, Object>> positionList = positionDAO.sequense();
			request.setAttribute("positionList", positionList);

			return SUCCESS;

		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String deleteEmployee() {
		try {
			String idEmploy = request.getParameter("employID");
			log.debug(idEmploy);
			Employee employee = new Employee();

			employee = employeeDAO.findById(idEmploy);
			log.debug(employee);
			employeeDAO.delete(employee);
			List<Employee> employeeList = employeeDAO.findAll();
			request.setAttribute(Employee, employeeList);
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String updateEmployee() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login
			String loginUser = ur.getSys_user_id(); // Username login
			log.debug(ur);
			Employee employee = new Employee();
			String phonee = Phone.replace("-", "");

			if (fileUpload != null) {
				Fileupload file = new Fileupload();
				ServletContext context = request.getServletContext();
				String fileServerPath = context.getRealPath("/");
				double fileSize = Double.parseDouble(filesize);
				log.debug("test" + filesize);
				log.debug("test" + fileUploadFileName);
				String FileSize = FileUtil.getFileSize(fileSize);
				String filename = fileUploadFileName;
				int l = filename.length();
				int split = filename.indexOf(".");
				String name = filename.substring(0, split);
				String type = (String) filename.subSequence(split, l);
				int maxId = fileuploadDAO.getMaxId() + 1;
				FileUtil.upload(fileUpload, fileServerPath + "upload/employee/", file_ID + "_" + filename);
				file.setFile_id(file_ID);
				file.setName(name);
				file.setSize(FileSize);
				file.setPath("/upload/employee/" + file_ID + "_" + filename);
				file.setPage("employee");
				file.setType(type);
				file.setUser_create(loginUser);
				file.setUser_update(loginUser);
				file.setTime_update(DateUtil.getCurrentTime());
				fileuploadDAO.update(file);
				log.debug(file);

				Integer f_id = file.getFile_id();
				employee.setFile_id(f_id);

				employee.setGender(Gender);
				employee.setTitle_name_en(titleEN);
				employee.setName_en(nameEN);
				employee.setNickname_en(nicknameEN);

				employee.setTitle_name_th(titleTH);
				employee.setName_th(nameTH);
				employee.setNickname_th(nicknameTH);

				employee.setEmployee_id(employID);
				employee.setDepartment_id(departmentID);
				employee.setPosition_id(positionID);
				employee.setEmail(Email);
				employee.setPhone(phonee);
				employee.setAddress(Address);
				employee.setEnable(user_isactive);
				log.debug(user_isactive);

				employee.setTime_update(DateUtil.getCurrentTime());
				employeeDAO.update(employee);
				request.setAttribute("flag", "1");
				List<Employee> employeeList = employeeDAO.findAllEmployee();
				request.setAttribute(Employee, employeeList);

			} else if (fileUpload == null) {
				employee.setFile_id(null);
				employee.setGender(Gender);
				employee.setTitle_name_en(titleEN);
				employee.setName_en(nameEN);
				employee.setNickname_en(nicknameEN);

				employee.setTitle_name_th(titleTH);
				employee.setName_th(nameTH);
				employee.setNickname_th(nicknameTH);

				employee.setEmployee_id(employID);
				employee.setDepartment_id(departmentID);
				employee.setPosition_id(positionID);
				employee.setEmail(Email);
				employee.setPhone(phonee);
				employee.setAddress(Address);
				employee.setEnable(user_isactive);

				employee.setTime_update(DateUtil.getCurrentTime());
				employeeDAO.update(employee);
			}

			List<Map<String, Object>> departmentList = departmentDAO.fullNameDepartment();
			request.setAttribute("departmentList", departmentList);
			List<Map<String, Object>> positionList = positionDAO.sequense();
			request.setAttribute("positionList", positionList);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String CheckDuplicateEmploy() {
		try {
			Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser"); // Username login
			String logonUser = ur.getSys_user_id(); // Username login
			String idEmploy = request.getParameter("Employee_id");

			Employee employeeCheck = employeeDAO.findById(idEmploy); // ทำการหา ID
			Map<String, String> flag = new HashMap<String, String>();

			if (employeeCheck != null) { // Check ว่า Id มีการซ้ำไหม ถ้าซ้ำ return input
				flag.put("flag", "1");
			} else {
				flag.put("flag", "0");
			}
			log.debug(flag);
			Gson gson = new Gson();
			String json = gson.toJson(flag);
			request.setAttribute("json", json);

			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
