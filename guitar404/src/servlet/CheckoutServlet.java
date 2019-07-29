package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	
	private CartService cartService;
	private OrderService orderService;
	private CodeService codeService;
	
	public CheckoutServlet() {
		cartService = new CartServiceImpl();
		orderService = new OrderServiceImpl();
		codeService = new CodeServiceImpl();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取用户对象
		User user = (User)req.getSession().getAttribute("loginUser");
		
		String note = req.getParameter("note");
		String money = req.getParameter("money");
		String number = req.getParameter("number");
		//获取购物车项对象
		String cartId = req.getParameter("cartId");
		Cart cart = cartService.findById(cartId);
		//生成时间对象
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = formatter.format(new Date());
		//创建订单对象
		Order order = new Order();
		order.setId(CommonUtil.getUUID());
		order.setUser_id(user.getId());
		order.setGuitar_id(cart.getGuitar_id());
		order.setGuitar_name(cart.getGuitar_name());
		order.setStart_date(date);
		order.setState(0);
		order.setMoney(Double.parseDouble(money));
		order.setNote(note);
		order.setNumber(Integer.valueOf(number));
		
		int row = orderService.create(order);
		if (row>0) {
//			int create = codeService.create(code);
			Order order2 = orderService.findById(order.getId());
			req.setAttribute("order2", order2);
//			req.setAttribute("code", code);
			req.getRequestDispatcher("checkout.jsp").forward(req, resp);
		}else {
			System.out.println("订单生成失败！");
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
