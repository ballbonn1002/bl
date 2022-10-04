package com.cubesofttech.model;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="company_contact")
public class Company_contact implements Serializable{
	@Id
	@Column(name="company_contact_id")
	public Integer company_contact_id;
	
	@Column(name="company_id")
	public Integer company_id;
	
	@Column(name="file_id")
	public Integer file_id;
	
	@Column(name="title_name_en")
	public String title_name_en;
	
	@Column(name="contact_name")
	public String contact_name;
	
	@Column(name="position")
	public String position;
	
	@Column(name="phone")
	public String phone;
	
	@Column(name="email")
	public String email;
	
	@Column(name="address_location")
	public String address_location;
	
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

	
	public Integer getFile_id() {
		return file_id;
	}

	public void setFile_id(Integer file_id) {
		this.file_id = file_id;
	}

	public String getTitle_name_en() {
		return title_name_en;
	}

	public void setTitle_name_en(String title_name_en) {
		this.title_name_en = title_name_en;
	}

	public Integer getCompany_contact_id() {
		return company_contact_id;
	}

	public void setCompany_contact_id(Integer company_contact_id) {
		this.company_contact_id = company_contact_id;
	}

	public Integer getCompany_id() {
		return company_id;
	}

	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
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

	public String getAddress_location() {
		return address_location;
	}

	public void setAddress_location(String address_location) {
		this.address_location = address_location;
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
	

	public String toString() {
        return super.toString() + "id=[" + company_contact_id + "]\n" + "company_id=[" + company_id + "]\n" + "contact_name=[" + contact_name + "]\n" + "position=[" + position + "]\n" + "phone=[" + phone + "]\n"+ "email=[" + email + "]\n" + "address_location=[" + address_location + "]\n"+ "description=[" + description + "]\n";
    }
	
	
}
