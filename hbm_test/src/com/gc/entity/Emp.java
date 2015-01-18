package com.gc.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author gongchang
 * 描述：员工实体
 * 时间：2015年1月18日 下午9:45:31
 */
@Entity
@Table(name="emp")
public class Emp extends ID {
	/** 员工编码*/
	private Integer empNo;
	/** 员工姓名*/
	private String ename;
	/** 职位*/
	private String job;
	/** 经理*/
	private Integer mgr;
	/** 入职日期*/
	private Date hiredate;
	/** 薪水*/
	private BigDecimal sal;
	/** 奖金*/
	private BigDecimal comm;
	/** 所在部门*/
	private Dept deptNo;
	
	@Column
	public Integer getEmpNo() {
		return empNo;
	}
	public void setEmpNo(Integer empNo) {
		this.empNo = empNo;
	}
	
	@Column
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	
	@Column
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
	@Column
	public Integer getMgr() {
		return mgr;
	}
	public void setMgr(Integer mgr) {
		this.mgr = mgr;
	}
	
	@Column
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	
	@Column
	public BigDecimal getSal() {
		return sal;
	}
	public void setSal(BigDecimal sal) {
		this.sal = sal;
	}
	
	@Column
	public BigDecimal getComm() {
		return comm;
	}
	public void setComm(BigDecimal comm) {
		this.comm = comm;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	public Dept getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(Dept deptNo) {
		this.deptNo = deptNo;
	}
}
