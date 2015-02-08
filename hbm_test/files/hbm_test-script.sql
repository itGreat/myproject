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


-- 
-- 1 计算金额的四舍五入  round()
SELECT round(15.79) "Truncate" FROM DUAL; -- 16
-- 2 计算金额,末尾不做四舍五入 trunc()
SELECT TRUNC(15.79,0) "Truncate" FROM DUAL; -- 15

-- 3 日期函数 sysdate 获取系统当前时间
select sysdate from dual;
select to_char(sysdate,'yyyy-MM-dd') 当前日期 from dual;
-- 4 虚表 dual Oracle 提供最小工作表，只有一行一列，就有某些特殊功能

-- 5 计算员工入职多少天？
select t.ename,t.hiredate,(sysdate - t.hiredate) 入职天数 from emp t;

select to_number(to_date('2005-03-29 12:30:45', 'yyyy-mm-dd hh24:mi:ss') - to_date('1970-01-01 8:0:0', 'yyyy-mm-dd hh24:mi:ss')) * 24 * 60 * 60 * 1000   from dual;  
-- 6 计算员工入职多少个月？带有小数表示
select t.ename,to_char(t.hiredate,'yyyy-mm-dd'),trunc((sysdate - t.hiredate)/30,2) from emp t;
select t.ename,to_char(t.hiredate,'yyyy-mm-dd'),months_between(sysdate,t.hiredate) 入职月数 from emp t;

-- 7 计算员工入职多少个月？整数表示
select t.ename,to_char(t.hiredate,'yyyy-MM-dd'),trunc(months_between(sysdate,t.hiredate),0) 入职月数 from emp t;

-- 8 计算12个月之前的时间点
select to_char(add_months(sysdate,-12),'yyyy-MM-dd') from dual;
select to_char(add_months(sysdate,12),'yyyy-MM-dd') from dual;

-- 9 计算本月最后一天
select to_char(last_day(sysdate),'yyyy-MM-dd') from dual;

-- 10 把时间数据按指定格式输出 尝试三种以上格式(了解常用日期格式)
-- yyyy年MM月dd日 星期x
select to_char(sysdate,'yyyy') || '年' || to_char(sysdate,'MM') || '月' || to_char(sysdate,'dd') from dual;
SELECT TO_CHAR(SYSDATE, 'YYYY"年"MM"月"DD"日" day') 具体日期信息 FROM dual;
-- yyyy-MM-dd HH:mm
select to_char(sysdate,'yyyy-MM-dd HH:mm') 当前日期和时间 from dual;

--了解千年虫问题
早些时候的计算机系统存储年只用了两位

-- 11 插入一条数据，编号为1012,姓名amy,入职时间为当前时间
insert into emp(empno,ename,hiredate) values ('1012','amy',sysdate);

-- 12 插入一条数据，编号为1013,姓名amy2,入职时间为2011-01-02
insert into emp(empno,ename,hiredate) values ('1013','amy2',to_date('2011-01-02','yyyy-MM-dd'));
select to_date('2011-01-02','yyyy-MM-dd') from dual;
select * from emp t;
-- 13 按指定时间格式插入emp数据 salgrade

-- 14 按指定格式显示员工姓名和入职时间，显示格式： amy 2011-01-01
select t.ename 姓名,to_char(t.hiredate,'yyyy-MM-dd') 时间 from emp t;

-- 15 coalesce() 计算员工的年终奖
select * from bonus t
select t.ename, t.sal  from emp t
select t.ename,coalesce(t.sal,100) from emp t

-- 16 case语句是数据中分支语句 根据员工的职位，计算加薪后的薪水数据
select t.ename,t.job,t.sal from emp t;
select t.ename,case t.job 
       when 'CLERK' then 300 
       when 'SALESMAN' then 300
       when 'PRESIDENT' then 1000
       when 'MANAGER' then 500
       when 'ANALYST' then 600 
        else 100 end 
      from emp t;
      
 select t.ename,
   case t.job 
       when 'CLERK' then t.sal * 0.3 
       when 'SALESMAN' then t.sal *  0.3
       when 'PRESIDENT' then t.sal * 0.3
       when 'MANAGER' then t.sal * 0.3
       when 'ANALYST' then t.sal * 0.3 
       else 100 
   end 
from emp t;

-- 17 decode() 根据员工的职位，计算加薪后的薪水数据
select t.ename,t.sal,t.job,
       decode(t.job,'CLERK',t.sal * 1.3,
                    'SALESMAN',t.sal * 1.3,
                    'PRESIDENT',t.sal * 1.3,
                    'MANAGER',t.sal * 1.3,
                    'ANALYST',t.sal * 1.3,
       t.sal) new_sal
from emp t;      

-- 18 薪水由低到高排序(升序排列)
select t.ename,t.sal from emp t order by t.sal asc

-- 19 薪水由高到低排序(降序排列)
select t.ename,t.sal from emp t order by t.sal desc

-- 20 按入职时间排序，入职时间越早排在前面 
select t.ename,to_char(t.hiredate,'yyyy-MM-dd') from emp t order by t.hiredate asc

-- 21 了解select语句执行顺序
如：select t.ename,t.sal from emp t where t.deptno = 30 order by t.sal asc
1)from 表 select t.* from emp t
2)查询 列  select t.ename,t.sal from emp t;
3)where条件 select t.ename,t.sal from emp t where t.deptno = 30 
4)order by子句 select t.ename,t.sal from emp t where t.deptno = 30 order by t.sal asc

-- 22 员工表中有多少条记录
select count(*) from emp;
select count(1) from emp;

-- 23 查询当前账号下有多少个表
select count(*) from user_tables;

-- 24 当前账号下有多少个名字包含emp的表
select * from user_tables t where t.TABLE_NAME like '%EMP%'

-- 25 入职时间不是null的数据总数
select count(*) from emp t where t.hiredate is not null;
select count(t.hiredate) from emp t; -- count(t.hiredate) 忽略空值

-- 26 查看当前登陆用户
-- sqlplus命令 
show user
-- sql语句
select user from dual;

-- 25组函数 count() avg() sum() max()  min() () 

-- 1) 计算员工的薪水总和是多少
select sum(t.sal) 员工薪水总和 from emp t;
select * from emp t where t.sal is null
-- 2) 计算员工的人数总和、薪水总和、平均薪水是多少
select count(t.empno) 人数总和,sum(t.sal) 薪水总和,trunc(avg(nvl(t.sal,0)),1)  平均薪水 from emp t;
注意：
1) 组函数 count()/max()/min()/sum()/avg() 会忽略空值计算
2) avg/sum 只能用于数字技术
3) max/min 用于任何数据类型
-- 3) 计算员工的最高薪水和最低薪水 ?
select max(t.sal),min(t.sal) from emp t;

-- 4) 计算最早和最晚的员工入职时间
select to_char(min(t.hiredate),'yyyy-mm-dd') 最早入职,to_char(max(t.hiredate),'yyyy-mm-dd') 最晚入职 from emp t;

-- 5)  比较组函数和单行函数 round() to_date() to_char() coalesce()

--  分组查询 group by
-- 1) 按部门计算每个部门的最高和最低薪水分别是多少
select  t.deptno,max(t.sal),min(t.sal) from emp t where t.deptno is not null
group by t.deptno;
       
select * from dept 
 
-- 2) 计算每个部门的 薪水总和 和 平均薪水
select sum(t.sal),avg(nvl(t.sal,0)) from emp t
group by t.deptno;

-- 3) 每个部门的统计信息 统计格式 deptno max_s min_s sum_s avg_s emp_num
select t.deptno deptno,
       max(t.sal) max_s,
       min(t.sal) min_s,
       sum(t.sal) sum_s,
      trunc(avg(nvl(t.sal,0)),1) avg_s,
       count(t.empno) emp_num
 from emp t where t.deptno is not null
 group by t.deptno;

-- 4) 按职位分组，每个职位的最高，最低薪水和人数

-- having 子句
-- 1) 平均薪水大于5000 元的部门数据，没有部门的不算在内

-- 2) 薪水总和大于20000元的部门数据

-- 3) 那些职位的人数超过2个人

--  子查询
-- 1) 最低薪水的是谁

-- 2) 最高薪水的是谁

