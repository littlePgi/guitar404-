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
			//����
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
					//��ȡ�ϴ�ͼƬ��Դ�ļ���
					String submittedFileName = part.getSubmittedFileName();
					//��ȡ�ϴ��ļ��ĺ�׺��
					String suffix = submittedFileName.substring(submittedFileName.lastIndexOf("."));
					//�Ե�ǰʱ��ĺ�������Ϊ���ļ���
					String newFilename = System.currentTimeMillis() + suffix;
					//���ϴ��ļ����浽���ش���
					part.write(Constant.GUITAR_DETAIL_SAVE_PATH + newFilename);
					System.out.println("ͼ������ͼ�ϴ��ɹ���");
					imgaddr = Constant.GUITAR_DETAIL_PATH + newFilename;
				}
				if (id!=null && !id.equals("")) {
					System.out.println("�޸���Ʒ");
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
						req.setAttribute("error", "�޸�ʧ�ܣ�������������Ϣ��");
						req.getRequestDispatcher("guitar?act=edit&id="+id).forward(req, resp);
						return;
					}
				}else {
					System.out.println("�����Ʒ");
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
					/*//Ʒ��
					Brand brand = new Brand();
					brand.setId(CommonUtil.getUUID());
					brand.setName(brandName);
				//	guitar.setBrand(brand);
					//����
					Material material = new Material();
					material.setId(CommonUtil.getUUID());
					material.setName(materialName);*/
				//	guitar.setMaterial(material);
					
					int row = guitarService.create(guitar);
					if (row>0) {
						resp.sendRedirect("guitar?act=list");
						return;
					}else {
						req.setAttribute("error", "��Ʒ���ʧ��");
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
						req.setAttribute("error", "��Ʒɾ��ʧ��");
					}
				}else{
					req.setAttribute("error", "��Ʒ������");
				}
				req.getRequestDispatcher("guitar?act=list").forward(req, resp);
//				resp.sendRedirect("guitar?act=list");
				break;
				case "image":
					String guitarId = req.getParameter("id");//��ȡҪ�鿴ͼƬ��ͼ��id
					guitar = guitarService.findById(guitarId);
					if(guitar!=null){
						req.setAttribute("guitar", guitar);
						//��guitar��id��ѯguitar��ͼƬ�б�
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
