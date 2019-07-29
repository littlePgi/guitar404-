package service.impl;

import java.util.List;

import dao.CodeDao;
import dao.impl.CodeDaoImpl;
import entity.Code;
import service.CodeService;

public class CodeServiceImpl implements CodeService {
	private CodeDao dao = new CodeDaoImpl();
	@Override
	public int create(Code code) {
		// TODO Auto-generated method stub
		return dao.create(code);
	}

	@Override
	public int update(Code code) {
		// TODO Auto-generated method stub
		return dao.update(code);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return dao.delete(id);
	}

	@Override
	public List<Code> findByIdAll(String id) {
		// TODO Auto-generated method stub
		return dao.findByIdAll(id);
	}

	@Override
	public Code findById(String id) {
		// TODO Auto-generated method stub
		return dao.findById(id);
	}

}
