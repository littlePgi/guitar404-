package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.UserService;
import service.impl.UserServiceImpl;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet{
	
	private UserService userService;
	
	public UpdateUserServlet() {
		userService = new UserServiceImpl();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("loginUser");
		String mobil = req.getParameter("mobil");
		if (user!=null) {
			user.setMobil(mobil);
			int row = userService.update(user);
			if (row>0) {
				req.setAttribute("prompt", "信息已修改！");
				req.getRequestDispatcher("information?act=list").forward(req, resp);
			}
		}
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
