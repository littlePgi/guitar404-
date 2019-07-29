package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	int create(User user);
	int update(User user);
	int delete(String id);
	User findById(String id);
	List<User> findAll();
	User findByUsername(String username);
}
