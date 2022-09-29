package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="company")
public class Company implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="company_id")
	public String company_id;
	
	@Column(name="file_id")
	public Integer file_id;
	
	@Column(name="company_code")
	public String company_code;
	
	@Column(name="tax_number")
	public String tax_number;
	
	@Column(name="company_en")
	public String company_en;
	
	@Column(name="company_th")
	public String company_th;
	
	@Column(name="industry")
	public String industry;
	
	@Column(name="status")
	public String status;
	
	@Column(name="is_active")
	public String is_active;
	
	@Column(name="website")
	public String website;
	
	@Column(name="description")
	public String description;
	
	@Column(name="user_create")
	public String user_create;
	
	@Column(name="user_update")
	public String user_update;
	
	@Column(name="time_create")
	public java.sql.Timestamp time_create;
	
	@Column(name="time_update")
	public java.sql.Timestamp time_update;

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	
	public Integer getFile_id() {
		return file_id;
	}

	public void setFile_id(Integer file_id) {
		this.file_id = file_id;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public String getTax_number() {
		return tax_number;
	}

	public void setTax_number(String tax_number) {
		this.tax_number = tax_number;
	}

	public String getCompany_en() {
		return company_en;
	}

	public void setCompany_en(String company_en) {
		this.company_en = company_en;
	}

	public String getCompany_th() {
		return company_th;
	}

	public void setCompany_th(String company_th) {
		this.company_th = company_th;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndusty(String industry) {
		this.industry = industry;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}
	
	public String getIs_active() {
		return is_active;
	}

	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUser_create() {
		return user_create;
	}

	public void setUser_create(String user_create) {
		this.user_create = user_create;
	}

	public String getUser_update() {
		return user_update;
	}

	public void setUser_update(String user_update) {
		this.user_update = user_update;
	}

	public java.sql.Timestamp getTime_create() {
		return time_create;
	}

	public void setTime_create(java.sql.Timestamp time_create) {
		this.time_create = time_create;
	}

	public java.sql.Timestamp getTime_update() {
		return time_update;
	}

	public void setTime_update(java.sql.Timestamp time_update) {
		this.time_update = time_update;
	}
	
	

}
