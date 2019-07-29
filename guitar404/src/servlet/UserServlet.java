package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.UserService;
import service.impl.UserServiceImpl;
import util.CommonUtil;

@WebServlet("/admin/user")
public class UserServlet extends HttpServlet {
	private UserService userService;
	public UserServlet() {
		userService= new UserServiceImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String act = req.getParameter("act");
		System.out.println(act);
		User user = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = formatter.format(new Date());
		switch (act) {
			case "list":
				List<User> list = userService.findAll();
				req.setAttribute("list", list);
//				resp.sendRedirect("user_list.jsp");
				req.getRequestDispatcher("user_list.jsp").forward(req, resp);
				break;
			case "edit":
				String editId = req.getParameter("id");
				if (editId!=null && !editId.equals("")) {
					user = userService.findById(editId);
				}else{
					user= new User();
				}
				req.setAttribute("user", user);
				req.getRequestDispatcher("user_edit.jsp").forward(req, resp);
				break;
			case "save":
				String id = req.getParameter("id");
				System.out.println(id);
				String username = req.getParameter("username");
				System.out.println(username);
				String password = req.getParameter("password");
				String sex = req.getParameter("radio");
				String mobil = req.getParameter("mobil");
				if (id!=null && !id.equals("")) {
					user = userService.findById(id);
					user.setUsername(username);
					user.setPassword(password);
					user.setSex(sex);
					user.setMobil(mobil);
					user.setDate(date);
					int row = userService.update(user);
					if (row>0) {
						req.getRequestDispatcher("user?act=list").forward(req, resp);
					}else {
						req.setAttribute("error", "修改失败，请重新输入信息！");
						req.getRequestDispatcher("user?act=edit&id="+id).forward(req, resp);
					}
				}else {
					user = new User();
					user.setId(CommonUtil.getUUID());
					user.setUsername(username);
					user.setPassword(password);
					user.setSex(sex);
					user.setMobil(mobil);
					user.setDate(date);
					user.setType(0);
					user.setState(1);
					int row = userService.create(user);
					if (row>0) {
						req.getRequestDispatcher("user?act=list").forward(req, resp);
					}else {
						req.setAttribute("error", "用户添加失败");
						resp.sendRedirect("user?act=edit");
					}
				}
			case "delete":
				String deleteId = req.getParameter("id");
				if(deleteId!=null && !deleteId.equals("")) {
					int row = userService.delete(deleteId);
					if (row>0) {
						resp.sendRedirect("user?act=list");
						return;
					}else {
						req.setAttribute("error", "用户删除失败");
					}
				}else{
					req.setAttribute("error", "用户不存在");
				}
				req.getRequestDispatcher("user?act=list").forward(req, resp);
				break;
			}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
