package dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import dao.GuitarDao;
import entity.Guitar;
import util.CommonUtil;
import util.JDBCUtil;

public class GuitarDaoImpl implements GuitarDao {
	private QueryRunner queryRunner = JDBCUtil.getQueryRunner();
	private Connection conn = JDBCUtil.getConnection();
	@Override
	public int create(Guitar guitar) {
		String sql = "";
		int row = 0;
		try {
			conn.setAutoCommit(false);
			String id = CommonUtil.getUUID();
			sql = "INSERT INTO t_guitar(id,brand_id,material_id,name,size,color,price,type,state)"
					+ " VALUES(?,?,?,?,?,?,?,?,?)";
			row = queryRunner.update(conn,sql,id,id,id,guitar.getName(),guitar.getSize(),
					guitar.getColor(),guitar.getPrice(),guitar.getType(),guitar.getState());
			if (row>0) {
				sql = "INSERT INTO t_brand(id,name,imgaddr) values(?,?,?)";
				row = queryRunner.update(conn,sql,id,guitar.getBrand(),guitar.getImgaddr());
				
				if (row>0) {
					sql = "INSERT INTO t_material(id,name) values(?,?)";
					row = queryRunner.update(conn,sql,id,guitar.getMaterial());
				}
			}	
			System.out.println(guitar);
				conn.commit();
				return row;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return 0;
	}

	@Override
	public int update(Guitar guitar) {
		String sql = "UPDATE t_guitar SET name=?,size=?,color=?,type=?,price=? WHERE id=?";
		try {
			int row = queryRunner.update(sql,guitar.getName(),guitar.getSize(),guitar.getColor(),guitar.getType(),guitar.getPrice()
					,guitar.getId());
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
		String sql = "UPDATE t_guitar SET state=0 WHERE id=?";
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
	public Guitar findById(String id) {
		String sql = "SELECT b.imgaddr,i.url,g.id,b.name brand,m.name material,g.name,g.size,g.color,g.price,g.type,g.state"
				+ " FROM t_guitar g LEFT JOIN t_brand b ON g.id = b.id"
				+ " LEFT JOIN t_material m ON g.id = m.id"
				+ " LEFT JOIN t_img i ON g.id = i.id WHERE g.state=1 AND g.id=?";
		Guitar guitar = null;
		try {
			guitar = queryRunner.query(sql,new BeanHandler<Guitar>(Guitar.class),id);
			/*Map<String, Object> map = queryRunner.query(sql, new MapHandler(){},id);
			if(map!=null){
				guitar = new Guitar();
				guitar.setId(map.get("id").toString());
				guitar.setSize((Integer)map.get("size"));
				guitar.setColor(map.get("color")==null?"":map.get("color").toString());
				guitar.setPrice((double)map.get("price"));
				guitar.setType(map.get("type")==null?"":map.get("type").toString());
				guitar.setState(map.get("state")==null?1:0);
				//品牌
				Brand brand = new Brand();
				brand.setId(map.get("id").toString());
				brand.setName(map.get("name").toString());
			//	guitar.setBrand(brand);
				//材质
				Material material = new Material();
				material.setId(map.get("id").toString());
				material.setName(map.get("name").toString());
			//	guitar.setMaterial(material);
			}*/
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return guitar;
	}

	@Override
	public List<Guitar> findAll() {
		String sql = "SELECT b.imgaddr,g.id,b.name brand,m.name material,g.name,g.size,g.color,g.price,g.type,g.state"
				+ " FROM t_guitar g LEFT JOIN t_brand b ON g.id = b.id"
				+ " LEFT JOIN t_material m ON g.id = m.id WHERE g.state=1";
		List<Guitar> guitarList = null;
			//用MapListHandler封装连表查询的结果
			//List<Map<String, Object>> list;
			try {
				guitarList = queryRunner.query(sql,new BeanListHandler<Guitar>(Guitar.class));
				/*for(Map<String, Object> map:list){
					Guitar guitar = new Guitar();
					guitar.setId(map.get("id").toString());
					guitar.setSize((Integer)map.get("size"));
					guitar.setColor(map.get("color").toString());
					guitar.setPrice((double)map.get("price"));
					guitar.setType(map.get("type").toString());
					guitar.setState(1);
					//品牌
					Brand brand = new Brand();
					brand.setId(map.get("id").toString());
					brand.setName(map.get("name").toString());
					guitar.setBrand(brand);
					//材质
					Material material = new Material();
					material.setId(map.get("id").toString());
					material.setName(map.get("name").toString());
					guitar.setMaterial(material);
					
					guitarList.add(guitar);
				}*/
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return guitarList;
	}

	@Override
	public List<Guitar> findByClassical() {
		String sql = "SELECT b.imgaddr,g.id,b.name brand,m.name material,g.name,g.size,g.color,g.price,g.type,g.state"
				+ " FROM t_guitar g LEFT JOIN t_brand b ON g.id = b.id"
				+ " LEFT JOIN t_material m ON g.id = m.id WHERE g.type='古典' AND g.state=1";
		List<Guitar> guitarList = null;
			try {
				guitarList = queryRunner.query(sql,new BeanListHandler<Guitar>(Guitar.class));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return guitarList;
	}

	@Override
	public List<Guitar> findByFolk() {
		String sql = "SELECT b.imgaddr,g.id,b.name brand,m.name material,g.name,g.size,g.color,g.price,g.type,g.state"
				+ " FROM t_guitar g LEFT JOIN t_brand b ON g.id = b.id"
				+ " LEFT JOIN t_material m ON g.id = m.id WHERE g.type='民谣' AND g.state=1";
		List<Guitar> guitarList = null;
			try {
				guitarList = queryRunner.query(sql,new BeanListHandler<Guitar>(Guitar.class));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return guitarList;
	}

	@Override
	public List<Guitar> findByMusic() {
		String sql = "SELECT b.imgaddr,g.id,b.name brand,m.name material,g.name,g.size,g.color,g.price,g.type,g.state"
				+ " FROM t_guitar g LEFT JOIN t_brand b ON g.id = b.id"
				+ " LEFT JOIN t_material m ON g.id = m.id WHERE g.type='电音' AND g.state=1";
		List<Guitar> guitarList = null;
			try {
				guitarList = queryRunner.query(sql,new BeanListHandler<Guitar>(Guitar.class));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return guitarList;
	}

	@Override
	public List<Guitar> findByIdAll(String id) {
		String sql = "SELECT b.imgaddr,g.id,b.name brand,m.name material,g.name,g.size,g.color,g.price,g.type,g.state"
				+ " FROM t_guitar g LEFT JOIN t_brand b ON g.id = b.id"
				+ " LEFT JOIN t_material m ON g.id = m.id WHERE g.state=1 AND g.id NOT IN(?)";
		List<Guitar> guitarList = null;
		try {
			guitarList = queryRunner.query(sql,new BeanListHandler<Guitar>(Guitar.class),id);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return guitarList;
	}

	@Override
	public List<Guitar> findSearch(String name) {
		String sql = "SELECT b.imgaddr,g.id,b.name brand,m.name material,g.name,g.size,g.color,g.price,g.type,g.state"
				+ " FROM t_guitar g LEFT JOIN t_brand b ON g.id = b.id"
				+ " LEFT JOIN t_material m ON g.id = m.id WHERE g.name LIKE '%?%'  AND g.state=1";
		List<Guitar> guitarList = null;
		try {
			guitarList = queryRunner.query(sql,new BeanListHandler<Guitar>(Guitar.class),name);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return guitarList;
	}
}
