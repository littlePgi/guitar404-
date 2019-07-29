package service;

import java.util.List;

import entity.Collection;

public interface CollectionService {
	int create(Collection collection);
	int delete(String id);
	Collection findById(String id);
	List<Collection> findByAll();
}
