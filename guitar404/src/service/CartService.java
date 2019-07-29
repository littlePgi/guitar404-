package service;

import java.util.List;

import entity.Cart;
import entity.User;

public interface CartService {
	int create(Cart cart);
	int update(Cart cart);
	int delete(String id);
	List<Cart> findByIdAll(String id);//��ѯ���ﳵ�б�
	Cart findById(String id);//��ѯ��Ҫ�޸Ĺ��ﳵ
	int updateState(Cart cart);//���µ�
}
