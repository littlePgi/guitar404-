package dao;

import java.util.List;

import entity.Code;

public interface CodeDao {
	int create(Code code);
	int update(Code code);
	int delete(String id);
	List<Code> findByIdAll(String id);//收货地址列表
	Code findById(String id);//修改收货地址
}
