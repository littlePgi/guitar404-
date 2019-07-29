package servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import entity.Guitar;
import entity.GuitarImg;
import service.GuitarImgService;
import service.GuitarService;
import service.impl.GuitarImpServiceImpl;
import service.impl.GuitarServiceImpl;
import web.Constant;

@WebServlet("/admin/guitarImage")
@MultipartConfig
public class GuitarImageServlet extends HttpServlet{

	private GuitarService guitarService;
	private GuitarImgService guitarImgService;
	
	public GuitarImageServlet() {
		guitarService = new GuitarServiceImpl();
		guitarImgService = new GuitarImpServiceImpl();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//获取图书id
		String guitarId = request.getParameter("guitarId");
		Guitar guitar = guitarService.findById(guitarId);
		int row = 0;
		if(guitar!=null){
			//获取上传的图片集合
			Collection<Part> parts = request.getParts();
			//遍历图片集合，保存到本地
			for(Part part:parts){
				//判断part是否是一个上传文件，如果是普通的表单元素就不做上传文件操作
				if(part.getSubmittedFileName()!=null&&!part.getSubmittedFileName().equals("")){
					//获取原文件名
					String submittedFileName = part.getSubmittedFileName();
					//获取上传文件的后缀名
					String suffix = submittedFileName.substring(submittedFileName.lastIndexOf("."));
					//以当前时间的毫秒数作为新文件名
					String newFilename = System.currentTimeMillis() + suffix;
					//保存到本地
					part.write(Constant.GUITAR_IMAGE_SAVE_PATH + newFilename);
					String url = Constant.GUITAR_IMAGE_PATH + newFilename;
					//构造吉他的图片对象
					GuitarImg guitarImg = new GuitarImg();
					guitarImg.setId(guitar.getId());
					guitarImg.setUrl(Constant.GUITAR_IMAGE_PATH + newFilename);
					//吉他的图片对象添加不到集合
					guitar.getGuitarImgs().add(guitarImg);
				}
			}
			
			//报错
			//把图片的相对路径保存到数据库
			row = guitarImgService.saveImageByGuitar(guitar);
			request.setAttribute("message", "上传图片成功！共上传"+row+"张图片");
		}else{
			request.setAttribute("error", "上传图片失败！图书不存在！");
		}
		//request.getRequestDispatcher(request.getContextPath()+"/admin/book?act=image&id="+bookId).forward(request, response);
		response.sendRedirect(request.getContextPath()+"/admin/guitar?act=image&id="+guitarId);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
}
