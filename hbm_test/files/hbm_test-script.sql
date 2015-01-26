USE hbm_test;

-- 删除表
DROP TABLE  t_order;
DROP TABLE t_customer;

-- 删除表数据
DELETE FROM t_customer;
DELETE FROM t_order;

-- 查询表数据量
SELECT COUNT(*) FROM t_customer t 
SELECT COUNT(*) FROM t_order t 

-- 查询表
SELECT * FROM t_customer t 
SELECT * FROM t_order

SELECT * FROM t_customer t WHERE t.name LIKE '%王  %';

-- 分页查询
SELECT * FROM t_customer t ORDER BY t.id ASC LIMIT 15,15



/*
11.4.3 分组查询
1 按照姓名分组，统计t_customer表中具有相同姓名的记录的数目
2 按照客户分组，统计每个客户的订单数
3 统计每个客户发出的所有订单的总价
*/
-- t.name,COUNT(t.name)
SELECT  t.name,COUNT(t.name) FROM t_customer t
GROUP BY t.name



-- ----------------------------------------- 

SELECT * FROM dept t ORDER BY t.id DESC;
SELECT * FROM emp t ORDER BY t.id DESC;

SELECT * FROM emp t WHERE t.deptNo = 103 ORDER BY t.id DESC;
SELECT * FROM emp t WHERE t.deptNo = 104 ORDER BY t.id DESC;
SELECT * FROM emp t WHERE t.deptNo = 105 ORDER BY t.id DESC;

SELECT * FROM emp t WHERE t.mgr = (SELECT t.empNo FROM emp t WHERE t.ename= '曹操');
SELECT * FROM emp t WHERE t.mgr = (SELECT t.empNo FROM emp t WHERE t.ename= '刘备');
SELECT * FROM emp t WHERE t.mgr = (SELECT t.empNo FROM emp t WHERE t.ename= '孙权');

--
DELETE FROM dept;
DELETE FROM emp;
 
-- 插入部门数据
INSERT INTO dept(id,deptNo,dname,loc) VALUES(1,101,'销售部','广州');
INSERT INTO dept(id,deptNo,dname,loc) VALUES(2,102,'办公室','广州');
INSERT INTO dept(id,deptNo,dname,loc) VALUES(3,103,'开发部','广州');
INSERT INTO dept(id,deptNo,dname,loc) VALUES(4,104,'维护部','广州');
INSERT INTO dept(id,deptNo,dname,loc) VALUES(5,105,'人事部','广州');

-- 插入Manager数据
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(1,1001,'刘备','2011-08-01','Manager',DEFAULT,10000,3000,104);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(2,1002,'孙权','2008-08-01','Manager',DEFAULT,30000,6000,103);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(3,1003,'曹操','2001-08-01','Manager',DEFAULT,100000,15000,105);

-- 插入Employee数据
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(100,100101,'关羽','2011-08-01','Employee',1001,8000,2800,104);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(102,100102,'张飞','2011-08-01','Employee',1001,7000,2700,104);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(103,100103,'诸葛亮','2013-08-01','Employee',1001,9000,2900,104);

INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(104,100201,'周瑜','2011-08-01','Employee',1002,18000,12800,103);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(105,100202,'鲁肃','2011-08-01','Employee',1002,17000,12700,103);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(106,100203,'张昭','2013-08-01','Employee',1002,19000,12900,103);

INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(107,100301,'郭嘉','2011-08-01','Employee',1003,28000,22800,105);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(108,100302,'典韦','2011-08-01','Employee',1003,27000,22700,105);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(109,100303,'荀彧','2013-08-01','Employee',1003,29000,22900,105);

