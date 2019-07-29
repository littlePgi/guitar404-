package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser")!=null) {
			session.removeAttribute("loginUser");
		}
		if (session.getAttribute("loginAdmin")!=null) {
			session.removeAttribute("loginAdmin");
		}
		//注销成功跳转到首页
		response.sendRedirect(request.getContextPath());
	}
}
