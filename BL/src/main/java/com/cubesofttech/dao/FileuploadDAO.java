package com.cubesofttech.dao;

import java.util.List;

import com.cubesofttech.model.Fileupload;

public interface FileuploadDAO {
	
public void save(Fileupload fileupload) throws Exception;
    
    public List<Fileupload> findAll() throws Exception;
    
    public Fileupload findById(String id) throws Exception;
    
    public void update(Fileupload fileupload) throws Exception;
    
    public void delete(Fileupload fileupload) throws Exception;
    
    Integer getMaxId() throws Exception;

	List<Fileupload> findByuser(String user) throws Exception;

	public void deleteByPath(String path) throws Exception;
}
