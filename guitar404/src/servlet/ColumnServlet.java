package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Guitar;
import service.GuitarService;
import service.impl.GuitarServiceImpl;

@WebServlet("/columu")
public class ColumnServlet extends HttpServlet {
	
	private GuitarService guitarService;
	
	public ColumnServlet() {
		guitarService = new GuitarServiceImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Guitar> guitarList = guitarService.findAll();
		req.setAttribute("guitarList", guitarList);
		req.getRequestDispatcher("column.jsp").forward(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
