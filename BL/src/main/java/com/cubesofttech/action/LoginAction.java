
package com.cubesofttech.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.PermissionDAO;

import com.cubesofttech.dao.SysuserDAO;


import com.cubesofttech.model.Sysuser;
import com.cubesofttech.service.LoginService;
import com.cubesofttech.system.Constant;
import com.opensymphony.xwork2.ActionSupport;



public class LoginAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	public static final String NODAY = "no_day";
	public static final String EMAIL = "email";

	@Autowired
	private SysuserDAO sysUserDAO;

	@Autowired
	private PermissionDAO permissionDAO;

	@Autowired
	private LoginService loginService;

	String username;
	String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public String autologin() {
		try {
			String userlogin = request.getParameter("username");
			String md5Password = loginService.generateMD5(password);
			if(request.getParameter("remember-me") != null) {
				String remember = request.getParameter("remember-me");
				Cookie cUserlogin = new Cookie("cookuser", userlogin);
				Cookie cMd5Password = new Cookie("cookmd5", md5Password);
				Cookie cRemember = new Cookie("cookrem", remember);
				cUserlogin.setMaxAge(60 * 60 * 24 * 15);
				cMd5Password.setMaxAge(60 * 60 * 24 * 15);
				cRemember.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cUserlogin);
				response.addCookie(cRemember);
				response.addCookie(cMd5Password);
			} else {
				Cookie cUserlogin = new Cookie("cookuser", null);				
				Cookie cMd5Password = new Cookie("cookmd5", null);
				Cookie cRemember = new Cookie("cookrem", null);
				cUserlogin.setMaxAge(0);				
				cMd5Password.setMaxAge(0);
				cRemember.setMaxAge(0);
				response.addCookie(cUserlogin);				
				response.addCookie(cMd5Password);
				response.addCookie(cRemember);
			}
			login();
			return SUCCESS;
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}		
	}
	
	public String login() {
		try {
			String userlogin = request.getParameter("username");
			request.setAttribute("userlogin", userlogin);
			HttpSession session = request.getSession();
			Sysuser user = sysUserDAO.findById(userlogin);
			String md5Password = loginService.generateMD5(password);
			List<Map<String, Object>> userActive = sysUserDAO.sysUserEnable(userlogin);
			
			if (user != null && md5Password.equals(user.getPassword()) && !userActive.isEmpty()) {
				String chkLogin = "sc";
				Cookie cSuccess = new Cookie("cooksc", chkLogin);
				cSuccess.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cSuccess);
				Constant.onlineUserList.add(user.getSys_user_id());

				Set<String> userAuthority = new HashSet<>(); //For contain Role list
				userAuthority = permissionDAO.getPermissionList(user.getSys_role_id());

				session.setAttribute("user", user);
				session.setAttribute("onlineUser", user);
				session.setAttribute("userAuthority", userAuthority);

				Sysuser ur = (Sysuser) request.getSession().getAttribute("onlineUser");
				String logonUser = ur.getSys_user_id();

				
				log.debug(Constant.onlineUserList);
				log.debug(logonUser);
				
				
				return SUCCESS;
			} else {
				Cookie cSuccess = new Cookie("cooksc", null);
				cSuccess.setMaxAge(0);
				response.addCookie(cSuccess);
				return ERROR;
			}

		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}


	

	public String logout() {
		try {
			Cookie cUserlogin = new Cookie("cookuser", null);
			Cookie cMd5Password = new Cookie("cookmd5", null);
			Cookie cRemember = new Cookie("cookrem", null);
			Cookie cSuccess = new Cookie("cooksc", null);
			cUserlogin.setMaxAge(0);
			cMd5Password.setMaxAge(0);
			cRemember.setMaxAge(0);
			cSuccess.setMaxAge(0);
			response.addCookie(cUserlogin);
			response.addCookie(cMd5Password);
			response.addCookie(cRemember);
			response.addCookie(cSuccess);
			request.getSession().invalidate();
			System.out.println(Constant.onlineUserList);
			return SUCCESS;
		} catch (Exception e) {
			log.debug(e);
			return ERROR;
		}
	}
	


}