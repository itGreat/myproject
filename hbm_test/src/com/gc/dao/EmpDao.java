package com.gc.dao;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Random;

import com.gc.dao.api.AbstractDao;
import com.gc.dao.api.IBaseDao;
import com.gc.entity.Emp;

public class EmpDao extends AbstractDao implements IBaseDao<Emp> {

	public void initData(){
		
		String[] deptNames = new String[]{"销售部","开发部","财务部","维护部","业务部","办公室"};
		Long tm = System.currentTimeMillis();
		Random r = new Random();
		int empNo = 1000;
		String[] names = new String[]{"Jesse","Jake","Rose","Scott","Tom","Summer","Grace","Saeson","Edmund","Mick","Moses","Porter","Jacob","Jared","Ives","Giles","vGene","Hayden"};
		String[] jobs = new String[]{"Manager","Employee","Coder"};
		
		//Edmund Elmer Elvis Gary  vGene Giles  Hayden Harry  Hobart Ives Jared Jacob Kerr Porter Moses Mick 
		for (int i = 0; i < names.length; i++) {
			Emp emp = new Emp();
			emp.setEmpNo(empNo+i);
			emp.setSal(BigDecimal.valueOf(r.nextInt(3000)));
			emp.setComm(BigDecimal.valueOf(r.nextInt(3000)));
			emp.setEname(names[i]);
			
			Date date = new Date();
			date.setTime(tm - r.nextInt(Integer.MAX_VALUE));
			emp.setHiredate(date);
			
			emp.setJob(jobs[r.nextInt(3)]);
//			emp.setMgr(mgr);
			
		}
		
		//1 保存部门
		
		//2 保存emp
			//分job保存
		
		
	}
	
	@Override
	public Emp saveOrUpdate(Emp t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Emp get(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
