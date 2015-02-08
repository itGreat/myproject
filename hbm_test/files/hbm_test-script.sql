USE hbm_test;
show user;

-- ɾ����
DROP TABLE  t_order;
DROP TABLE t_customer;

-- ɾ��������
DELETE FROM t_customer;
DELETE FROM t_order;

-- ��ѯ��������
SELECT COUNT(*) FROM t_customer t 
SELECT COUNT(*) FROM t_order t 

-- ��ѯ��
SELECT * FROM t_customer t 
SELECT * FROM t_order

SELECT * FROM t_customer t WHERE t.name LIKE '%��  %';

-- ��ҳ��ѯ
SELECT * FROM t_customer t ORDER BY t.id ASC LIMIT 15,15



/*
11.4.3 �����ѯ
1 �����������飬ͳ��t_customer���о�����ͬ�����ļ�¼����Ŀ
2 ���տͻ����飬ͳ��ÿ���ͻ��Ķ�����
3 ͳ��ÿ���ͻ����������ж������ܼ�
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

SELECT * FROM emp t WHERE t.mgr = (SELECT t.empNo FROM emp t WHERE t.ename= '�ܲ�');
SELECT * FROM emp t WHERE t.mgr = (SELECT t.empNo FROM emp t WHERE t.ename= '����');
SELECT * FROM emp t WHERE t.mgr = (SELECT t.empNo FROM emp t WHERE t.ename= '��Ȩ');

--
DELETE FROM dept;
DELETE FROM emp;
 
-- ���벿������
INSERT INTO dept(id,deptNo,dname,loc) VALUES(1,101,'���۲�','����');
INSERT INTO dept(id,deptNo,dname,loc) VALUES(2,102,'�칫��','����');
INSERT INTO dept(id,deptNo,dname,loc) VALUES(3,103,'������','����');
INSERT INTO dept(id,deptNo,dname,loc) VALUES(4,104,'ά����','����');
INSERT INTO dept(id,deptNo,dname,loc) VALUES(5,105,'���²�','����');

-- ����Manager����
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(1,1001,'����','2011-08-01','Manager',DEFAULT,10000,3000,104);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(2,1002,'��Ȩ','2008-08-01','Manager',DEFAULT,30000,6000,103);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(3,1003,'�ܲ�','2001-08-01','Manager',DEFAULT,100000,15000,105);

-- ����Employee����
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(100,100101,'����','2011-08-01','Employee',1001,8000,2800,104);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(102,100102,'�ŷ�','2011-08-01','Employee',1001,7000,2700,104);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(103,100103,'�����','2013-08-01','Employee',1001,9000,2900,104);

INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(104,100201,'���','2011-08-01','Employee',1002,18000,12800,103);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(105,100202,'³��','2011-08-01','Employee',1002,17000,12700,103);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(106,100203,'����','2013-08-01','Employee',1002,19000,12900,103);

INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(107,100301,'����','2011-08-01','Employee',1003,28000,22800,105);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(108,100302,'��Τ','2011-08-01','Employee',1003,27000,22700,105);
INSERT INTO emp(id,empNo,ename,hiredate,job,mgr,sal,comm,deptNo) VALUES(109,100303,'����','2013-08-01','Employee',1003,29000,22900,105);

-- SQL���Եķ���
-- 1) ���ݿⶨ�����ԣ�DDL���������ݽṹ������
CREATE
DROP
ALTER
TRUNCATE
-- 2) ���ݿ�������ԣ�DCL��
INSERT
UPDATE
DELETE
-- 3) ���ݿ��ѯ���ԣ�DQL��
SELECT
-- 4) ���������䣨DML��
COMMIT
ROLLBACK
SAVEPOINT


-- ����Ա�������֡���н����н��
SELECT t.ename ����,t.sal ��н,t.sal*12 ��н FROM emp t 

-- ����empnoΪ1213������Ϊ'����'�������ֶ�Ϊnull
INSERT INTO emp(id,empNo,ename) VALUES('1111',1213,'����'); 
SELECT * FROM emp t WHERE t.ename = '����'

-- ��ѯemp��Ա��������ְλ�����û��ְλ����ʾ'no position' 
SELECT t.ename AS '����',IFNULL(t.job,'no position') 'ְλ' FROM emp t

SELECT * FROM emp t WHERE t.job IS NULL

-- ��ѯemp��Ա����������ְʱ�䣬���û����ְʱ�䣬��ʾһ��Ĭ�ϵ�ʱ��
SELECT t.ename,IFNULL(t.hiredate,'2011-01-01') FROM emp t

-- ��emp���Ƶ�emp_xxx
CREATE TABLE emp_xxx AS SELECT * FROM emp;
SELECT * FROM emp_xxx;

-- �������ж�����ְλ
SELECT DISTINCT t.job FROM emp t WHERE t.job IS NOT NULL;

-- Ա���ֱ�����Щ���� 
SELECT DISTINCT d.dname ���� FROM emp t,dept d WHERE t.deptNo = d.deptNo
SELECT DISTINCT d.dname ���� FROM emp t LEFT JOIN dept d ON t.deptNo = d.deptNo WHERE t.deptNo IS NOT NULL

-- ��ѯÿ�����Ų��ظ���ְλ
SELECT d.dname,t.job FROM dept d LEFT JOIN emp t ON d.deptNo = t.deptNo WHERE t.deptNo IS NOT NULL
GROUP BY d.dname

-- нˮ����10000Ԫ��Ա������
SELECT * FROM emp t WHERE t.sal > 10000
SELECT * FROM emp t WHERE t.sal < 10000

-- ְλ��employee��Ա������
SELECT * FROM emp t WHERE t.job = 'employee'
SELECT * FROM emp t WHERE t.job = 'Employee'

-- ʹ��lower()��upper()����
SELECT LOWER(t.job) FROM emp t;
SELECT UPPER(t.job) FROM emp t;

-- ʹ�� between ... and �ؼ��ֲ�ѯ
-- 1)нˮ����50000����С��100000��Ա������
SELECT * FROM emp t WHERE t.sal BETWEEN 50000 AND 100000
-- 2)��ְʱ����2011���Ա��
SELECT * FROM emp t WHERE t.hiredate BETWEEN '2011-01-01' AND '2011-12-31'

-- ʹ��in(�б�)
SELECT * FROM emp t WHERE t.job IN('Employee','Manager');

-- ģ��ƥ�� like %
SELECT * FROM emp t WHERE t.ename LIKE '%��%'
-- 1)�г�ְλ�а���sales�ַ���Ա������
SELECT * FROM emp t WHERE t.job LIKE '%sales%'
-- 2)�г�ְλ�еڶ����ַ���a��Ա������
SELECT * FROM emp t WHERE t.job LIKE '_a%'
-- 3)��ѯ���ݿ����ж��ٸ����ְ���'emp'�ı�
SHOW TABLES

-- SELECT * FROM emp t WHERE t.job LIKE '\_%' escape '\';

-- 4)��ѯ���ݿ����ж��ٸ�������'S_'���ڵı�

-- is null ,��ЩԱ��û�н���
SELECT * FROM emp t WHERE t.comm IS NULL
-- is not null ��ЩԱ���н���
SELECT * FROM emp t WHERE t.comm IS NOT NULL
-- not between ... and ... нˮ���� 10000 �� 30000 ��Ա��
SELECT * FROM emp t WHERE t.sal NOT BETWEEN 10000 AND 30000
-- not in(list) ���ǲ���103��105��Ա��
SELECT * FROM emp t WHERE t.deptNo NOT IN(103,105)


-- 
-- 1 ���������������  round()
SELECT round(15.79) "Truncate" FROM DUAL; -- 16
-- 2 ������,ĩβ������������ trunc()
SELECT TRUNC(15.79,0) "Truncate" FROM DUAL; -- 15

-- 3 ���ں��� sysdate ��ȡϵͳ��ǰʱ��
select sysdate from dual;
select to_char(sysdate,'yyyy-MM-dd') ��ǰ���� from dual;
-- 4 ��� dual Oracle �ṩ��С������ֻ��һ��һ�У�����ĳЩ���⹦��

-- 5 ����Ա����ְ�����죿
select t.ename,t.hiredate,(sysdate - t.hiredate) ��ְ���� from emp t;

select to_number(to_date('2005-03-29 12:30:45', 'yyyy-mm-dd hh24:mi:ss') - to_date('1970-01-01 8:0:0', 'yyyy-mm-dd hh24:mi:ss')) * 24 * 60 * 60 * 1000   from dual;  
-- 6 ����Ա����ְ���ٸ��£�����С����ʾ
select t.ename,to_char(t.hiredate,'yyyy-mm-dd'),trunc((sysdate - t.hiredate)/30,2) from emp t;
select t.ename,to_char(t.hiredate,'yyyy-mm-dd'),months_between(sysdate,t.hiredate) ��ְ���� from emp t;

-- 7 ����Ա����ְ���ٸ��£�������ʾ
select t.ename,to_char(t.hiredate,'yyyy-MM-dd'),trunc(months_between(sysdate,t.hiredate),0) ��ְ���� from emp t;

-- 8 ����12����֮ǰ��ʱ���
select to_char(add_months(sysdate,-12),'yyyy-MM-dd') from dual;
select to_char(add_months(sysdate,12),'yyyy-MM-dd') from dual;

-- 9 ���㱾�����һ��
select to_char(last_day(sysdate),'yyyy-MM-dd') from dual;

-- 10 ��ʱ�����ݰ�ָ����ʽ��� �����������ϸ�ʽ(�˽ⳣ�����ڸ�ʽ)
-- yyyy��MM��dd�� ����x
select to_char(sysdate,'yyyy') || '��' || to_char(sysdate,'MM') || '��' || to_char(sysdate,'dd') from dual;
SELECT TO_CHAR(SYSDATE, 'YYYY"��"MM"��"DD"��" day') ����������Ϣ FROM dual;
-- yyyy-MM-dd HH:mm
select to_char(sysdate,'yyyy-MM-dd HH:mm') ��ǰ���ں�ʱ�� from dual;

--�˽�ǧ�������
��Щʱ��ļ����ϵͳ�洢��ֻ������λ

-- 11 ����һ�����ݣ����Ϊ1012,����amy,��ְʱ��Ϊ��ǰʱ��
insert into emp(empno,ename,hiredate) values ('1012','amy',sysdate);

-- 12 ����һ�����ݣ����Ϊ1013,����amy2,��ְʱ��Ϊ2011-01-02
insert into emp(empno,ename,hiredate) values ('1013','amy2',to_date('2011-01-02','yyyy-MM-dd'));
select to_date('2011-01-02','yyyy-MM-dd') from dual;
select * from emp t;
-- 13 ��ָ��ʱ���ʽ����emp���� salgrade

-- 14 ��ָ����ʽ��ʾԱ����������ְʱ�䣬��ʾ��ʽ�� amy 2011-01-01
select t.ename ����,to_char(t.hiredate,'yyyy-MM-dd') ʱ�� from emp t;

-- 15 coalesce() ����Ա�������ս�
select * from bonus t
select t.ename, t.sal  from emp t
select t.ename,coalesce(t.sal,100) from emp t

-- 16 case����������з�֧��� ����Ա����ְλ�������н���нˮ����
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

-- 17 decode() ����Ա����ְλ�������н���нˮ����
select t.ename,t.sal,t.job,
       decode(t.job,'CLERK',t.sal * 1.3,
                    'SALESMAN',t.sal * 1.3,
                    'PRESIDENT',t.sal * 1.3,
                    'MANAGER',t.sal * 1.3,
                    'ANALYST',t.sal * 1.3,
       t.sal) new_sal
from emp t;      

-- 18 нˮ�ɵ͵�������(��������)
select t.ename,t.sal from emp t order by t.sal asc

-- 19 нˮ�ɸߵ�������(��������)
select t.ename,t.sal from emp t order by t.sal desc

-- 20 ����ְʱ��������ְʱ��Խ������ǰ�� 
select t.ename,to_char(t.hiredate,'yyyy-MM-dd') from emp t order by t.hiredate asc

-- 21 �˽�select���ִ��˳��
�磺select t.ename,t.sal from emp t where t.deptno = 30 order by t.sal asc
1)from �� select t.* from emp t
2)��ѯ ��  select t.ename,t.sal from emp t;
3)where���� select t.ename,t.sal from emp t where t.deptno = 30 
4)order by�Ӿ� select t.ename,t.sal from emp t where t.deptno = 30 order by t.sal asc

-- 22 Ա�������ж�������¼
select count(*) from emp;
select count(1) from emp;

-- 23 ��ѯ��ǰ�˺����ж��ٸ���
select count(*) from user_tables;

-- 24 ��ǰ�˺����ж��ٸ����ְ���emp�ı�
select * from user_tables t where t.TABLE_NAME like '%EMP%'

-- 25 ��ְʱ�䲻��null����������
select count(*) from emp t where t.hiredate is not null;
select count(t.hiredate) from emp t; -- count(t.hiredate) ���Կ�ֵ

-- 26 �鿴��ǰ��½�û�
-- sqlplus���� 
show user
-- sql���
select user from dual;

-- 25�麯�� count() avg() sum() max()  min() () 

-- 1) ����Ա����нˮ�ܺ��Ƕ���
select sum(t.sal) Ա��нˮ�ܺ� from emp t;
select * from emp t where t.sal is null
-- 2) ����Ա���������ܺ͡�нˮ�ܺ͡�ƽ��нˮ�Ƕ���
select count(t.empno) �����ܺ�,sum(t.sal) нˮ�ܺ�,trunc(avg(nvl(t.sal,0)),1)  ƽ��нˮ from emp t;
ע�⣺
1) �麯�� count()/max()/min()/sum()/avg() ����Կ�ֵ����
2) avg/sum ֻ���������ּ���
3) max/min �����κ���������
-- 3) ����Ա�������нˮ�����нˮ ?
select max(t.sal),min(t.sal) from emp t;

-- 4) ��������������Ա����ְʱ��
select to_char(min(t.hiredate),'yyyy-mm-dd') ������ְ,to_char(max(t.hiredate),'yyyy-mm-dd') ������ְ from emp t;

-- 5)  �Ƚ��麯���͵��к��� round() to_date() to_char() coalesce()

--  �����ѯ group by
-- 1) �����ż���ÿ�����ŵ���ߺ����нˮ�ֱ��Ƕ���
select  t.deptno,max(t.sal),min(t.sal) from emp t where t.deptno is not null
group by t.deptno;
       
select * from dept 
 
-- 2) ����ÿ�����ŵ� нˮ�ܺ� �� ƽ��нˮ
select sum(t.sal),avg(nvl(t.sal,0)) from emp t
group by t.deptno;

-- 3) ÿ�����ŵ�ͳ����Ϣ ͳ�Ƹ�ʽ deptno max_s min_s sum_s avg_s emp_num
select t.deptno deptno,
       max(t.sal) max_s,
       min(t.sal) min_s,
       sum(t.sal) sum_s,
      trunc(avg(nvl(t.sal,0)),1) avg_s,
       count(t.empno) emp_num
 from emp t where t.deptno is not null
 group by t.deptno;

-- 4) ��ְλ���飬ÿ��ְλ����ߣ����нˮ������

-- having �Ӿ�
-- 1) ƽ��нˮ����5000 Ԫ�Ĳ������ݣ�û�в��ŵĲ�������

-- 2) нˮ�ܺʹ���20000Ԫ�Ĳ�������

-- 3) ��Щְλ����������2����

--  �Ӳ�ѯ
-- 1) ���нˮ����˭

-- 2) ���нˮ����˭

