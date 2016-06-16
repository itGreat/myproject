package com.gc.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gc.dao.api.CategoryDao;

@SuppressWarnings("serial")
public class CategoryServletJson extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		CategoryDao dao = new CategoryDao();
		String jsonStr = dao.getCategoryJson();
		System.out.println(jsonStr);
		resp.setContentType("text/plan; charset=utf-8"); //指定文本类型
		resp.getWriter().print(jsonStr);
	}
	
}
