package dao;

import java.util.List;

import entity.Cart;
import entity.User;

public interface CartDao {
	int create(Cart cart);
	int update(Cart cart);
	int delete(String id);
	List<Cart> findByIdAll(String id);//���ﳵ�б�
	Cart findById(String id);//��ѯ��Ҫ�޸Ĺ��ﳵ
	int updateState(Cart cart);//���µ�
}
