package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dao.OrderDao;
import entity.Cart;
import entity.Order;
import util.JDBCUtil;

public class OrderDaoImpl implements OrderDao {
	private QueryRunner queryRunner = JDBCUtil.getQueryRunner();
	
	@Override
	public int create(Order order) {
		String sql = "INSERT INTO t_order(id,user_id,guitar_id,guitar_name,start_date,state,note,money,number) "
				+ " VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			int row = queryRunner.update(sql,order.getId(),order.getUser_id(),order.getGuitar_id(),order.getGuitar_name(),
					order.getStart_date(),order.getState(),order.getNote(),order.getMoney(),order.getNumber());
			if (row>0) {
				return row;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 发货sql
	 */
	@Override
	public int updateHair(Order order) {
		String sql = "UPDATE t_order SET end_time=?,state=1 WHERE id=?;";
		try {
			int row = queryRunner.update(sql,order.getEnd_date(),order.getId());
			if (row>0) {
				return row;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 收货sql
	 */
	@Override
	public int updateClosed(Order order) {
		String sql = "UPDATE t_order SET end_time=?,state=2 WHERE id=?;";
		try {
			int row = queryRunner.update(sql,order.getEnd_date(),order.getId());
			if (row>0) {
				return row;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	/**
	 * 取消订单
	 */
	@Override
	public int deleteOrder(String id) {
		String sql = "UPDATE t_order SET state=-1 WHERE id=?";
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
	/**
	 * 全部订单
	 */
	@Override
	public List<Order> findByIdAll(String id) {
		String sql="SELECT * FROM t_order WHERE user_id=?";
		List<Order> cartList = null;
		try {
			cartList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}
	/**
	 * 已发货
	 */
	@Override
	public List<Order> findByIdHairAll(String id) {
		String sql="SELECT * FROM t_order WHERE state=1 AND user_id=?";
		List<Order> cartList = null;
		try {
			cartList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}
	/**
	 * 已收货
	 */
	@Override
	public List<Order> findByIdClosedAll(String id) {
		String sql="SELECT * FROM t_order WHERE state=2 AND user_id=?";
		List<Order> cartList = null;
		try {
			cartList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}
	@Override
	public List<Order> findByIdStayAll(String id) {
		String sql="SELECT * FROM t_order WHERE state=0 AND user_id=?";
		List<Order> cartList = null;
		try {
			cartList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}
	/**
	 * 生成的订单
	 */
	@Override
	public Order findById(String id) {
		String sql="SELECT * FROM t_order WHERE id=?";
		Order order = null;
		try {
			order = queryRunner.query(sql, new BeanHandler<Order>(Order.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
	}
	@Override
	public int update(Order order) {
		String sql = "UPDATE t_order SET end_date=?,state=? WHERE id=?";
		try {
			int row = queryRunner.update(sql,order.getEnd_date(),order.getState(),order.getId());
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
	public List<Order> findAll() {
		String sql="SELECT * FROM t_order WHERE state=0";
		List<Order> cartList = null;
		try {
			cartList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class){});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}
	@Override
	public List<Order> findByAll() {
		String sql="SELECT * FROM t_order WHERE state=1";
		List<Order> cartList = null;
		try {
			cartList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class){});
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}

}
