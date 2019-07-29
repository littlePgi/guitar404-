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

@WebServlet("/admin/order")
public class AdminOrderServlet extends HttpServlet {
	
	private CartService cartService;
	private OrderService orderService;
	private CodeService codeService;
	
	public AdminOrderServlet() {
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
		switch(act){
			case "list":
				String abt = req.getParameter("abt");
				switch(abt){
				case "lists":
					//已发货列表
					List<Order> orders = orderService.findByAll();
					req.setAttribute("orders", orders);
					req.getRequestDispatcher("order_lists.jsp").forward(req, resp);
					break;
				case "list":
					//未发货订单
					List<Order> orderList = orderService.findAll();
					req.setAttribute("orderList", orderList);
					req.getRequestDispatcher("order_list.jsp").forward(req, resp);
				}
				break;
			case "closed":
				String id = req.getParameter("id");
				Order order = orderService.findById(id);
				order.setState(1);
				int update = orderService.update(order);
				resp.sendRedirect("order?act=list&abt=list");
				break;
			case "delete":
				String deleteId = req.getParameter("id");
				int row = orderService.deleteOrder(deleteId);
				if (row>0) {
					resp.sendRedirect("order?act=list&abt=lists");
				}
				break;
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
