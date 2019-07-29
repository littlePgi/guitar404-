package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Cart;
import entity.Guitar;
import entity.User;
import service.CartService;
import service.GuitarService;
import service.UserService;
import service.impl.CartServiceImpl;
import service.impl.GuitarServiceImpl;
import service.impl.UserServiceImpl;
import util.CommonUtil;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private UserService userservice;
	private GuitarService guitarService;
	private CartService cartService;
	
	public CartServlet() {
		userservice = new UserServiceImpl();
		guitarService = new GuitarServiceImpl();
		cartService = new CartServiceImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ��ȡ��ǰ��¼�û���id
		String act = req.getParameter("act");
		User user =(User)req.getSession().getAttribute("loginUser");
		if (user==null && user.equals("")) {
			user =(User)req.getSession().getAttribute("loginAdmin");
			req.setAttribute("prompt", "����Ա���ܽ��й��ﳵ����Լ���Ʒ���������");
			req.getRequestDispatcher("details").forward(req, resp);
		}
			//��ѯ���ݿ⹺�ﳵ�б�
			switch (act) {
				case "list":
					List<Cart> cartList = cartService.findByIdAll(user.getId());
					req.setAttribute("cartList", cartList);
					req.getRequestDispatcher("cart.jsp").forward(req, resp);
					break;
				case "seve":
					// ��ȡ��ӵ����ﳵ����Ʒid
					String guitarId = req.getParameter("guitarId");
					Guitar guitar = guitarService.findById(guitarId);
					
					String count = req.getParameter("count");
					
					if (guitar!=null&&!guitar.equals("")) {
						// �������ﳵ����
						Cart cart = new Cart();
						cart.setId(CommonUtil.getUUID());
						cart.setUser_id(user.getId());
						cart.setGuitar_id(guitar.getId());
						cart.setGuitar_name(guitar.getName());
						cart.setGuitar_size_color(guitar.getSize() +"��"+ guitar.getColor());
						if (count!=null && !count.equals("")) {
							cart.setCount(Integer.parseInt(count));
						}
						cart.setCount(1);
						cart.setGuitar_price(guitar.getPrice());
						cart.setGuitar_imgaddr(guitar.getImgaddr());
						// �����ﳵ��Ʒ��ӵ����ݿ�
						int row = cartService.create(cart);
						if (row>0) {
							resp.sendRedirect("cart?act=list");
						}
					}
					break;
				/*case "edit":
					String cartId = req.getParameter("cartId");
					if (cartId!=null&&cartId.equals("")) {
						Cart cart = cartService.findById(cartId);
						cart.setGuitar_size_color(guitar_size_color);
					}
					break;*/
				case "delete":
					String cartId = req.getParameter("cartId");
					int delete = cartService.delete(cartId);
					if (delete>0) {
						req.setAttribute("prompt", "���Ƴ���Ʒ");
						resp.sendRedirect("cart?act=list");
					}
			}
		}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
