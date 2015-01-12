package com.gc.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gc.dao.api.AbstractDao;
import com.gc.dao.api.IBaseDao;
import com.gc.entity.Order;

public class OrderDao extends AbstractDao implements IBaseDao<Order> {

	@Override
	public Order saveOrUpdate(Order t) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		session.saveOrUpdate(t);
		ts.commit();
		return t;
	}

	@Override
	public void delete(String id) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		session.delete(session.get(Order.class, id));
		ts.commit();
	}

	@Override
	public Order get(String id) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		Order t = (Order)session.get(Order.class, id);
		ts.commit();
		return t;
	}

	 

}
