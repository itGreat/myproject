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
