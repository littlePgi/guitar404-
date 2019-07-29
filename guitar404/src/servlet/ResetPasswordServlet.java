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

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
	
	private UserService userService;
	
	public ResetPasswordServlet() {
		userService = new UserServiceImpl();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String mobil = req.getParameter("mobil");
		User user = userService.findByUsername(username);
		String act = req.getParameter("act");
		switch (act) {
			case "validation":
				if (user!=null&&!user.equals("")) {
					if (mobil.equals(user.getMobil())) {
						req.setAttribute("user", user);
						req.getRequestDispatcher("resetPassword.jsp").forward(req, resp);
					}else {
						req.setAttribute("prompt", "验证信息失败，请重新填写验证信息！");
						req.getRequestDispatcher("reset.jsp").forward(req, resp);
					}
				}
				break;
			case "reset":
				String resetUsername = req.getParameter("username");
				String password = req.getParameter("password");
				String pword = req.getParameter("pword");
				User resetUser = userService.findByUsername(resetUsername);
				if (resetUser!=null) {
					resetUser.setPassword(pword);
					int row = userService.update(resetUser);
					if (row>0) {
						req.setAttribute("reset", "密码重置成功，请登录！");
						req.getRequestDispatcher("login-register.jsp").forward(req, resp);
					}
				}
				break;
			}
		
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
