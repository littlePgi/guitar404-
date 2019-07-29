package service;

import java.util.List;

import entity.Cart;
import entity.User;

public interface CartService {
	int create(Cart cart);
	int update(Cart cart);
	int delete(String id);
	List<Cart> findByIdAll(String id);//查询购物车列表
	Cart findById(String id);//查询需要修改购物车
	int updateState(Cart cart);//已下单
}
