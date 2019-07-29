package dao;

import java.util.List;

import entity.Collection;

public interface CollectionDao {
	int create(Collection collection);
	int delete(String id);
	Collection findById(String id);
	List<Collection> findByAll();
}
