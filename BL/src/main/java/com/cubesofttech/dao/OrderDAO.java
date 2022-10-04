package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Order;

public interface OrderDAO {
	public void save(Order order) throws Exception;
	
	public void update(Order order) throws Exception;
	
	public void delete(Order order) throws Exception;
	
	public List<Order> findAll() throws Exception;
	
	public Integer getMaxId() throws Exception;
	
	public List<Order> deleteByQuotationId(String quotation_id) throws Exception;

}
