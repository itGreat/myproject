package com.gc.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.Proxy;

/**
 * @author gongchang
 * 描述：客户
 * 时间：2015年1月9日 下午2:47:26
 */
@Entity
@Table(name="t_customer")
//@Proxy(lazy=false)
public class Customer extends ID{
	
	/** 姓名*/
	private String name;
	/** 年龄*/
	private Integer age;
	/** 生日*/
	private Date birthDate;
	/** 订单*/
	private Set<Order> orders = new HashSet<Order>(0);
	
	@Column
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	
	@Column
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
	@OneToMany(fetch=FetchType.LAZY,cascade=CascadeType.ALL,mappedBy="customer")
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
}