package com.huddle.dbo;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {

	private HibernateUtils(){}
	
	private static SessionFactory sessionFactory = null;
	
	private static final SessionFactory makeSessionFactory() {
		try {
			if(sessionFactory == null) {
				sessionFactory = new Configuration().configure().buildSessionFactory();
			}
		} catch(Throwable ex){
			ex.printStackTrace();
		}
		return sessionFactory;
	}
	
	public static SessionFactory getSessionFacotry() {
		return makeSessionFactory();
	}
	
}
