package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Notice;
import service.CustomerService;


@WebServlet("/customer/notice/list")
public class NoticeList extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int pageNo = 1;
		String field = "title";
		String query = "";
		
		String pageNo_ = request.getParameter("p");
		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		
		if (pageNo_ != null && !pageNo_.equals(""))
			pageNo = Integer.parseInt(pageNo_);
		if (field_ != null && !field_.equals(""))
			field = field_;
		if (query_ != null && !query_.equals(""))
			query = query_;
		
		CustomerService service = new CustomerService();
		
		//list °´Ã¼ »ý¼º
		
		List<Notice> list = null;
		int count = 0;
		try {
			list = service.getNoticeList(field, query, pageNo);
			count = service.getNoticeCount(field, query);
		} catch (ClassNotFoundException | SQLException e1) {
			e1.printStackTrace();
		}
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("field", field);
		request.setAttribute("query", query);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customer/notice/list.jsp");
		dispatcher.forward(request, response);	
	}
}