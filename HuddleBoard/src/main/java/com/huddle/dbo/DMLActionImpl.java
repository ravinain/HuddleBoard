package com.huddle.dbo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.huddle.util.StringUtils;

public class DMLActionImpl implements DMLAction{

	SessionFactory sessionFactory = HibernateUtils.getSessionFacotry();
	static Logger logger = Logger.getLogger(DMLActionImpl.class.getName());

	/*
	 * (non-Javadoc)
	 * @see com.huddle.dbo.DMLAction#getData(java.util.Map)
	 * @param java.util.Map, tableName key is mandatory - it should contain table name with package structure
	 * 		 filterKey and filterValue are String Array and should contain filter criteria, index of key and value should be same
	 * @return message:fail/success, data: fetched data in java.util.List
	 */
	public Map<String, Object> getData(Map<String, Object> inputData) {
		Session session = sessionFactory.openSession();
		try{
			String tableName = StringUtils.avoidNull(inputData.get("tableName"));
			String []filterKey = (String[])inputData.get("filterKey");
			String []filterValue = (String[])inputData.get("filterValue");
			
			String queryString = "From "+tableName;
					
			if(filterKey != null && filterKey.length >0) {
				queryString += " where 1 = 1 ";
				for(String key:filterKey) {
					queryString += " AND "+key+" = ? ";
				}
			}
			logger.info("Query : "+queryString);
			Query query = session.createQuery(queryString);
			if(filterKey != null && filterKey.length >0) {
				for(int index = 0; index < filterKey.length; index++) {
					query.setParameter(index, filterValue[index]);
				}
			}
			List data = query.list();
			inputData.put("data", data);
			inputData.put("message", "success");
		} catch(Exception ex) {
			inputData.put("message", "fail");
			logger.error(ex.getMessage());
		} finally {
			session.close();
		}
		return inputData;
	}

	public Map<String, Object> insertData(Map<String, Object> inputData) {
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			trans.begin();
			Huddle obj = (Huddle)inputData.get("beanName");
			
			if (!isObjectExists(inputData)) {
				Long autoGenId = (Long)session.save(obj);
				trans.commit();
				inputData.put("message", "success");
				inputData.put("autoGenId", autoGenId);
				logger.info("Inserted Data : "+obj.toString());
			}
			else {
				inputData.put("message", "Data already exists!");
				logger.info("Data already exists! : "+obj.toString());
			}
		} catch(Exception ex) {
			trans.rollback();
			inputData.put("message", "fail");
			logger.info("Inserted Data Fail: "+ex.getMessage());
		} finally {
			session.close();
		}
		return inputData;
	}

	public Map<String, Object> deleteData(Map<String, Object> inputData) {
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			trans.begin();
			Huddle obj = (Huddle)inputData.get("beanName");
System.out.println("obj: "+obj);			
			if (isObjectExists(inputData)) {
				session.delete(obj);
				trans.commit();
				inputData.put("message", "success");
				logger.info("Deleted Data!"); 
			} else {
				inputData.put("message", "Data does not exist!");
				logger.info("Data does not exist! : " + obj.toString()); 
			}
			
		} catch(Exception ex) {
			trans.rollback();
			inputData.put("message", "fail");
			logger.info("Delete Data Fail: "+ex.getMessage());
		} finally {
			session.close();
		}
		return inputData;
	}
 
	public Map<String, Object> updateData(Map<String, Object> inputData) {
		Session session = sessionFactory.openSession();
		Transaction trans = null;
		try {
			trans = session.beginTransaction();
			trans.begin();
			Huddle obj  = (Huddle)inputData.get("beanName");
			
			if (isObjectExists(inputData)) {			
				session.update(obj);
				trans.commit();
				inputData.put("message", "success");
				logger.info("Updated Data!");
			} else {
				inputData.put("message", "Data does not exist!");
				logger.info("Data does not exist!");
			}
		} catch(Exception ex) {
			trans.rollback();
			inputData.put("message", "fail");
			logger.info("Update Data Fail: "+ex.getMessage());
		} finally {
			session.close();
		}
		return inputData;
	}
	
	public boolean isObjectExists(Map<String, Object> inputData) {
		
		Huddle obj  = (Huddle)inputData.get("beanName");
		inputData.put("tableName", obj.getClass().getName());
		
		try {
			getData(inputData);
			if (StringUtils.avoidNull(inputData.get("message")).equals("success") && inputData.get("data") != null 
					 && ((List<Huddle>)inputData.get("data")).size() > 0) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			return false;
		}
	}
}