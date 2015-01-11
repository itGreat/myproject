package com.gc.dao.api;

/**
 * @author gongchang
 * 描述：
 * 时间：2015年1月9日 下午3:42:16
 */
public interface IBaseDao<T> {
	
	public T saveOrUpdate(T t);
	
	public void delete(String id);
	
	public T get(String id);
}
