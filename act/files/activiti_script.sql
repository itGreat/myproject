SELECT * FROM t_oa_leave t WHERE t.id = '40283a8148824194014882424d190000'

--
SELECT * FROM act_ge_bytearray;
--
SELECT * FROM act_re_deployment;
--
SELECT * FROM act_re_procdef;
SELECT * FROM act_re_deployment;
SELECT * FROM act_ge_bytearray;
SELECT * FROM act_ru_identitylink;
SELECT * FROM act_hi_procinst;
SELECT * FROM act_re_procdef;
SELECT * FROM act_ru_execution;
SELECT * FROM act_ru_task;
SELECT * FROM act_ru_task t WHERE t.id_ = 804;
SELECT * FROM act_ru_task t WHERE  t.ASSIGNEE_ = 'jshuz' 
SELECT * FROM act_id_user;

SELECT
  t.ID_       'activitiTaskId',
  t.ASSIGNEE_ 'assignee',
  t.NAME_     'taskType',
  l.id        'leaveId',
  l.reason    'reason',
  l.uname     'uname'
FROM act_ru_task t
  LEFT JOIN t_oa_leave l
    ON t.ID_ = l.activitiTaskId
WHERE t.ASSIGNEE_ = 'jshuz'



 SELECT
        t.ID_ 'activitiTaskId',
        t.ASSIGNEE_ 'assignee',
        t.NAME_ 'taskType',
        l.id 'leaveId',
        l.reason 'reason',
        l.uname 'uname' 
    FROM
        act_ru_task t 
    RIGHT JOIN
        t_oa_leave l 
            ON t.ID_ = l.activitiTaskId  
    WHERE
        t.ASSIGNEE_ = 'jshuz' 

SELECT ta.id_ \"activititaskid\",ta.task_def_key_ \"task_key\",t.id,t.test_type,t.test_substance,t.quantity,t.unit,t.test_org_name" +
				" from tbl_inspect_task t,act_ru_task ta,act_ru_identitylink i " +
				" where t.proc_inst_id=ta.proc_inst_id_ and ta.id_=i.task_id_(+) " +
				" and i.user_id_='"+userId+"'"
SELECT * FROM act_ru_task;
SELECT * FROM act_ru_identitylink;	
SELECT 
 ta.id_ 'activititaskid',
 ta.task_def_key_ 'task_key',
 t.id 'leaveId',
 t.reason 'reason',
 t.uname 'uname' 
	
FROM t_oa_leave t,act_ru_task ta,act_ru_identitylink i
WHERE t.procInstId=ta.proc_inst_id_ AND ta.id_=i.task_id_ 
 AND i.user_id_ ='"+userId+"' 	
 
 SELECT ta.id_ 'activititaskid',ta.task_def_key_ 'task_key',t.procInstId 'procInstId', t.id 'leaveId',  t.reason 'reason',  t.uname 'uname' 
 FROM t_oa_leave t,act_ru_task ta,act_ru_identitylink i 
 WHERE t.procInstId=ta.proc_inst_id_ AND ta.id_=i.task_id_ AND i.user_id_ ='"+userId+"' 
 