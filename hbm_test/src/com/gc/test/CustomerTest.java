package com.gc.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Test;

import com.gc.dao.CustomerDao;
import com.gc.entity.Customer;

public class CustomerTest {
	
	@Test
	public void add() throws ParseException {
		CustomerDao dao = new CustomerDao();
		Customer t = new Customer();
		t.setAge(18);
		t.setName("张三");
		t.setBirthDate(new SimpleDateFormat("yyyy-MM-dd").parse("2000-01-01"));
		dao.saveOrUpdate(t);
	}
	
	@Test
	public void update(){
		CustomerDao dao = new CustomerDao();
		Customer customer = dao.get("297eeaad4ad978e1014ad978e7700000");
		customer.setName("王五");
		dao.update(customer);
	}
	
	@Test
	public void delete(){
		CustomerDao dao = new CustomerDao();
		dao.delete("297eeaad4ad83b9d014ad83ba1810000");
	}
	
	@Test
	public void find(){
		CustomerDao dao = new CustomerDao();
		List<Customer> customers = dao.findByName("王");
		for (Customer e : customers) {
			System.out.println("id:"+e.getId()+"\t name:"+e.getName());
		}
	}
	
	@Test
	public void addData(){
		CustomerDao dao = new CustomerDao();
		dao.addData();
	}
	
	@Test
	public void findAll(){
		CustomerDao dao = new CustomerDao();
		dao.findAll();
	}
	
	@Test
	public void get(){
		CustomerDao dao = new CustomerDao();
		dao.get("402880fa4acde10b014acde10d920000");
	}
	
	@Test
	public void load(){
		CustomerDao dao = new CustomerDao();
		dao.load("402880fa4acde10b014acde10d920000");
	}
	
	@Test
	public void find2(){
		CustomerDao dao = new CustomerDao();
		dao.find("402880fa4acde10b014acde10d920000");
	}
}
