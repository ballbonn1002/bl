package com.cubesofttech.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="quotation")
public class Quotation implements Serializable{
	@Id
	@Column(name="quotation_id")
	public String quotation_id;
	
	@Column(name="company_id")
	public String company_id;
	
	@Column(name="company_name")
	public String company_name;
	
	@Column(name="contact_name")
	public String contact_name;
	
	@Column(name="tax_number")
	public String tax_number;
	
	@Column(name="email")
	public String email;
	
	@Column(name="phone")
	public String phone;
	
	@Column(name="phone_2")
	public String phone_2;
	
	@Column(name="start_date")
	public Date start_date;
	
	@Column(name="end_date")
	public Date end_date;
	
	@Column(name="saleperson")
	public String saleperson;
	
	@Column(name="user_approved")
	public String user_approved;
	
	@Column(name="approved_date")
	public Date approved_date;
	
	@Column(name="reason")
	public String reason;
	
	@Column(name="description")
	public String description;
	
	@Column(name="sub_total")
	public BigDecimal sub_total;
	
	@Column(name="discount")
	public BigDecimal discount;
	
	@Column(name="percent_discount")
	public BigDecimal percent_discount;
	
	@Column(name="additional_discounts")
	public BigDecimal additional_discounts;
	
	@Column(name="tax_type")
	public String tax_type;
	
	@Column(name="percent_tax")
	public BigDecimal percent_tax;
	
	@Column(name="tax")
	public BigDecimal tax;
	
	@Column(name="grand_total")
	public BigDecimal grand_total;
	
	@Column(name="quotation_status")
	public String quotation_status;
	
	@Column(name="user_create")
	public String user_create;
	
	@Column(name="user_update")
	public String user_update;
	
	@Column(name="time_create")
	public Timestamp time_create;
	
	@Column(name="time_update")
	public Timestamp time_update;

	public String getQuotation_id() {
		return quotation_id;
	}

	public void setQuotation_id(String quotation_id) {
		this.quotation_id = quotation_id;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getContact_name() {
		return contact_name;
	}

	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}

	

	public String getTax_number() {
		return tax_number;
	}

	public void setTax_number(String tax_number) {
		this.tax_number = tax_number;
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

	public String getPhone_2() {
		return phone_2;
	}

	public void setPhone_2(String phone_2) {
		this.phone_2 = phone_2;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getSaleperson() {
		return saleperson;
	}

	public void setSaleperson(String saleperson) {
		this.saleperson = saleperson;
	}

	public String getUser_approved() {
		return user_approved;
	}

	public void setUser_approved(String user_approved) {
		this.user_approved = user_approved;
	}

	public Date getApproved_date() {
		return approved_date;
	}

	public void setApproved_date(Date approved_date) {
		this.approved_date = approved_date;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getSub_total() {
		return sub_total;
	}

	public void setSub_total(BigDecimal sub_total) {
		this.sub_total = sub_total;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public BigDecimal getPercent_discount() {
		return percent_discount;
	}

	public void setPercent_discount(BigDecimal percent_discount) {
		this.percent_discount = percent_discount;
	}

	public BigDecimal getAdditional_discounts() {
		return additional_discounts;
	}

	public void setAdditional_discounts(BigDecimal additional_discounts) {
		this.additional_discounts = additional_discounts;
	}

	public String getTax_type() {
		return tax_type;
	}

	public void setTax_type(String tax_type) {
		this.tax_type = tax_type;
	}

	public BigDecimal getPercent_tax() {
		return percent_tax;
	}

	public void setPercent_tax(BigDecimal percent_tax) {
		this.percent_tax = percent_tax;
	}

	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}

	public BigDecimal getGrand_total() {
		return grand_total;
	}

	public void setGrand_total(BigDecimal grand_total) {
		this.grand_total = grand_total;
	}
	public String getQuotation_status() {
		return quotation_status;
	}

	public void setQuotation_status(String quotation_status) {
		this.quotation_status = quotation_status;
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
		return "Quotation [quotation_id=" + quotation_id + ", company_id=" + company_id + ", company_name=" + company_name + ", contact_name="+ contact_name
				+ ", tax_number=" + tax_number + ", email=" + email+ ", saleperson=" + saleperson 
				+ ", phone=" + phone + ", phone_2=" + phone_2 + ", start_date=" + start_date + ", end_date=" + end_date 
				+ ", user_approved=" + user_approved + ", approved_date=" + approved_date + ", reason=" + reason + ", description=" + description 
				+ ", sub_total=" + sub_total + ", discount=" + discount + ", percent_discount=" + percent_discount + ", additional_discounts=" + additional_discounts 
				+ ", tax_type=" + tax_type + ", percent_tax=" + percent_tax + ", tax=" + tax + ", grand_total=" + grand_total 
				+ ", quotation_status=" + quotation_status + ", user_create=" + user_create + ", time_create=" + time_create +"]";
	}
	
}
