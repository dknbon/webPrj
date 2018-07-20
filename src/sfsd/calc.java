package sfsd;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet("/calc")
public class calc extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		int x = 0;
		int y = 0;
		
		if(request.getMethod().equals("POST"))
		{
		String count_ = request.getParameter("cnt");
		String x_ = request.getParameter("x");
		String y_ = request.getParameter("y");

		if(x_ != null && !x_.equals(""))
			x = Integer.parseInt(x_);
		if(y_ != null && !y_.equals(""))
			y = Integer.parseInt(y_);
		
		HttpSession session = request.getSession();
		session.setAttribute("sum", x+y);
		}
		
		ServletContext application = request.getServletContext();
		application.setAttribute("sum", x+y);
		
		Cookie cookie = new Cookie("sum",String.valueOf(x+y));
		response.addCookie(cookie);
		//cookie.setPath("/sfsd/aaa/ccc/");
		cookie.setMaxAge(60*60*24*30);
		
	      out.write("<!DOCTYPE html>\n");
	      out.write("<html>\n");
	      out.write("<head>\n");
	      out.write("<meta charset=\"UTF-8\">\n");
	      out.write("<title>Insert title here</title>");
	      out.write("</head>");
	      out.write("<body>");
	      out.write("   <form action=\"calc\" method=\"post\">");
	      out.write("    <div>");
	      out.write("        <label>x : </label>");
	      out.write("        <input type=\"text\" name=\"x\" />");
	      out.write("    </div>");
	      out.write("    <div>");
	      out.write("        <label>y : </label>");
	      out.write("        <input type=\"text\" name=\"y\" />");
	      out.write("    </div>");
	      out.write("    <div>");
	      out.write("        sum : "+(x+y));
	      out.write("    </div>");
	      out.write("    <div>");
	      out.write("        <input type=\"submit\" value=\"덧셈\" />");
	      out.write("    </div>");
	      out.write("</form>");
	      out.write("");
	      out.write("<a href=\"mypage\">마이페이지</a>");
	      out.write("</body>");
	      out.write("</html>");
	
	}
	
	

}

