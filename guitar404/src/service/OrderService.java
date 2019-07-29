package service;

import java.util.List;

import entity.Order;

public interface OrderService {
	int create(Order order);
	int update(Order order);//收货
	int updateHair(Order order);//已发货
	int updateClosed(Order order);//已收货
	int deleteOrder(String id);
	Order findById(String id);//生成的订单
	List<Order> findByIdAll(String id);//全部订单列表
	List<Order> findByIdStayAll(String id);//待发货列表
	List<Order> findByIdHairAll(String id);//已发货列表
	List<Order> findByIdClosedAll(String id);//已收货列表
	List<Order> findAll();//全部订单列表
	List<Order> findByAll();//已发货订单列表
}
