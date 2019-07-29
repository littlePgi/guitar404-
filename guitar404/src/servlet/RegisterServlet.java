package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.UserService;
import service.impl.UserServiceImpl;
import util.CommonUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	private UserService userservice;
	
	public RegisterServlet() {
		userservice= new UserServiceImpl();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String mobil = req.getParameter("mobil");
		String sex = req.getParameter("sex");
		
		// 时间格式化
//		String date = DateFormat.geti("").format(new Date());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm-ss");
		String date = format.format(new Date());
		/* SimpleDateFormat format=new SimpleDateFormat("今天是 "+"yyyy 年 MM 月 dd 日 E HH 点 mm 分 ss 秒");
		 String date = format.format(new Date());*/
		System.out.println(date);
		
		User user = userservice.findByUsername(username);
		if (user!=null && !user.equals("")) {
			req.setAttribute("prompt", "该用户已存在，请重新注册！");
			req.getRequestDispatcher("login-register.jsp").forward(req, resp);
		}else {
			user = new User();
			user.setId(CommonUtil.getUUID());
			user.setUsername(username);
			user.setPassword(password);
			user.setSex(sex);
			user.setDate(date);
			user.setMobil(mobil);
			user.setType(0);
			user.setState(1);
			int row = userservice.create(user);
			if (row>0) {
				req.setAttribute("prompt", "恭喜您注册成功，请在左侧登录！");
				req.getRequestDispatcher("login-register.jsp").forward(req, resp);
			}
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
