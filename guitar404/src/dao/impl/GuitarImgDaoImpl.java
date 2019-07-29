package dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dao.GuitarImgDao;
import entity.Guitar;
import entity.GuitarImg;
import util.JDBCUtil;

public class GuitarImgDaoImpl implements GuitarImgDao {
	private QueryRunner queryRunner = JDBCUtil.getQueryRunner();
	private Connection conn = JDBCUtil.getConnection();
	@Override
	public List<GuitarImg> findImgById(String id) {
		String sql = "SELECT * FROM t_img WHERE id=?";
		List<GuitarImg> guitarList = null;
		try {
			guitarList = queryRunner.query(sql,new BeanListHandler<GuitarImg>(GuitarImg.class){},id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return guitarList;
	}
	@Override
	public int create(GuitarImg guitarImg, Connection conn) {
		
		String sql = "INSERT INTO t_img(id,url) values(?,?)";
		int row = 0;
		try {
			row = queryRunner.update(conn,sql,guitarImg.getId(),guitarImg.getUrl());
			if (row>0) {
				return row;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int delete(String id) {
		String sql = "DELETE FROM t_img WHERE id =?";
		try {
			int row = queryRunner.update(sql,id);
			if (row>0) {
				return row;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
