
-- 查询当前数据库中表
SELECT t.table_name FROM information_schema.tables t WHERE t.table_name LIKE '%act\_%'
SELECT * FROM information_schema.tables t


DROP TABLE act_ge_bytearray