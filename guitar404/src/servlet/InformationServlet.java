package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Order;
import entity.User;
import service.OrderService;
import service.UserService;
import service.impl.OrderServiceImpl;
import service.impl.UserServiceImpl;

@WebServlet("/information")
public class InformationServlet extends HttpServlet {
	
	private OrderService orderService;
	private UserService userService;
	
	public InformationServlet() {
		orderService = new OrderServiceImpl();
		userService = new UserServiceImpl();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取当前登录的用户
		User user = (User)req.getSession().getAttribute("loginUser");
		
		String act = req.getParameter("act");
		switch (act) {
			case "list":
				List<Order> orderList = orderService.findByIdAll(user.getId());
				req.setAttribute("orderList", orderList);
				req.setAttribute("user", user);
				req.getRequestDispatcher("information.jsp").forward(req, resp);
				break;
			case "password":
				String password = req.getParameter("password");
				String pword = req.getParameter("pword");
				String pwords = req.getParameter("pwords");
				if (user.getPassword().equals(password) || user.getPassword()==password) {
					if (pword.equals(pwords) || pword==password) {
						user.setPassword(pwords);
						int row = userService.update(user);
						if (row>0) {
							req.setAttribute("prompts", "密码修改成功，请重新登录！");
							req.getRequestDispatcher("login-register.jsp").forward(req, resp);
						}
					}else {
						req.setAttribute("prompt", "请确认输入的密码一致！");
						req.getRequestDispatcher("information?act=password").forward(req, resp);
					}
				}
				break;
			case "username":
				
				break;
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
