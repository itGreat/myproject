package com.gc.test;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import org.junit.Test;

public class InitTest {

	@Test
	public void initTest(){
		Configuration conf = new Configuration();
		conf.configure("hibernate.cfg.xml");
		SessionFactory sessionFactory = conf.buildSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		System.out.println(session);
//		System.out.println("say Hello!");
	}
}
