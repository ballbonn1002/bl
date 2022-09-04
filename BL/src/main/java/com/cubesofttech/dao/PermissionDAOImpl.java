package com.cubesofttech.dao;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.apache.log4j.Logger;

import com.cubesofttech.action.PageGroupAction;
import com.cubesofttech.model.Page;
import com.cubesofttech.model.Permission;


@Repository
public class PermissionDAOImpl implements PermissionDAO{
	private static final Logger log = Logger.getLogger(PageGroupAction.class);
	
	@Autowired
    private SessionFactory sessionFactory;

	@Override
	public void save(Permission permission) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.save(permission);
        session.flush();
	}

	@Override
	public List<Map<String, Object>> sequense() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> permission_id = null;
		try {
			String sql = " SELECT permission_id, CONCAT(permission_id) FROM permission  ORDER BY permission_id ASC  ";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permission_id = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permission_id;
	}

	@Override
	public List<Permission> findAll() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "SELECT * FROM permission";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Map<String, Object>> findAllList() throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> permissionList = null;
		try {
			String sql = "SELECT * FROM permission";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> findByPermissionId(String permissionId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<Permission> list = null;
        try {
            
            Criteria cr = session.createCriteria(Permission.class);
            cr.add(Restrictions.eq("permissionId", permissionId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public Permission findById(int permission_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        Permission permission = null;
        try {
            permission = (Permission) session.get(Permission.class, permission_id);

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            //session.close();
        }        
        return permission;
	}

	@Override
	public void update(Permission permission) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.clear();
        session.update(permission);
        session.flush();
        
	}
	
	@Override
	public BigInteger updateorInsert(Permission permission) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.clear();
        session.saveOrUpdate(permission);
        session.flush();
        BigInteger id = permission.getPermission_id();
		return id;
        
	}


	@Override
	public void delete(Permission permission) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        session.delete(permission);
        session.flush();
        //session.close();
	}

	@Override
	public List<Permission> search(String permissionId) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
        List<Permission> list = null;
        try {
            
            Criteria cr = session.createCriteria(Permission.class);
            cr.add(Restrictions.eq("permissionId", permissionId));
            
            list = cr.list();
  
        } catch (Exception e) {
        	e.printStackTrace();
        	return null;

        } finally {

        }
        return list;
	}

	@Override
	public List<Permission> insert(String sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		//String sys = sys_role_id;
		try {
			
			String sql= 	"INSERT INTO permission (page_id, page_name, sys_role_id, user_create, user_update, time_create, time_update) "
							+"SELECT p.page_id, p.page_name, s.sys_role_id, s.user_create, s.user_update, s.time_create, s.time_update "
							+"FROM sys_role s, page p WHERE s.sys_role_id= "+sys_role_id+"";


					
					
			SQLQuery query = session.createSQLQuery(sql);
			//query.setParameter("sys_role_id", sys_role_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
			Log.debug(e);
		}
		return permissionList;
	}

	@Override
	public List<Permission> updateBySysRoleId(String sys_role_id, String page_group_active, String page_active,
			String view, String create_update, String del_role, String approve) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> perList = null;
		//String sys = sys_role_id;
		try {
			
			String sql= 	"UPDATE permission SET page_group_active='"+page_group_active+"',page_active='"+page_active+"',view='"+view+"' "
							+",create_update='"+create_update+"',delete_role='"+del_role+"',approve='"+approve+"' "
							+" WHERE sys_role_id= "+sys_role_id+"";


					
					
			SQLQuery query = session.createSQLQuery(sql);
			//query.setParameter("sys_role_id", sys_role_id);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		}catch (Exception e){
			e.printStackTrace();
			Log.debug(e);
		}
		return perList;
	}

	@Override
	public List<Permission> listPerxPage(String sys_role_id) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "select * from(\r\n"
					+ "select p.page_id as pid, p.is_active, p.is_page, p.page_group_id, p.page_name as pname,p2.*, p.check_view,\r\n"
					+ "p.check_create_update, p.check_delete, p.check_approve,   \r\n"
					+ "(case when p2.sys_role_id is null then '"+sys_role_id+"' else p2.sys_role_id end) as new_id from page p\r\n"
					+ "left join permission p2 on p.page_id = p2.page_id WHERE p.is_active = 1 \r\n"
					+ ") c\r\n"
					+ "where new_id = '"+sys_role_id+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> findBySysRoleId(String sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "SELECT * FROM permission WHERE sys_role_id="+sys_role_id+"";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> testList(String sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "Select permission.permission_id, permission.sys_role_id, permission.page_group_active, page.page_group_id, page_group.group_name, page_group.description, page.page_name, page_group.is_active AS PG_is_active "
					+ "from permission JOIN page ON permission.page_id = page.page_id "
					+ "JOIN page_group ON page_group.page_group_id=page.page_group_id WHERE permission.sys_role_id="+sys_role_id+" GROUP BY page_group.page_group_id";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> updateStatus(String sys_role_id, String page_group_id, String page_group_active,
			String login_user) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "UPDATE permission, page \r\n"
					+ "	 SET permission.page_group_active = '"+page_group_active+"',permission.user_update = '"+login_user+"' \r\n"
					+ "                        \r\n"
					+ "	 WHERE permission.page_id = page.page_id \r\n"
					+ "	 AND page.page_group_id='"+page_group_id+"'\r\n"
					+ "	 AND permission.sys_role_id='"+sys_role_id+"';";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Map<String, Object>> findPermissionBypageId(String id_page, String id_role) throws Exception {
		Session session = this.sessionFactory.getCurrentSession();
		List<Map<String, Object>> permissionList = null;
		try {
			String sql = "SELECT * FROM `permission` WHERE sys_role_id = '"+id_role+"' AND page_id='"+id_page+"'";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			permissionList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public List<Permission> deleteBysysroleId(int sys_role_id) throws Exception {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		List<Permission> permissionList = null;
		try {
			String sql = "DELETE FROM permission WHERE sys_role_id="+sys_role_id+"";
			SQLQuery query = session.createSQLQuery(sql);
			query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			query.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return permissionList;
	}

	@Override
	public Set<String> getPermissionList(String roleId) throws Exception {
		List<Map<String, Object>>  query_listMap = null;

		Set<String> userAuthority = new HashSet<>();
		Session session =  this.sessionFactory.getCurrentSession(); 
		
		try {
			 String  sql = "select pg.page_group_id,pg.group_name,\r\n"
			 		+ "pm.*,\r\n"
			 		+ "concat(pg.group_name,'.',p.page_name) as menu_page\r\n"
			 		+ "from permission pm\r\n"
			 		+ "left join page p on p.page_id = pm.page_id\r\n"
			 		+ "left join page_group pg on pg.page_group_id = p.page_group_id  \r\n"
			 		+ "where sys_role_id = (select sys_role_id  from sys_role sr where name = '"+roleId+"') "
			 		+ "and p.is_active = 1 and pg.is_active = 1 ";
			 
				SQLQuery query = session.createSQLQuery(sql);
				query.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
				query_listMap = query.list();
				
				Iterator itr = query_listMap.iterator();
	            while(itr.hasNext()){
	                Map<String, Object> map  = (Map<String, Object>) itr.next();
	                    String menu_page = (map.get("menu_page").toString()).replaceAll(" ", "_").toLowerCase();
	                    String group_name = (map.get("group_name").toString()).replaceAll(" ", "_").toLowerCase();
	                    
	                    Boolean page_group_active = map.get("page_group_active").toString().equals("1")? true : false;
	                    Boolean page_active = map.get("page_active").toString().equals("1") ? true : false;
	                    Boolean view = map.get("view").toString().equals("1") ? true : false;
	                    Boolean create_update = map.get("create_update").toString().equals("1") ? true : false;
	                    Boolean delete = map.get("delete_role").toString().equals("1") ? true : false;
	                    Boolean approve = map.get("approve").toString().equals("1") ? true : false;
	                    
	                    String sview = ".view";
	                    String screate = ".create_update";
	                    String sdelete = ".delete";
	                    String sapprove = ".approve";
	                    if(page_group_active) {
	                    	if(page_active) {
	                    		userAuthority.add("group." + group_name);
	                    		userAuthority.add(menu_page);
	                    		if(view) {
	                    			userAuthority.add(menu_page + sview);
	                    		}
	                    		if(create_update) {
	                    			userAuthority.add(menu_page + screate);
	                    		}
	                    		if(delete) {
	                    			userAuthority.add(menu_page + sdelete);
	                    		}
	                    		if(approve) {
	                    			userAuthority.add(menu_page + sapprove);
	                    		}
	                    	}
	                    }	                
                } 
			
	} catch (Exception e) {
		e.printStackTrace();
	}	
	return userAuthority;
	}	

	
	
	

	
}
	

