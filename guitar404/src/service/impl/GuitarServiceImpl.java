package service.impl;

import java.util.List;

import dao.GuitarDao;
import dao.impl.GuitarDaoImpl;
import entity.Guitar;
import entity.GuitarImg;
import service.GuitarService;

public class GuitarServiceImpl implements GuitarService {
	private GuitarDao dao = new GuitarDaoImpl();
	@Override
	public int create(Guitar guitar) {
		// TODO Auto-generated method stub
		return dao.create(guitar);
	}

	@Override
	public int update(Guitar guitar) {
		// TODO Auto-generated method stub
		return dao.update(guitar);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public Guitar findById(String id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

	@Override
	public List<Guitar> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<Guitar> findByClassical() {
		// TODO Auto-generated method stub
		return dao.findByClassical();
	}

	@Override
	public List<Guitar> findByFolk() {
		// TODO Auto-generated method stub
		return dao.findByFolk();
	}

	@Override
	public List<Guitar> findByMusic() {
		// TODO Auto-generated method stub
		return dao.findByMusic();
	}

	@Override
	public List<Guitar> findByIdAll(String id) {
		// TODO Auto-generated method stub
		return dao.findByIdAll(id);
	}

	@Override
	public List<Guitar> findSearch(String name) {
		// TODO Auto-generated method stub
		return dao.findSearch(name);
	}
}
