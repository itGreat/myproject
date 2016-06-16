package com.gc.dao.api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class CategoryDao extends AbstractDao {

	public String getCategoryJson() {
		String str = "";
		Session session = getSession();
		Transaction ts = session.beginTransaction();
		ts.begin();
		
		String sql = " select  t.id  \"id\", t.parent_id  \"pId\",t.name \"name\" from t_category t order by t.parent_id asc ";			
		SQLQuery query = session.createSQLQuery(sql);
		List<Map<String,String>> list = query
			.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
			.list();
		ts.commit();
		
//		StringBuffer buf = new StringBuffer();
//		buf.append( "[" );
//		for (int i = 0; i < list.size(); i++) {
//			Map<String, String> map = list.get(i);
//			buf.append( JSONObject.toJSON(map).toString() );
//			if(i != (list.size() - 1)){
//				buf.append( "," );
//			}
//		}
//		buf.append( "]" );
//		str = buf.toString();
			
		str = JSONArray.toJSON(list).toString();
		return str;
	}
	
}
