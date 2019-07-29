package dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dao.CartDao;
import dao.CodeDao;
import entity.Cart;
import entity.Code;
import entity.Guitar;
import entity.User;
import util.CommonUtil;
import util.JDBCUtil;

public class CodeDaoImpl implements CodeDao {
	
	private QueryRunner queryRunner = JDBCUtil.getQueryRunner();
	private Connection conn = JDBCUtil.getConnection();
	
	@Override
	public int create(Code code) {
		String sql = "INSERT INTO t_code(id,user_id,user_name,name,mobil,addr) VALUES(?,?,?,?,?,?);";
		try {
			int row = queryRunner.update(sql,code.getId(),code.getUser_id(),code.getUser_name(),code.getName()
					,code.getMobil(),code.getAddr());
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
	public int update(Code code) {
		String sql = "UPDATE t_code SET name=?,mobil=?,addr=? WHERE id=?";
		try {
			int row = queryRunner.update(sql,code.getName()
					,code.getMobil(),code.getAddr(),code.getId());
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
		String sql = "DELETE FROM t_code WHERE id=?";
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
	public List<Code> findByIdAll(String id) {
		String sql="SELECT * FROM t_code WHERE user_id=?";
		List<Code> codeList = null;
		try {
			codeList = queryRunner.query(sql, new BeanListHandler<Code>(Code.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return codeList;
	}

	@Override
	public Code findById(String id) {
		String sql="SELECT * FROM t_code WHERE id=?";
		Code code = null;
		try {
			code = queryRunner.query(sql, new BeanHandler<Code>(Code.class){},id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return code;
	}
}
