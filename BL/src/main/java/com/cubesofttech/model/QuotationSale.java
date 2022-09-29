package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="quotation_sale")
public class QuotationSale implements Serializable{
	@Id
	@Column(name="quotation_sale_id")
	public Integer quotation_sale_id;
	@Column(name="quotation_id")
	public String quotation_id;
	@Column(name="employee_id")
	public String employee_id;
	@Column(name="title_name_en")
	public String title_name_en;
	@Column(name="name_en")
	public String name_en;
	@Column(name="phone")
	public String phone;
	@Column(name="email")
	public String email;
	@Column(name="description")
	public String description;
	@Column(name="user_create")
	public String user_create;
	@Column(name="user_update")
	public String user_update;
	public Integer getQuotation_sale_id() {
		return quotation_sale_id;
	}
	public void setQuotation_sale_id(Integer quotation_sale_id) {
		this.quotation_sale_id = quotation_sale_id;
	}
	public String getQuotation_id() {
		return quotation_id;
	}
	public void setQuotation_id(String quotation_id) {
		this.quotation_id = quotation_id;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getTitle_name_en() {
		return title_name_en;
	}
	public void setTitle_name_en(String title_name_en) {
		this.title_name_en = title_name_en;
	}
	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Timestamp getTime_create() {
		return time_create;
	}
	public void setTime_create(Timestamp time_create) {
		this.time_create = time_create;
	}
	public Timestamp getTime_update() {
		return time_update;
	}
	public void setTime_update(Timestamp time_update) {
		this.time_update = time_update;
	}
	@Column(name="time_create")
	public Timestamp time_create;
	@Column(name="time_update")
	public Timestamp time_update;
}
