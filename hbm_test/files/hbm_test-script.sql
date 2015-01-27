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


-- 计算员工的名字、月薪和年薪？
SELECT t.ename 姓名,t.sal 月薪,t.sal*12 年薪 FROM emp t 

-- 插入empno为1213，名称为'吕布'，其余字段为null
INSERT INTO emp(id,empNo,ename) VALUES('1111',1213,'吕布'); 
SELECT * FROM emp t WHERE t.ename = '吕布'

-- 查询emp表员工姓名和职位，如果没有职位，显示'no position' 
SELECT t.ename AS '姓名',IFNULL(t.job,'no position') '职位' FROM emp t

SELECT * FROM emp t WHERE t.job IS NULL

-- 查询emp表员工姓名和入职时间，如果没有入职时间，显示一个默认的时间
SELECT t.ename,IFNULL(t.hiredate,'2011-01-01') FROM emp t

-- 将emp表复制到emp_xxx
-- 机构中有多少种职位
-- 员工分别在那些部门
-- 查询每个部门不重复的职位
-- 薪水高于10000元的员工数据
-- 职位是employee的员工数据
-- 使用lower()、upper()函数
-- 使用 between ... and 关键字查询
-- 1)薪水大于50000并且小于100000的员工数据
-- 2)入职时间在2011年的员工
-- 使用in(列表)
-- 模糊匹配 like %
-- 1)列出职位中包含sales字符的员工数据
-- 2)列出职位中第二个字符是a的员工数据
-- 3)查询数据库中有多少个名字包含'emp'的表
-- 4)查询数据库中有多少个名字以'S_'开口的表
-- is null ,那些员工没有奖金
-- is not null 那些员工有奖金
-- not between ... and ... 薪水不在 50000 至 80000的员工
-- not in(list) 不是部门103和105的员工

-- SQL语言的分类
-- 1) 数据库定义语言（DDL），对数据结构起作用
CREATE
DROP
ALTER
TRUNCATE
-- 2) 数据库操纵语言（DCL）
INSERT
UPDATE
DELETE
-- 3) 数据库查询语言（DQL）
SELECT
-- 4) 事物控制语句（DML）
COMMIT
ROLLBACK
SAVEPOINT
-- 1)