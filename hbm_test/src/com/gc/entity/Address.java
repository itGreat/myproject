package com.gc.entity;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author gongchang
 * 描述：
 * 时间：2015年10月3日 下午3:36:06
 */
@Entity
@Table(name="t_address")
public class Address extends ID{
	
	private String addr;

	public Address() {
	}

	public Address(String addr) {
		this.addr = addr;
	}
	
}
