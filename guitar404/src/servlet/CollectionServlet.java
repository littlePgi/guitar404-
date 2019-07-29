package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Cart;
import entity.Collection;
import entity.Guitar;
import entity.User;
import service.CartService;
import service.CollectionService;
import service.GuitarService;
import service.impl.CartServiceImpl;
import service.impl.CollectionServiceImpl;
import service.impl.GuitarServiceImpl;
import util.CommonUtil;

@WebServlet("/collection")
public class CollectionServlet extends HttpServlet {
	
	private GuitarService guitarService;
	private CollectionService collectionService;
	private CartService cartService;
	
	public CollectionServlet() {
		collectionService =new CollectionServiceImpl();
		cartService = new CartServiceImpl();
		guitarService = new GuitarServiceImpl();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User user = (User)req.getSession().getAttribute("loginUser");
		String guitarId = req.getParameter("guitarId");
		
		if (user!=null) {
			String act = req.getParameter("act");
			switch (act) {
			case "list":
				List<Collection> collectionList = collectionService.findByAll();
				req.setAttribute("collectionList", collectionList);
				req.getRequestDispatcher("information.jsp").forward(req, resp);
				break;
			case "save":
				Guitar guitar = guitarService.findById(guitarId);
				
				Collection collection = collectionService.findById(guitar.getId());
				if (collection!=null) {
					collection.setId(CommonUtil.getUUID());
					collection.setUser_id(user.getId());
					collection.setGuitat_id(guitar.getId());
					collection.setGuitar_name(guitar.getName());
					collection.setGuitar_price(guitar.getPrice());
					collection.setGuitar_size_color(guitar.getSize()+"¥Á"+guitar.getColor());
					collection.setGuitar_image(guitar.getImgaddr());
					int row = collectionService.create(collection);
					if (row>0) {
						resp.sendRedirect("collection?act=list");
					}
				}else {
					Collection coll = new Collection();
					coll.setId(CommonUtil.getUUID());
					coll.setUser_id(user.getId());
					coll.setGuitat_id(guitar.getId());
					coll.setGuitar_name(guitar.getName());
					coll.setGuitar_price(guitar.getPrice());
					coll.setGuitar_size_color(guitar.getSize()+"¥Á"+guitar.getColor());
					coll.setGuitar_image(guitar.getImgaddr());
					int row = collectionService.create(coll);
					if (row>0) {
						resp.sendRedirect("collection?act=list");
					}
				}
				break;
			case "delete":
				Collection coll = collectionService.findById(guitarId);
				int delete = collectionService.delete(coll.getId());
				if (delete>0) {
					resp.sendRedirect("collection?act=list");
				}else {
					req.setAttribute("prompt", " ’≤ÿ…æ≥˝ ß∞‹£°");
					req.getRequestDispatcher("collection?act=list").forward(req, resp);
				}
				break;
			}
		}else {
			resp.sendRedirect("login-register.jsp");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
