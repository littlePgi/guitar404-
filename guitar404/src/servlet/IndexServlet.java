package servlet;

import java.awt.print.Book;
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

/**
 * 前台首页Servlet
 */
@WebServlet("/indexServlet")
public class IndexServlet extends HttpServlet{
	
	private GuitarService guitarService;
	private GuitarImgService guitarImgService;
	
	public IndexServlet() {
		guitarService = new GuitarServiceImpl();
		guitarImgService = new GuitarImpServiceImpl();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//查询商品列表
		List<Guitar> classical = guitarService.findByClassical();
		request.setAttribute("classical", classical);
		
		List<Guitar> flok = guitarService.findByFolk();
		request.setAttribute("flok", flok);
		
		List<Guitar> music = guitarService.findByMusic();
		request.setAttribute("music", music);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
