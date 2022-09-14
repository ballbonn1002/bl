package com.cubesofttech.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;

@Entity
@Table(name = "department")

public class Department implements Serializable {
	@Id
	@Column(name = "department_id")
	public String department_id;
	@Column(name = "name")
	public String name;
	@Column(name = "description")
	public String description;
	@Column(name = "prefix_id")
	public String prefix_id;
	@Column(name = "user_create")
	private String usercreate;
	@Column(name = "user_update")
	private String userupdate;
	@Column(name = "time_create")
	private java.sql.Timestamp timeCreate;
	@Column(name = "time_update")
	private java.sql.Timestamp timeUpdate;

	public String getDepartment_id() {
		return department_id;
	}

	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrefix_id() {
		return prefix_id;
	}

	public void setPrefix_id(String prefix_id) {
		this.prefix_id = prefix_id;
	}

	public String getUsercreate() {
		return usercreate;
	}

	public void setUsercreate(String usercreate) {
		this.usercreate = usercreate;
	}

	public String getUserupdate() {
		return userupdate;
	}

	public void setUserupdate(String userupdate) {
		this.userupdate = userupdate;
	}

	public java.sql.Timestamp getTimeCreate() {
		return timeCreate;
	}

	public void setTimeCreate(java.sql.Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}

	public java.sql.Timestamp getTimeUpdate() {
		return timeUpdate;
	}

	public void setTimeUpdate(java.sql.Timestamp timeUpdate) {
		this.timeUpdate = timeUpdate;
	}

}
