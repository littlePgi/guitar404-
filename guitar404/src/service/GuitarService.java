package service;

import java.util.List;

import entity.Guitar;
import entity.GuitarImg;

public interface GuitarService {
	int create(Guitar guitar);
	int update(Guitar guitar);
	int delete(String id);
	Guitar findById(String id);
	List<Guitar> findAll();
	List<Guitar> findByClassical();//查询吉他类型为古典吉他
	List<Guitar> findByFolk();//查询吉他类型为民谣吉他
	List<Guitar> findByMusic();//查询吉他类型为电音吉他
	List<Guitar> findByIdAll(String id);//查询满足条件之外的所有商品
	List<Guitar> findSearch(String name);//模糊查询
}
