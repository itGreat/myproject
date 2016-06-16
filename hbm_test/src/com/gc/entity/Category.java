package com.gc.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * @author gongchang
 * 描述：目录
 * 时间：2015-7-10 上午11:56:18
 */

@Entity
@Table(name="t_category")
public class Category extends ID{
	
	/**目录编码 */
	private String code;
	/**目录名称 */
	private String name;
	/**目录类型*/
	private String type;
	/** 目录顺序*/
	private Integer rank;
	/** 连接*/
	private String url;
	/** 上级目录 */
	private Category parent;
	
	/** 子目录 */
	private Set<Category> children = new HashSet<Category>(0);
	
	@Column(name="code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="rank")
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="parent_id")
	public Category getParent() {
		return parent;
	}
	public void setParent(Category parent) {
		this.parent = parent;
	}
	
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "parent")
	@OrderBy("id asc")
	public Set<Category> getChildren() {
		return children;
	}
	public void setChildren(Set<Category> children) {
		this.children = children;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
