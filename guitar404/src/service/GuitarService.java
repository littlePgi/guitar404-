package service;

import java.util.List;

import entity.Guitar;
import entity.GuitarImg;

public interface GuitarService {
	int create(Guitar guitar);
	int update(Guitar guitar);
	int delete(String id);
	Guitar findById(String id);
	List<Guitar> findAll();
	List<Guitar> findByClassical();//��ѯ��������Ϊ�ŵ伪��
	List<Guitar> findByFolk();//��ѯ��������Ϊ��ҥ����
	List<Guitar> findByMusic();//��ѯ��������Ϊ��������
	List<Guitar> findByIdAll(String id);//��ѯ��������֮���������Ʒ
	List<Guitar> findSearch(String name);//ģ����ѯ
}
