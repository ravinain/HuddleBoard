package com.huddle.dbo;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class TestDB {
	static SessionFactory sessionFactory = HibernateUtils.getSessionFacotry();
	
	public static void main(String[] args) {
		System.out.println(sessionFactory);
		
		//Logger logger = Logger.getLogger(TestDB.class.getName());
		//logger.info("test");
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("From "+ Queries.class.getName());
		System.out.println(query.list());
	}
}
