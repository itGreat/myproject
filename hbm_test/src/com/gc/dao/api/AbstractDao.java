package com.gc.dao.api;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class AbstractDao {

	protected static SessionFactory sessionFactory = null;
	
	static{
		if(null == sessionFactory){
			Configuration conf = new Configuration();
			conf.configure();
			sessionFactory = conf.buildSessionFactory();
		}
	}
	
	public SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
}
