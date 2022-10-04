package com.cubesofttech.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="sys_user")
public class Sysuser implements Serializable{
	
@Id
@Column(name="sys_user_id")
private String sys_user_id;
@Column(name="title")
private String title;
@Column(name="sys_role_id")
private String sys_role_id;
@Column(name="user_id")
private String user_id;
@Column(name="name")
private String name;
@Column(name="email")
private String email;
@Column(name="phone")
private String phone;
@Column(name="is_active")
private String is_active;
@Column(name="password")
private String password;
@Column(name="user_create")
private String user_create;
@Column(name="user_update")
private String user_update;
@Column(name="time_create")
private java.sql.Timestamp timeCreate;
@Column(name="time_update")
private java.sql.Timestamp timeUpdate;


public String getSys_user_id() {
	return sys_user_id;
}
public void setSys_user_id(String sys_user_id) {
	this.sys_user_id = sys_user_id;
}
public String getSys_role_id() {
	return sys_role_id;
}
public void setSys_role_id(String sys_role_id) {
	this.sys_role_id = sys_role_id;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}


public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getIs_active() {
	return is_active;
}
public void setIs_active(String is_active) {
	this.is_active = is_active;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
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
public java.sql.Timestamp getTimeCreate() {
    return this.timeCreate;
}		
public void setTimeCreate(java.sql.Timestamp timeCreate) {
    this.timeCreate = timeCreate;
}
public java.sql.Timestamp getTimeUpdate() {
    return this.timeUpdate;
}		
public void setTimeUpdate(java.sql.Timestamp timeUpdate) {
    this.timeUpdate = timeUpdate;
}
@Override
public int hashCode() {
	return Objects.hash(email, is_active, name, password, phone, sys_role_id, sys_user_id, timeCreate, timeUpdate,
			title, user_create, user_id, user_update);
}
@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Sysuser other = (Sysuser) obj;
	return Objects.equals(email, other.email) && Objects.equals(is_active, other.is_active)
			&& Objects.equals(name, other.name) && Objects.equals(password, other.password)
			&& Objects.equals(phone, other.phone) && Objects.equals(sys_role_id, other.sys_role_id)
			&& Objects.equals(sys_user_id, other.sys_user_id) && Objects.equals(timeCreate, other.timeCreate)
			&& Objects.equals(timeUpdate, other.timeUpdate) && Objects.equals(title, other.title)
			&& Objects.equals(user_create, other.user_create) && Objects.equals(user_id, other.user_id)
			&& Objects.equals(user_update, other.user_update);
}
@Override
public String toString() {
	return "Sysuser [sys_user_id=" + sys_user_id + ", title=" + title + ", sys_role_id=" + sys_role_id + ", user_id="
			+ user_id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", is_active=" + is_active
			+ ", password=" + password + ", user_create=" + user_create + ", user_update=" + user_update
			+ ", timeCreate=" + timeCreate + ", timeUpdate=" + timeUpdate + "]";
}


}
