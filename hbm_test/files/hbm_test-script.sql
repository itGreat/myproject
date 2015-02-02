USE hbm_test;
show user;

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
CREATE TABLE emp_xxx AS SELECT * FROM emp;
SELECT * FROM emp_xxx;

-- 机构中有多少种职位
SELECT DISTINCT t.job FROM emp t WHERE t.job IS NOT NULL;

-- 员工分别在那些部门 
SELECT DISTINCT d.dname 部门 FROM emp t,dept d WHERE t.deptNo = d.deptNo
SELECT DISTINCT d.dname 部门 FROM emp t LEFT JOIN dept d ON t.deptNo = d.deptNo WHERE t.deptNo IS NOT NULL

-- 查询每个部门不重复的职位
SELECT d.dname,t.job FROM dept d LEFT JOIN emp t ON d.deptNo = t.deptNo WHERE t.deptNo IS NOT NULL
GROUP BY d.dname

-- 薪水高于10000元的员工数据
SELECT * FROM emp t WHERE t.sal > 10000
SELECT * FROM emp t WHERE t.sal < 10000

-- 职位是employee的员工数据
SELECT * FROM emp t WHERE t.job = 'employee'
SELECT * FROM emp t WHERE t.job = 'Employee'

-- 使用lower()、upper()函数
SELECT LOWER(t.job) FROM emp t;
SELECT UPPER(t.job) FROM emp t;

-- 使用 between ... and 关键字查询
-- 1)薪水大于50000并且小于100000的员工数据
SELECT * FROM emp t WHERE t.sal BETWEEN 50000 AND 100000
-- 2)入职时间在2011年的员工
SELECT * FROM emp t WHERE t.hiredate BETWEEN '2011-01-01' AND '2011-12-31'

-- 使用in(列表)
SELECT * FROM emp t WHERE t.job IN('Employee','Manager');

-- 模糊匹配 like %
SELECT * FROM emp t WHERE t.ename LIKE '%张%'
-- 1)列出职位中包含sales字符的员工数据
SELECT * FROM emp t WHERE t.job LIKE '%sales%'
-- 2)列出职位中第二个字符是a的员工数据
SELECT * FROM emp t WHERE t.job LIKE '_a%'
-- 3)查询数据库中有多少个名字包含'emp'的表
SHOW TABLES

-- SELECT * FROM emp t WHERE t.job LIKE '\_%' escape '\';

-- 4)查询数据库中有多少个名字以'S_'开口的表

-- is null ,那些员工没有奖金
SELECT * FROM emp t WHERE t.comm IS NULL
-- is not null 那些员工有奖金
SELECT * FROM emp t WHERE t.comm IS NOT NULL
-- not between ... and ... 薪水不在 10000 至 30000 的员工
SELECT * FROM emp t WHERE t.sal NOT BETWEEN 10000 AND 30000
-- not in(list) 不是部门103和105的员工
SELECT * FROM emp t WHERE t.deptNo NOT IN(103,105)


//1 计算金额的四舍五入 
//round()
//trunc()

//2 计算金额,末尾不做四舍五入

//3 日期函数 sysdate 获取系统当前时间

//4 虚表 dual

//5 计算员工入职多少天？

//6 计算员工入职多少个月？带有小数表示

//7 计算员工入职多少个月？整数表示

//8 计算12个月之前的时间点

//9 计算本月最后一天

//10 把时间数据按指定格式输出 尝试三种以上格式(了解常用日期格式)
// 了解千年虫问题

//11 插入一条数据，编号为1012,姓名amy,入职时间为当前时间

//12 插入一条数据，编号为1012,姓名amy,入职时间为2011-01-02

//13 按指定时间格式插入emp数据

//14 按指定格式显示员工姓名和入职时间，显示格式： amy 2011-01-01

//15 coalesce() 计算员工的年终奖 

//16 case语句是数据中分支语句 根据员工的职位，计算加薪后的薪水数据

//17 decode() 根据员工的职位，计算加薪后的薪水数据

//18 薪水由低到高排序(升序排列)

//19 薪水由高到低排序(降序排列)

//20 按入职时间排序，入职时间越早排在前面

//21 了解select语句执行顺序

//22 员工表中有多少条记录

//23 查询当前账号下有多少个表

//24 当前账号下有多少个名字包含emp的表

//25 入职时间不是null的数据总数

//26 sqlplus命令
show user和 select user from dual;

//25组函数 count() avg() sum() max()  min() () 

//1) 计算员工的薪水总和是多少

//2) 计算员工的人数总和、薪水总和、平均薪水是多少

//3) 计算员工的最高薪水和最低薪水

//4) 计算最早和最晚的员工入职时间

//5)  比较组函数和单行函数 round() to_date() to_char() coalesce()

// 分组查询 group by
//1) 按部门计算每个部门的最高和最低薪水分别是多少
 
//2) 计算每个部门的 薪水总和 和 平均薪水

//3) 每个部门的统计信息

//4) 按职位分组，每个职位的最高，最低薪水和人数

//having 子句
//1) 平均薪水大于5000 元的部门数据，没有部门的不算在内

//2) 薪水总和大于20000元的部门数据

//3) 那些职位的人数超过2个人

// 子查询
//1) 最低薪水的是谁

//2) 最高薪水的是谁

