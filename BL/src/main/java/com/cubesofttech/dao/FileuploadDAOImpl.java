package com.cubesofttech.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.cubesofttech.model.Fileupload;

@Repository
public class FileuploadDAOImpl implements FileuploadDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Fileupload fileupload) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.save(fileupload);
		session.flush();
		
	}

	@Override
	public List<Fileupload> findAll() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Fileupload> fileList = null;
		try {
			fileList = session.createCriteria(Fileupload.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return fileList;
	}

	@Override
	public Fileupload findById(String id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Fileupload Fileupload = null;
		try {
			Fileupload = (Fileupload) session.get(Fileupload.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return Fileupload;
	}

	@Override
	public void update(Fileupload fileupload) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
		session.update(fileupload);
		session.flush();
	}

	@Override
	public void delete(Fileupload fileupload) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		session.delete(fileupload);
		session.flush();
	}

	@Override
	public Integer getMaxId() throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		Integer maxId = 0;

		try {

			Criteria criteria = session.createCriteria(Fileupload.class).setProjection(Projections.max("file_id"));
			maxId = (Integer) criteria.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			maxId = new Integer(0);

		} finally {

		}
		if (maxId != null) {
			return maxId;
		} else {
			return new Integer(0);
		}
	}

	@Override
	public List<Fileupload> findByuser(String user) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Fileupload> holidayList = null;
		try {

			String sql = "SELECT  * FROM file where user_create='" + user + "'  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(Fileupload.class);

			holidayList = query.list();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// session.close();
		}
		return holidayList;
	}

	@Override
	public void deleteByPath(String path) throws Exception {
		Fileupload fileUpload = (Fileupload) sessionFactory.getCurrentSession()
				.createQuery("from FileUpload where path = :path").setString("path", path).uniqueResult();

		// System.out.println("DELETE [File] ID: " + fileUpload.getFileId());
		delete(fileUpload);
	}
}
