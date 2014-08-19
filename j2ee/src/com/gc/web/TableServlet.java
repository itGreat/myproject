package com.gc.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * @author gongchang
 * 描述：freemarker填充值
 * 时间：2014-8-19 上午11:42:32
 */
public class TableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//1.
		Configuration cfg = new Configuration();
//		cfg.setServletContextForTemplateLoading(this.getServletContext(), "/");
		cfg.setServletContextForTemplateLoading(this.getServletContext(), "/WEB-INF/templates");
		
		//2.
		Map map = new HashMap();
		map.put("key00201", "1");
		map.put("key00202", "Tom");
		map.put("key00203", "this is Tom");
		
		map.put("key00301", "2");
		map.put("key00302", "Jack");
		map.put("key00303", "this is Jack");
		
		Template template = cfg.getTemplate("table.ftl");
		
		resp.setContentType("text/plain; charset=utf-8"); //指定文本类型
		PrintWriter out = resp.getWriter();
		try {
			template.process(map, out);
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doPost(req, resp);
	}
}