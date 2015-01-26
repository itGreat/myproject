package com.gc.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gc.dao.api.AbstractDao;
import com.gc.dao.api.IBaseDao;
import com.gc.entity.Dept;
import com.gc.entity.Emp;

public class EmpDao extends AbstractDao implements IBaseDao<Emp> {

	public void initData(){
		Session session = getSession();
//		String[] deptNames = new String[]{"销售部","开发部","财务部","维护部","业务部","办公室"};
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("销售部", new String[]{"Jesse","Jake","Rose","Scott"});
		map.put("开发部", new String[]{"Tom","Summer","Grace","Saeson"});
		map.put("财务部", new String[]{"Edmund","Mick","Moses","Porter"});
		map.put("维护部", new String[]{"Jacob","Jared"});
		map.put("业务部", new String[]{"vGene","Hayden"});
		map.put("办公室", new String[]{"John","Mark","Gray","May"});
		//1 初始化部门数据
		Integer deptNo = 100;
		Transaction ts = session.beginTransaction();
		ts.begin();
		for (String dname : map.keySet()) {
			Dept dept = new Dept();
			dept.setDeptNo(deptNo++);
			dept.setDname(dname);
			dept.setLoc("Canton");
			session.save(dept);
		}
		ts.commit();
		
		//2 初始化Manager 
		
		
		//3 初始化Employee
		
		Long tm = System.currentTimeMillis();
		Random r = new Random();
		int empNo = 1000;
//		String[] names = new String[]{"Jesse","Jake","Rose","Scott","Tom","Summer","Grace","Saeson","Edmund","Mick","Moses","Porter","Jacob","Jared","Ives","Giles","vGene","Hayden"};
		for (Entry<String, String[]> e : map.entrySet()) {
			
			String[] names = e.getValue();
			Integer mgr = 0;
			for (int i = 0; i < names.length; i++) {
				Emp emp = new Emp();
				emp.setEmpNo(empNo++);
				emp.setSal(BigDecimal.valueOf(r.nextInt(3000)));
				emp.setComm(BigDecimal.valueOf(r.nextInt(3000)));
				emp.setEname(names[i]);
				emp.setJob("Employee");
//				emp.setMgr(i == 0 ? "Manager" : "Employee");
				
				Date date = new Date();
				date.setTime(tm - r.nextInt(Integer.MAX_VALUE));
				emp.setHiredate(date);
			
			}
		}
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
