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


//1 ��������������� 
//round()
//trunc()

//2 ������,ĩβ������������

//3 ���ں��� sysdate ��ȡϵͳ��ǰʱ��

//4 ��� dual

//5 ����Ա����ְ�����죿

//6 ����Ա����ְ���ٸ��£�����С����ʾ

//7 ����Ա����ְ���ٸ��£�������ʾ

//8 ����12����֮ǰ��ʱ���

//9 ���㱾�����һ��

//10 ��ʱ�����ݰ�ָ����ʽ��� �����������ϸ�ʽ(�˽ⳣ�����ڸ�ʽ)
// �˽�ǧ�������

//11 ����һ�����ݣ����Ϊ1012,����amy,��ְʱ��Ϊ��ǰʱ��

//12 ����һ�����ݣ����Ϊ1012,����amy,��ְʱ��Ϊ2011-01-02

//13 ��ָ��ʱ���ʽ����emp����

//14 ��ָ����ʽ��ʾԱ����������ְʱ�䣬��ʾ��ʽ�� amy 2011-01-01

//15 coalesce() ����Ա�������ս� 

//16 case����������з�֧��� ����Ա����ְλ�������н���нˮ����

//17 decode() ����Ա����ְλ�������н���нˮ����

//18 нˮ�ɵ͵�������(��������)

//19 нˮ�ɸߵ�������(��������)

//20 ����ְʱ��������ְʱ��Խ������ǰ��

//21 �˽�select���ִ��˳��

//22 Ա�������ж�������¼

//23 ��ѯ��ǰ�˺����ж��ٸ���

//24 ��ǰ�˺����ж��ٸ����ְ���emp�ı�

//25 ��ְʱ�䲻��null����������

//26 sqlplus����
show user�� select user from dual;

//25�麯�� count() avg() sum() max()  min() () 

//1) ����Ա����нˮ�ܺ��Ƕ���

//2) ����Ա���������ܺ͡�нˮ�ܺ͡�ƽ��нˮ�Ƕ���

//3) ����Ա�������нˮ�����нˮ

//4) ��������������Ա����ְʱ��

//5)  �Ƚ��麯���͵��к��� round() to_date() to_char() coalesce()

// �����ѯ group by
//1) �����ż���ÿ�����ŵ���ߺ����нˮ�ֱ��Ƕ���
 
//2) ����ÿ�����ŵ� нˮ�ܺ� �� ƽ��нˮ

//3) ÿ�����ŵ�ͳ����Ϣ

//4) ��ְλ���飬ÿ��ְλ����ߣ����нˮ������

//having �Ӿ�
//1) ƽ��нˮ����5000 Ԫ�Ĳ������ݣ�û�в��ŵĲ�������

//2) нˮ�ܺʹ���20000Ԫ�Ĳ�������

//3) ��Щְλ����������2����

// �Ӳ�ѯ
//1) ���нˮ����˭

//2) ���нˮ����˭

