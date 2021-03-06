package com.gc.dao;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gc.dao.api.AbstractDao;
import com.gc.dao.api.IBaseDao;
import com.gc.entity.Customer;
import com.gc.entity.Order;

@SuppressWarnings("unchecked")
public class CustomerDao extends AbstractDao implements IBaseDao<Customer> {
	

	public void initData(){
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		Long tm = System.currentTimeMillis();
		Random r = new Random();
		String[] names = new String[]{"刘备","关羽","韩遂","刘岱","甘宁","黄忠","贾诩","司马懿","孙策","孙权","郭嘉","曹仁","曹操","李典","孙坚","陈武","陈登","崔琰","丁谧","邓飏"};
		for (int i = 0; i < 1000; i++) {
			Customer t = new Customer();
			t.setAge(r.nextInt(100));
			t.setName(names[ r.nextInt(20)]);
			Date date = new Date();
			date.setTime(tm - r.nextInt(Integer.MAX_VALUE));
			t.setBirthDate(date);
			
			session.save(t);
			
			Order order = new Order();
			order.setCreateDate(new Date());
			order.setContent("生成任务"+i);
			
			order.setCustomer(t );
			session.save(order);
		}
		ts.commit();
	}
	
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
	
	public Customer load(String id) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		Customer t = (Customer)session.load(Customer.class, id);
		ts.commit();
		return t;
	}
	
	/**
	 * @author gongchang
	 * 功能：通过id查询Customer
	 * 时间：2015年1月12日 上午11:22:39
	 */
	public Customer find(String id) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		List<Customer> list = session.createQuery(" select t from Customer t where t.id = :id ")
			.setParameter("id", id)
			.list();
		ts.commit();
		return (null != list && list.size() > 0 ) ? list.get(0) : new Customer();
	}

	/*11.4.3 分组查询
	1 按照姓名分组，统计t_customer表中具有相同姓名的记录的数目
	2 按照客户分组，统计每个客户的订单数
	3 统计每个客户发出的所有订单的总价*/

	
	
	public List<Customer> findByName(String name) {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		List<Customer> list = session.createQuery(" select t From Customer t where t.name like :name ")
			.setParameter("name", "%"+name+"%")
			.list();
		ts.commit();
		return list;
	}

	public List<Customer> findAll() {
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		 List<Customer> list = session.createQuery(" From Customer ").list();
		ts.commit();
		return list;
	}
	
	public List<Customer> findPage(Integer pageSize, Integer pageNo,String keyword) {
		StringBuffer hql = new StringBuffer();
		hql.append(" select t from Customer t where 1=1 ");
		boolean hasLikeName = null != keyword && !"".equals(keyword);
		if(hasLikeName){
			hql.append(" and t.name like :name ");
		}
		hql.append(" order by t.id asc ");
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		Query query = session.createQuery(hql.toString());
		
		if(hasLikeName){
			query.setParameter("name", "%"+keyword+"%");
		}
		
		List<Customer> list = query.setFirstResult( (pageNo * pageSize) - pageSize )
			.setMaxResults(pageSize)
			.list();
		
		ts.commit();
		return list;
	}

	public Integer findPageTotol(String keyword) {
		StringBuffer hql = new StringBuffer();
		hql.append(" select count(t) from Customer t where 1=1 ");
		boolean hasLikeName = null != keyword && !"".equals(keyword);
		if(hasLikeName){
			hql.append(" and t.name like :name ");
		}
		hql.append(" order by t.id asc ");
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		Query query = session.createQuery(hql.toString());
		
		if(hasLikeName){
			query.setParameter("name", "%"+keyword+"%");
		}
		Object result = query.uniqueResult();
		 
		ts.commit();
		return null != result ? Integer.valueOf(result.toString()) : 0;
	}
	
}
