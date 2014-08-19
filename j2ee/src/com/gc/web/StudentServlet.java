package com.gc.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
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
 * 描述：模板导出word
 * 时间：2014-8-19 上午11:42:05
 */
public class StudentServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Configuration cfg = new Configuration();
		cfg.setDefaultEncoding("UTF-8");
		cfg.setServletContextForTemplateLoading(this.getServletContext(), "/WEB-INF/templates");

		Map map = new HashMap();
		map.put("key001", "刘备");
		map.put("key002", "47");
		map.put("key003", "汉景帝玄孙");

		Template template = cfg.getTemplate("student.ftl");
		try {
			// 文件路径
			String filePath = this.getServletContext().getRealPath("/")
					+ "upload";

			long mi = System.currentTimeMillis();
			// 文件唯一名称
			String fileName = "student"+mi+".doc";
			File outFile = new File(filePath + File.separator + fileName);

			// 如果输出目标文件夹不存在，则创建
			if (!outFile.getParentFile().exists()) {
				outFile.getParentFile().mkdirs();
			}

			// 将模板和数据模型合并生成文件
			Writer writer = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(outFile), "UTF-8"));

			template.process(map, writer);
			// 关闭流
			writer.flush();
			writer.close();
			
			PrintWriter out = resp.getWriter();
			out.print("success");
			out.close();
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
