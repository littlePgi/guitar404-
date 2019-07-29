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

import entity.Cart;
import entity.Code;
import entity.Order;
import entity.User;
import service.CartService;
import service.CodeService;
import service.OrderService;
import service.impl.CartServiceImpl;
import service.impl.CodeServiceImpl;
import service.impl.OrderServiceImpl;
import util.CommonUtil;

@WebServlet("/order")
public class Orderservlet extends HttpServlet {
	
	private CartService cartService;
	private OrderService orderService;
	private CodeService codeService;
	
	public Orderservlet() {
		cartService = new CartServiceImpl();
		orderService = new OrderServiceImpl();
		codeService = new CodeServiceImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//时间格式化
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm-ss");
		String date = format.format(new Date());
		
		String act = req.getParameter("act");
		User user =(User)req.getSession().getAttribute("loginUser");//从session中获取用户对象
		switch(act){
			case "listAll":
				//全部订单
				List<Order> orderList = orderService.findByIdAll(user.getId());
				req.setAttribute("orderList", orderList);
				//待发货
				List<Order> stayList = orderService.findByIdStayAll(user.getId());
				req.setAttribute("stayList", stayList);
				//已发货
				List<Order> hairList = orderService.findByIdHairAll(user.getId());
				req.setAttribute("hairList", hairList);
				//已收货
				List<Order> closedList = orderService.findByIdClosedAll(user.getId());
				req.setAttribute("closedList", closedList);
				
				req.getRequestDispatcher("account.jsp").forward(req, resp);
				break;
			//添加订单
			case "save":
				String name = req.getParameter("name");
				String mobil = req.getParameter("mobil");
				String addr = req.getParameter("addr");
				String orderId = req.getParameter("orderId");
				
				Code code = new Code();
				code.setId(CommonUtil.getUUID());
				code.setUser_id(user.getId());
				code.setUser_name(user.getUsername());
				code.setName(name);
				code.setAddr(addr);
				code.setMobil(mobil);
				
				int row = codeService.create(code);
				if (row>0) {
					Order order = orderService.findById(orderId);
					req.setAttribute("order", order);
					req.setAttribute("code", code);
					req.getRequestDispatcher("order.jsp").forward(req, resp);
				}
				break;
			case "closed":
				String id = req.getParameter("id");
				Order order = orderService.findById(id);
				order.setEnd_date(date);
				order.setState(2);
				int update = orderService.update(order);
				resp.sendRedirect("order.jsp");
				break;
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
