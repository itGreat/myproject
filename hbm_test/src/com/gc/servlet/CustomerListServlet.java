package com.gc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gc.dao.CustomerDao;
import com.gc.entity.Customer;
import com.gc.util.PagerUtil;

@SuppressWarnings("serial")
public class CustomerListServlet extends MyHttpServlet{

	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		Integer pageSize =  null != request.getParameter("pageSize") ? Integer.valueOf(request.getParameter("pageSize").toString()) : 15;
		Integer pageNo =  null != request.getParameter("pageNo") ? Integer.valueOf(request.getParameter("pageNo").toString()) : 1;
		
		String keyword =  null != request.getParameter("keyword") ? String.valueOf(request.getParameter("keyword")) : null;
		CustomerDao dao = new CustomerDao();
		List<Customer> list = dao.findPage(pageSize,pageNo,keyword);
		Integer total = dao.findPageTotol(keyword);
		request.setAttribute("list", list);
		request.setAttribute("pageHtml", PagerUtil.getPageHtml(total, pageNo, pageSize));
		forward("/business/customer/customer_list.jsp", request, response);
		
		
	}

	 
}
