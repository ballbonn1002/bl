/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.cubesofttech.system;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Weerawat Poompattanapong
 */

public class Constant {
    public static List<String> onlineUserList = new ArrayList<>();
    private String test;
    private String googleApiKey;
    private String webPath;
    private static String webContext;
    private String hrmUrl;
    private String hrmUser;
    private String hrmPassword;
    
	public String getGoogleApiKey() {
		return googleApiKey;
	}

	public void setGoogleApiKey(String googleApiKey) {
		this.googleApiKey = googleApiKey;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	public String getWebPath() {
		return webPath;
	}

	public void setWebPath(String webPath) {
		this.webPath = webPath;
	}

	public static String getWebContext() {
		return webContext;
	}

	public void setWebContext(String webContext) {
		Constant.webContext = webContext;
	}

	public String getHrmUrl() {
		return hrmUrl;
	}

	public void setHrmUrl(String hrmUrl) {
		this.hrmUrl = hrmUrl;
	}

	public String getHrmUser() {
		return hrmUser;
	}

	public void setHrmUser(String hrmUser) {
		this.hrmUser = hrmUser;
	}

	public String getHrmPassword() {
		return hrmPassword;
	}

	public void setHrmPassword(String hrmPassword) {
		this.hrmPassword = hrmPassword;
	}

}
