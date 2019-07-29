package dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.BasicRowProcessor;
import org.apache.commons.dbutils.GenerousBeanProcessor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;

import dao.UserDao;
import entity.Brand;
import entity.Material;
import entity.User;
import util.JDBCUtil;

public class UserDaoImpl implements UserDao {
	private QueryRunner queryRunner = JDBCUtil.getQueryRunner();

	@Override
	public int create(User user) {
		String sql = "INSERT INTO t_user(id,username,password,sex,date,mobil,type,state)"
				+ " VALUES(?,?,?,?,?,?,?,?)";
		try {
			int row = queryRunner.update(sql,user.getId(),user.getUsername(),user.getPassword(),user.getSex(),user.getDate()
					,user.getMobil(),user.getType(),user.getState());
			if (row>0) {
				return row;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int update(User user) {
		String sql = "UPDATE t_user SET username=?,password=?,sex=?,mobil=?,date=? WHERE id=?";
		try {
			int row = queryRunner.update(sql,user.getUsername(),user.getPassword(),user.getSex(),user.getMobil()
					,user.getDate(),user.getId());
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
		String sql = "UPDATE t_user SET state=0 WHERE id=?";
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
	public User findById(String id) {
		String sql = "SELECT * FROM t_user WHERE id=?";
		User user = null;
		try {
			Map<String, Object> map = queryRunner.query(sql, new MapHandler(){}, id);
			if(map!=null){
				user = new User();
				user.setId(map.get("id").toString());
				user.setUsername(map.get("username")==null?"":map.get("username").toString());
				user.setPassword(map.get("password")==null?"":map.get("password").toString());
				user.setSex(map.get("sex")==null?"":map.get("sex").toString());
				user.setMobil(map.get("mobil")==null?"":map.get("mobil").toString());
				user.setType(map.get("type")==null?1:0);
				user.setState(map.get("state")==null?1:0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public List<User> findAll() {
		String sql = "SELECT * FROM t_user WHERE state=1";
		List<User> userList = null;
		try {
			userList = queryRunner.query(sql, new BeanListHandler<User>(User.class,
					new BasicRowProcessor(new GenerousBeanProcessor())){});
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public User findByUsername(String username) {
		String sql = "SELECT * FROM t_user WHERE username=?";
		User user = null;
		try {
			user = queryRunner.query(sql, new BeanHandler<User>(User.class){}, username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

}
