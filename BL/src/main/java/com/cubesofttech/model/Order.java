package com.cubesofttech.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="quotation_order")
public class Order implements Serializable{
	@Id 
	@Column(name="order_id")
	public Integer order_id;
	
	@Column(name="quotation_id")
	public String quotation_id;
	
	@Column(name="name")
	public String name;
	
	@Column(name="description")
	public String description;
	
	@Column(name="quantity")
	public Integer quantity;
	
	@Column(name="unit_price")
	public BigDecimal unit_price;
	
	@Column(name="total")
	public BigDecimal total;
	
	@Column(name="user_create")
	public String user_create;
	
	@Column(name="user_update")
	public String user_update;
	
	@Column(name="time_create")
	public Timestamp time_create;
	
	@Column(name="time_update")
	public Timestamp time_update;
	
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public String getQuotation_id() {
		return quotation_id;
	}
	public void setQuotation_id(String quotation_id) {
		this.quotation_id = quotation_id;
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
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(BigDecimal unit_price) {
		this.unit_price = unit_price;
	}
	public BigDecimal getTotal() {
		return total;
	}
	public void setTotal(BigDecimal total) {
		this.total = total;
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
	
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", quotation_id=" + quotation_id + ", name=" + name
				+ ", description=" + description + ", quantity=" + quantity
				+ ", unit_price=" + unit_price + ", total=" + total + "]";
	}
	

}
