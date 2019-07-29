package service;

import java.util.List;

import entity.Order;

public interface OrderService {
	int create(Order order);
	int update(Order order);//�ջ�
	int updateHair(Order order);//�ѷ���
	int updateClosed(Order order);//���ջ�
	int deleteOrder(String id);
	Order findById(String id);//���ɵĶ���
	List<Order> findByIdAll(String id);//ȫ�������б�
	List<Order> findByIdStayAll(String id);//�������б�
	List<Order> findByIdHairAll(String id);//�ѷ����б�
	List<Order> findByIdClosedAll(String id);//���ջ��б�
	List<Order> findAll();//ȫ�������б�
	List<Order> findByAll();//�ѷ��������б�
}
