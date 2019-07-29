package dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dao.CartDao;
import entity.Cart;
import entity.Guitar;
import entity.User;
import util.CommonUtil;
import util.JDBCUtil;

public class CartDaoImpl implements CartDao {
	private QueryRunner queryRunner = JDBCUtil.getQueryRunner();
	private Connection conn = JDBCUtil.getConnection();
	@Override
	public int create(Cart cart) {
		String sql = "INSERT INTO t_cart(id,user_id,guitar_id,guitar_name,guitar_size_color,count,"
				+ " guitar_price,guitar_imgaddr,state) VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			int row = queryRunner.update(sql,cart.getId(),cart.getUser_id(),cart.getGuitar_id(),
					cart.getGuitar_name(),cart.getGuitar_size_color(),cart.getCount()
					,cart.getGuitar_price(),cart.getGuitar_imgaddr(),1);
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
	public int update(Cart cart) {
		String sql = "UPDATE t_cart SET guitar_size_color=?,count=? WHERE id=?";
		try {
			int row = queryRunner.update(sql,cart.getGuitar_size_color(),cart.getCount(),cart.getId());
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
		String sql = "UPDATE t_cart SET state=0 WHERE id=?";
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
	public List<Cart> findByIdAll(String id) {
		String sql="SELECT * FROM t_cart WHERE state=1 AND user_id=?";
		List<Cart> cartList = null;
		try {
			cartList = queryRunner.query(sql, new BeanListHandler<Cart>(Cart.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}

	@Override
	public Cart findById(String id) {
		String sql="SELECT * FROM t_cart WHERE state=1 AND id=?";
		try {
			Cart cart = queryRunner.query(sql,new BeanHandler<Cart>(Cart.class){},id);
			return cart;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int updateState(Cart cart) {
		String sql = "UPDATE t_cart SET state=2 WHERE id=?";
		try {
			int row = queryRunner.update(sql,cart.getId());
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
