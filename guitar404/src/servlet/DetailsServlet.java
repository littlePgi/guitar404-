package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Guitar;
import entity.GuitarImg;
import service.GuitarImgService;
import service.GuitarService;
import service.impl.GuitarImpServiceImpl;
import service.impl.GuitarServiceImpl;

@WebServlet("/details")
public class DetailsServlet extends HttpServlet {
	
	private GuitarService guitarService;
	private GuitarImgService guitarImgService;
	
	public DetailsServlet() {
		guitarService = new GuitarServiceImpl();
		guitarImgService = new GuitarImpServiceImpl();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		//商品
		Guitar guitar = guitarService.findById(id);
		req.setAttribute("guitar", guitar);
		//商品图片
		List<GuitarImg> guitarList = guitarImgService.findImgById(id);
		req.setAttribute("guitarList", guitarList);
		//商品列表
		List<Guitar> guitars = guitarService.findByIdAll(id);
		req.setAttribute("guitars", guitars);
		
		req.getRequestDispatcher("single-product.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
