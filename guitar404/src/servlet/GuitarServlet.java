package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import entity.Brand;
import entity.Guitar;
import entity.GuitarImg;
import entity.Material;
import service.GuitarImgService;
import service.GuitarService;
import service.impl.GuitarImpServiceImpl;
import service.impl.GuitarServiceImpl;
import util.CommonUtil;
import web.Constant;

@WebServlet("/admin/guitar")
@MultipartConfig
public class GuitarServlet extends HttpServlet {
	private GuitarService guitarService;
	private GuitarImgService guitarImgService;
	public GuitarServlet() {
		guitarService = new GuitarServiceImpl();
		guitarImgService = new GuitarImpServiceImpl();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String act = req.getParameter("act");
		Guitar guitar = null;
		switch(act){
			case "list":
				List<Guitar> list = guitarService.findAll();
				req.setAttribute("list", list);
				req.getRequestDispatcher("guitar_list.jsp").forward(req, resp);
				break;
			case "edit":
				String editId = req.getParameter("id");
				if (editId!=null && !editId.equals("")) {
					guitar = guitarService.findById(editId);
				}else{
					guitar = new Guitar();
				}
				//System.out.println(guitar);
				req.setAttribute("guitar", guitar);
				req.getRequestDispatcher("guitar_edit.jsp").forward(req, resp);
				break;
			//保存
			case "save":
				String id = req.getParameter("id");
				String name = req.getParameter("name");
				String size = req.getParameter("size");
				String color = req.getParameter("color");
				String price = req.getParameter("price");
				String type = req.getParameter("type");
				String brandName = req.getParameter("brandName");
				String materialName = req.getParameter("materialName");
				Part part = req.getPart("img");
				System.out.println(part.getInputStream());
				String imgaddr = null;
				if(part!=null && !part.getSubmittedFileName().equals("")){
					//获取上传图片的源文件名
					String submittedFileName = part.getSubmittedFileName();
					//获取上传文件的后缀名
					String suffix = submittedFileName.substring(submittedFileName.lastIndexOf("."));
					//以当前时间的毫秒数作为新文件名
					String newFilename = System.currentTimeMillis() + suffix;
					//把上传文件保存到本地磁盘
					part.write(Constant.GUITAR_DETAIL_SAVE_PATH + newFilename);
					System.out.println("图书缩略图上传成功！");
					imgaddr = Constant.GUITAR_DETAIL_PATH + newFilename;
				}
				if (id!=null && !id.equals("")) {
					System.out.println("修改商品");
					guitar = guitarService.findById(id);
					guitar.setBrand(brandName);
					guitar.setMaterial(materialName);
					guitar.setName(name);
					guitar.setSize(Integer.parseInt(size));
					guitar.setColor(color);
					guitar.setPrice(Double.parseDouble(price));
					guitar.setType(type);
					guitar.setImgaddr(imgaddr);
					
					int row = guitarService.update(guitar);
					if (row>0) {
						req.getRequestDispatcher("guitar?act=list").forward(req, resp);
						return;
					}else {
						req.setAttribute("error", "修改失败，请重新输入信息！");
						req.getRequestDispatcher("guitar?act=edit&id="+id).forward(req, resp);
						return;
					}
				}else {
					System.out.println("添加商品");
					guitar = new Guitar();
					guitar.setId(CommonUtil.getUUID());
					guitar.setBrand(brandName);
					guitar.setMaterial(materialName);
					guitar.setName(name);
					guitar.setSize(Integer.parseInt(size));
					guitar.setColor(color);
					guitar.setPrice(Double.parseDouble(price));
					guitar.setType(type);
					guitar.setState(1);
					guitar.setImgaddr(imgaddr);
					/*//品牌
					Brand brand = new Brand();
					brand.setId(CommonUtil.getUUID());
					brand.setName(brandName);
				//	guitar.setBrand(brand);
					//材质
					Material material = new Material();
					material.setId(CommonUtil.getUUID());
					material.setName(materialName);*/
				//	guitar.setMaterial(material);
					
					int row = guitarService.create(guitar);
					if (row>0) {
						resp.sendRedirect("guitar?act=list");
						return;
					}else {
						req.setAttribute("error", "商品添加失败");
						resp.sendRedirect("guitar?act=edit");
						return;
					}
				}
			case "delete":
				String deleteId = req.getParameter("id");
				//System.out.println(deleteId);
				if(deleteId!=null && !deleteId.equals("")) {
					int row = guitarService.delete(deleteId);
					if (row>0) {
						resp.sendRedirect("guitar?act=list");
						return;
					}else {
						req.setAttribute("error", "商品删除失败");
					}
				}else{
					req.setAttribute("error", "商品不存在");
				}
				req.getRequestDispatcher("guitar?act=list").forward(req, resp);
//				resp.sendRedirect("guitar?act=list");
				break;
				case "image":
					String guitarId = req.getParameter("id");//获取要查看图片的图书id
					guitar = guitarService.findById(guitarId);
					if(guitar!=null){
						req.setAttribute("guitar", guitar);
						//按guitar的id查询guitar的图片列表
						List<GuitarImg> guitarImgList = guitarImgService.findImgById(guitarId);
						req.setAttribute("guitarImageList",guitarImgList);

						req.getRequestDispatcher("guitar_image.jsp").forward(req, resp);
					}
					break;
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
