package sfsd;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/mypage")
public class MyPage extends HttpServlet {
	




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		Object ssum = session.getAttribute("sum");
		
		ServletContext application = request.getServletContext();
		Object asum = application.getAttribute("sum");
		Cookie[] cookies = request.getCookies();
		String csum = null;
		for(int i =0; i<cookies.length;i++)
		{
			
			if(cookies[i].getName().equals("sum"))
			{
				csum = cookies[i].getValue();
			}
			
		}
		
		
		
		out.write("application: "+asum+"<br />");
		out.write("session:" +ssum+"<br />");
		out.write("cookie: "+csum+"<br />");
		out.write("<a href = \"calc\">계산하기</a>");
	}
}
