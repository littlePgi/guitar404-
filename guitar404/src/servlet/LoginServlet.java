package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserLogin;
import service.impl.UserLoginImpl;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private UserLogin userLogin;
	public LoginServlet() {
		userLogin = new UserLoginImpl(); 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		//调用userService的方法
		Map<String, Object> resultMap = userLogin.userLogin(username, password);
		if((Boolean)resultMap.get("ok")){
			//判断是否管理员登录
			if(resultMap.get("loginAdmin")!=null){
				//判断成功就保存管理员对象到session中，并跳转到首页
				HttpSession session = req.getSession();
				session.setAttribute("loginAdmin", resultMap.get("loginAdmin"));
				req.setAttribute("admin", "admin");
				req.getRequestDispatcher("indexServlet").forward(req, resp);
				//跳转到首页
//				resp.sendRedirect(req.getContextPath()+"/user/index.jsp");
			}
			//普通用户
			if (resultMap.get("loginUser")!=null) {
				//判断成功就保存用户对象到session中，并跳转到首页
				HttpSession session = req.getSession();
				session.setAttribute("loginUser", resultMap.get("loginUser"));
				req.setAttribute("user", "user");
				req.getRequestDispatcher("indexServlet").forward(req, resp);
				//跳转到首页
//				resp.sendRedirect(req.getContextPath()+"/user/index.jsp");
			}
		}else{
			//登录失败就跳回登录页面，继续登录
			req.setAttribute("error", resultMap.get("error"));
			req.getRequestDispatcher("login-register.jsp").forward(req, resp);
			}
	}
}
