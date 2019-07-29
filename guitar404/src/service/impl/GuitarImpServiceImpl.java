package service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import dao.GuitarImgDao;
import dao.impl.GuitarImgDaoImpl;
import entity.Guitar;
import entity.GuitarImg;
import service.GuitarImgService;
import util.JDBCUtil;

public class GuitarImpServiceImpl implements GuitarImgService {
	private GuitarImgDao dao;
	
	public GuitarImpServiceImpl() {
		dao = new GuitarImgDaoImpl();
	}
	@Override
	public List<GuitarImg> findImgById(String id) {
		// TODO Auto-generated method stub
		return dao.findImgById(id);
	}
	@Override
	public int saveImageByGuitar(Guitar guitar) {
		//��ȡ���ݿ�����
				Connection conn = JDBCUtil.getConnection();
				
				int count=0;//�ϴ�ͼƬ������
				try {
					//�����ֶ��ύ����
					conn.setAutoCommit(false);
					
					List<GuitarImg> guitarImages = guitar.getGuitarImgs();
					for(GuitarImg guitarImg:guitarImages){
						count += dao.create(guitarImg, conn);
					}
					conn.commit();//�ύ����
				} catch (SQLException e) {
					e.printStackTrace();
					try {
						conn.rollback();//�ع�����
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
				} 
				return count;
			}
	public int delete(String id) {
		return dao.delete(id);
	}

}
