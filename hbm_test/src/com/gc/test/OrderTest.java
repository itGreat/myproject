package com.gc.test;

import java.util.Date;

import org.junit.Test;

import com.gc.dao.OrderDao;
import com.gc.entity.Customer;
import com.gc.entity.Order;

public class OrderTest {
	
	@Test
	public void saveOrUpdate(){
		OrderDao dao = new OrderDao();
		Order t = new Order();
		t.setCreateDate(new Date());
		t.setContent("test");
		Customer customer = new Customer();
		customer.setId("402880fa4acde10b014acde10d920000");
		t.setCustomer(customer );
		dao.saveOrUpdate(t);
	}
}
