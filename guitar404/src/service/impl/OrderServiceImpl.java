package service.impl;

import java.util.List;

import dao.OrderDao;
import dao.impl.OrderDaoImpl;
import entity.Order;
import service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderDao dao;
	public OrderServiceImpl() {
		dao = new OrderDaoImpl();
	}
	@Override
	public int create(Order order) {
		// TODO Auto-generated method stub
		return dao.create(order);
	}

	@Override
	public int updateHair(Order order) {
		// TODO Auto-generated method stub
		return dao.updateHair(order);
	}
	
	@Override
	public int updateClosed(Order order) {
		// TODO Auto-generated method stub
		return dao.updateClosed(order);
	}

	@Override
	public int deleteOrder(String id) {
		// TODO Auto-generated method stub
		return dao.deleteOrder(id);
	}

	@Override
	public List<Order> findByIdAll(String id) {
		// TODO Auto-generated method stub
		return dao.findByIdAll(id);
	}

	@Override
	public List<Order> findByIdHairAll(String id) {
		// TODO Auto-generated method stub
		return dao.findByIdHairAll(id);
	}

	@Override
	public List<Order> findByIdClosedAll(String id) {
		// TODO Auto-generated method stub
		return dao.findByIdClosedAll(id);
	}
	@Override
	public List<Order> findByIdStayAll(String id) {
		// TODO Auto-generated method stub
		return dao.findByIdStayAll(id);
	}
	@Override
	public Order findById(String id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}
	@Override
	public int update(Order order) {
		// TODO Auto-generated method stub
		return dao.update(order);
	}
	@Override
	public List<Order> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public List<Order> findByAll() {
		// TODO Auto-generated method stub
		return dao.findByAll();
	}

}
