package service;

import java.util.List;

import entity.Code;

public interface CodeService {
	int create(Code code);
	int update(Code code);
	int delete(String id);
	List<Code> findByIdAll(String id);//�ջ���ַ�б�
	Code findById(String id);//�޸��ջ���ַ
}
