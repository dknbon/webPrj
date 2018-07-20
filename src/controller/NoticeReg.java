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

@WebServlet("/customer/notice/reg")
public class NoticeReg extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customer/notice/reg.jsp");
		dispatcher.forward(request, response);	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title=request.getParameter("title");
		String content = request.getParameter("content");
		Notice notice = new Notice(title, content,"asdsdfg");
		CustomerService service = new CustomerService();
		try {
			service.insertNotice(notice);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		//목록으로 이동한다.
		response.sendRedirect("list");
		
	}

}
