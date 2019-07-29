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
		//��ȡͼ��id
		String guitarId = request.getParameter("guitarId");
		Guitar guitar = guitarService.findById(guitarId);
		int row = 0;
		if(guitar!=null){
			//��ȡ�ϴ���ͼƬ����
			Collection<Part> parts = request.getParts();
			//����ͼƬ���ϣ����浽����
			for(Part part:parts){
				//�ж�part�Ƿ���һ���ϴ��ļ����������ͨ�ı�Ԫ�ؾͲ����ϴ��ļ�����
				if(part.getSubmittedFileName()!=null&&!part.getSubmittedFileName().equals("")){
					//��ȡԭ�ļ���
					String submittedFileName = part.getSubmittedFileName();
					//��ȡ�ϴ��ļ��ĺ�׺��
					String suffix = submittedFileName.substring(submittedFileName.lastIndexOf("."));
					//�Ե�ǰʱ��ĺ�������Ϊ���ļ���
					String newFilename = System.currentTimeMillis() + suffix;
					//���浽����
					part.write(Constant.GUITAR_IMAGE_SAVE_PATH + newFilename);
					String url = Constant.GUITAR_IMAGE_PATH + newFilename;
					//���켪����ͼƬ����
					GuitarImg guitarImg = new GuitarImg();
					guitarImg.setId(guitar.getId());
					guitarImg.setUrl(Constant.GUITAR_IMAGE_PATH + newFilename);
					//������ͼƬ������Ӳ�������
					guitar.getGuitarImgs().add(guitarImg);
				}
			}
			
			//����
			//��ͼƬ�����·�����浽���ݿ�
			row = guitarImgService.saveImageByGuitar(guitar);
			request.setAttribute("message", "�ϴ�ͼƬ�ɹ������ϴ�"+row+"��ͼƬ");
		}else{
			request.setAttribute("error", "�ϴ�ͼƬʧ�ܣ�ͼ�鲻���ڣ�");
		}
		//request.getRequestDispatcher(request.getContextPath()+"/admin/book?act=image&id="+bookId).forward(request, response);
		response.sendRedirect(request.getContextPath()+"/admin/guitar?act=image&id="+guitarId);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
}
