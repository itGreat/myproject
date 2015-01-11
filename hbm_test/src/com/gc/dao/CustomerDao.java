package com.gc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gc.dao.api.AbstractDao;
import com.gc.dao.api.IBaseDao;
import com.gc.entity.Customer;

public class CustomerDao extends AbstractDao implements IBaseDao<Customer> {
	

	@Override
	public Customer saveOrUpdate(Customer t) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		session.saveOrUpdate(t);
		ts.commit();
		return t;
	}
	
	public Customer save(Customer t) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		session.save(t);
		ts.commit();
		return t;
	}
	
	public Customer update(Customer t) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		session.update(t);
		ts.commit();
		return t;
	}

	@Override
	public void delete(String id) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		session.delete(session.get(Customer.class, id));
		ts.commit();
	}

	@Override
	public Customer get(String id) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		Customer t = (Customer)session.get(Customer.class, id);
		ts.commit();
		return t;
	}

	@SuppressWarnings("unchecked")
	public List<Customer> findByName(String name) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
//		List<Customer> list = null;
//		session.createSQLQuery(" SELECT * FROM t_customer t WHERE t.name LIKE '%王%'; ").list();
		 List<Customer> list = session.createQuery("From Customer")
//			.setParameter("name", name)
			.list();
		ts.commit();
		return list;
	}

}
