package service.impl;

import java.util.List;

import dao.CollectionDao;
import dao.impl.CollectionDaoImpl;
import entity.Collection;
import service.CollectionService;

public class CollectionServiceImpl implements CollectionService {
	
	private CollectionDao dao = new CollectionDaoImpl();
	
	@Override
	public int create(Collection collection) {
		// TODO Auto-generated method stub
		return dao.create(collection);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public Collection findById(String id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public List<Collection> findByAll() {
		// TODO Auto-generated method stub
		return dao.findByAll();
	}

}