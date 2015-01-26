package com.gc.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gc.dao.api.AbstractDao;
import com.gc.dao.api.IBaseDao;
import com.gc.entity.Customer;
import com.gc.entity.Dept;

public class DeptDao extends AbstractDao implements IBaseDao<Dept> {

	@Override
	public Dept saveOrUpdate(Dept t) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		session.saveOrUpdate(t);
		ts.commit();
		return t;
	}
	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Dept get(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
