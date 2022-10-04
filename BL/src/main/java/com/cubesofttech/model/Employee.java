package com.cubesofttech.model;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Column;

@Entity
@Table(name="employee")
@NamedQueries({
	@NamedQuery(name = "Employee.findAll", query = "SELECT t FROM Employee t")})
public class Employee implements Serializable {

	public Employee() {
    }
    public Employee(
            String employee_id
            , String position_id
            , String department_id
            , String name_en
            , String title_name_en
            , String nickname_en
            , String name_th
            , String title_name_th
            , String nickname_th
            , String phone
            , String address
            , String email
            , String gender
            , String roleId
            , Integer file_id
            , String description
            , String userCreate	
            , String userUpdate	
            , java.sql.Timestamp timeCreate	
            , java.sql.Timestamp timeUpdate	
        ) {
        this.employee_id = employee_id;	
        this.position_id = position_id;
        this.department_id = department_id;	
        this.name_en = name_en;	
        this.title_name_en = title_name_en;	
        this.nickname_en = nickname_en;	
        this.name_th = name_th;	
        this.title_name_th = title_name_th;	
        this.nickname_th = nickname_th;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
        this.role_id = roleId;
        this.file_id = file_id;
        this.description = description;	
        this.user_create = userCreate;	
        this.user_update = userUpdate;	
        this.time_create = timeCreate;	
        this.time_update = timeUpdate;	
    }
    
	@Id
	@Column(name="employee_id")
 	public String employee_id;
	
	@Column(name="department_id")
	public String department_id;
	
	@Column(name="position_id")
	public String position_id;
	
	@Column(name="role_id")
	public String role_id;
	
	@Column(name="file_id")
	public Integer file_id;
	
	@Column(name="gender")
	public String gender;
	
	@Column(name="title_name_en")
	public String title_name_en;
	
	@Column(name="name_en")
	public String name_en;
	
	@Column(name="nickname_en")
	public String nickname_en;
	
	@Column(name="title_name_th")
	public String title_name_th;
	
	@Column(name="name_th")
	public String name_th;
	
	@Column(name="nickname_th")
	public String nickname_th;
	
	@Column(name="phone")
	public String phone;
	
	@Column(name="email")
	public String email;
	
	@Column(name="address_name")
	public String address_name;
	
	@Column(name="address")
	public String address;
	
	@Column(name="province")
	public String province;
	
	@Column(name="district")
	public String district;
	
	@Column(name="subdistrict")
	public String subdistrict;
	
	@Column(name="zip")
	public String zip_code;
	
	@Column(name="enable")
	public String enable;
	
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

	public String getEmployee_id() {
 		return employee_id;
 	}

 	public void setEmployee_id(String employee_id) {
 		this.employee_id = employee_id;
 	}

	public String getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}

	public String getPosition_id() {
		return position_id;
	}

	public void setPosition_id(String position_id) {
		this.position_id = position_id;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public Integer getFile_id() {
		return file_id;
	}
	public void setFile_id(Integer file_id) {
		this.file_id = file_id;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getNickname_en() {
		return nickname_en;
	}

	public void setNickname_en(String nickname_en) {
		this.nickname_en = nickname_en;
	}

	public String getTitle_name_th() {
		return title_name_th;
	}

	public void setTitle_name_th(String title_name_th) {
		this.title_name_th = title_name_th;
	}

	public String getName_th() {
		return name_th;
	}

	public void setName_th(String name_th) {
		this.name_th = name_th;
	}

	public String getNickname_th() {
		return nickname_th;
	}

	public void setNickname_th(String nickname_th) {
		this.nickname_th = nickname_th;
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

	public String getSubdistrict() {
		return subdistrict;
	}

	public void setSubdistrict(String subdistrict) {
		this.subdistrict = subdistrict;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getEnable() {
		return enable;
	}

	public void setEnable(String enable) {
		this.enable = enable;
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