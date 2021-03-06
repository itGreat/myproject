package com.gc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gc.dao.CustomerDao;
import com.gc.entity.Customer;

@SuppressWarnings("serial")
public class CustomerInputServlet extends MyHttpServlet{

	@Override
	protected void service(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		
		String id =  null != request.getParameter("id") ? String.valueOf(request.getParameter("id")) : null;
		
		if(null == id){
			
		}else{
			CustomerDao dao = new CustomerDao();
			Customer model = dao.get(id);
			request.setAttribute("model", model);
		}
		
		forward("/business/customer/customer_input.jsp", request, response);
	}
}
