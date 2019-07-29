package service.impl;

import java.util.List;

import dao.CartDao;
import dao.impl.CartDaoImpl;
import entity.Cart;
import entity.User;
import service.CartService;

public class CartServiceImpl implements CartService {
	private CartDao dao;
	public CartServiceImpl() {
		dao = new CartDaoImpl();
	}
	@Override
	public int create(Cart cart) {
		// TODO Auto-generated method stub
		return dao.create(cart);
	}

	@Override
	public int update(Cart cart) {
		// TODO Auto-generated method stub
		return dao.update(cart);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}
	
	@Override
	public Cart findById(String id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}
	@Override
	public List<Cart> findByIdAll(String id) {
		// TODO Auto-generated method stub
		return dao.findByIdAll(id);
	}
	@Override
	public int updateState(Cart cart) {
		// TODO Auto-generated method stub
		return dao.updateState(cart);
	}

}
