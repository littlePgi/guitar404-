package service.impl;

import java.util.List;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao dao;
	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}
	@Override
	public int create(User user) {
		// TODO Auto-generated method stub
		return dao.create(user);
	}
	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return dao.update(user);
	}
	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}
	@Override
	public User findById(String id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}
	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}
	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.findByUsername(username);
	}
	

}
