package com.cubesofttech.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="quotation_address")
public class Quotation_address implements Serializable{
	@Id
	@Column(name="quotation_address_id")
	public Integer quotation_address_id;
	
	@Column(name="company_address_id")
	public String company_address_id;
	
	@Column(name="quotation_id")
	public String quotation_id;
	
	@Column(name="address_name")
	public String address_name;
	
	@Column(name="address")
	public String address;
	
	@Column(name="province")
	public String province;
	
	@Column(name="district")
	public String district;
	
	@Column(name="sub_district")
	public String sub_district;
	
	@Column(name="zip_code")
	public String zip_code;
	
	@Column(name="delivery_check")
	public String delivery_check;
	
	@Column(name="description")
	public String 	description;
	
	@Column(name="user_create")
	public String user_create;
	
	@Column(name="user_update")
	public String user_update;
	
	@Column(name="time_create")
	public Timestamp time_create;
	
	@Column(name="time_update")
	public Timestamp time_update;

	
	
	public Integer getQuotation_address_id() {
		return quotation_address_id;
	}



	public void setQuotation_address_id(Integer quotation_address_id) {
		this.quotation_address_id = quotation_address_id;
	}



	public String getQuotation_id() {
		return quotation_id;
	}



	public void setQuotation_id(String quotation_id) {
		this.quotation_id = quotation_id;
	}



	public String getAddress_name() {
		return address_name;
	}



	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getProvince() {
		return province;
	}



	public void setProvince(String province) {
		this.province = province;
	}



	public String getDistrict() {
		return district;
	}



	public void setDistrict(String district) {
		this.district = district;
	}



	public String getSub_district() {
		return sub_district;
	}



	public void setSub_district(String sub_district) {
		this.sub_district = sub_district;
	}



	public String getZip_code() {
		return zip_code;
	}



	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}



	public String getDelivery_check() {
		return delivery_check;
	}



	public void setDelivery_check(String delivery_check) {
		this.delivery_check = delivery_check;
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



	public String getCompany_address_id() {
		return company_address_id;
	}



	public void setCompany_address_id(String company_address_id) {
		this.company_address_id = company_address_id;
	}



	@Override
	public String toString() {
		return "Quotation_address [quotation_address_id=" + quotation_address_id + ", company_address_id=" + company_address_id + ", quotation_id=" + quotation_id + ", address_name=" + address_name + ", address="+ address
				+ ", province=" + province + ", district=" + district + ", sub_district=" + sub_district + ", zip_code=" + zip_code + ", delivery_check=" + delivery_check + "]";
	}
	

}
