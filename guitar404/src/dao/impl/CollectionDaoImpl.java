package dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dao.CollectionDao;
import entity.Collection;
import util.JDBCUtil;

public class CollectionDaoImpl implements CollectionDao {
	
	private QueryRunner queryRunner = JDBCUtil.getQueryRunner();
	private Connection conn = JDBCUtil.getConnection();
	
	@Override
	public int create(Collection collection) {
		String sql = "INSERT INTO t_collection(id,user_id,guitar_id,guitar_name,guitar_price,guitar_size_color,guitar_image)"
				+ " VALUES(?,?,?,?,?,?,?);";
		try {
			int row = queryRunner.update(sql,collection.getId(),collection.getUser_id(),collection.getGuitat_id()
					,collection.getGuitar_name(),collection.getGuitar_price(),collection.getGuitar_size_color(),collection.getGuitar_image());
			if (row>0) {
				return row;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(String id) {
		String sql = "DELETE FROM t_collection WHERE id=?";
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

	@Override
	public Collection findById(String id) {
		String sql="SELECT * FROM t_collection WHERE id=?";
		Collection collection = null;
		try {
			collection = queryRunner.query(sql,new BeanHandler<Collection>(Collection.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return collection;
	}

	@Override
	public List<Collection> findByAll() {
		String sql="SELECT * FROM t_collection";
		List<Collection> collectionList = null;
		try {
			collectionList = queryRunner.query(sql,new BeanListHandler<Collection>(Collection.class){});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return collectionList;
	}

}
