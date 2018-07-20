package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Notice;
import service.CustomerService;

@WebServlet("/customer/notice/detail")
public class NoticeDetail extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		long id= Long.parseLong(request.getParameter("id"));
		String ctx = request.getContextPath();
		CustomerService service = new CustomerService(); 
		try {
			Notice notice = service.getNoticeDetail(id);
			request.setAttribute("n", notice);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//pageContext.setAttribute("n",notice);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customer/notice/detail.jsp");
		dispatcher.forward(request, response);
	}
	
	
}
