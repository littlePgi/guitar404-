package service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserLogin;
import util.CommonUtil;

public class UserLoginImpl implements UserLogin{
	private UserDao userDao = null;
	
	public UserLoginImpl() {
		userDao=new UserDaoImpl();
	}
	/**
	 * �û���¼
	 */
	@Override
	public Map<String, Object> userLogin(String username, String password) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		
		//�ж��û����Ƿ����
		User user = userDao.findByUsername(username);
		if(user!=null){
			if(user.getPassword().equals(password)){
				//�ж��Ƿ��ǹ���Ա
				if (user.getType()==1 && user.getState()==1) {
					resultMap.put("ok", true);
					resultMap.put("loginAdmin", user);
				}
				//�ж��Ƿ����Ա��¼����ͨ�û��Ƿ��Ǳ�ɾ��
				if(user!=resultMap.get("loginAdmin") && user.getState()==1){
					resultMap.put("ok", true);
					resultMap.put("loginUser", user);
				}else{
					resultMap.put("error", "��¼ʧ�ܣ����û��ѱ�ע����");
				}
			}else{
				resultMap.put("error", "��¼ʧ�ܣ����벻��ȷ��");
			}
		}else{
			resultMap.put("error", "��¼ʧ�ܣ��û��������ڣ�");
		}
		return resultMap;
	}
	/**
	 * �û�ע��
	 */
	@Override
	public Map<String, Object> userRegister(String username, String password) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
		String date = format.format(new Date());
		
		//�ж��û����Ƿ��ѱ�ע��
		User user = userDao.findByUsername(username);
		if(user==null){
			user = new User();
			user.setId(CommonUtil.getUUID());//�Զ�����ID
			user.setUsername(username);
			user.setPassword(password);
			user.setType(0);//��������Ϊ0��������ͨ�û�
			user.setDate(date);
			//���浽���ݿ�
			int row = userDao.create(user);
			if(row>0){
				resultMap.put("ok", true);
			}else{
				resultMap.put("error", "ע��ʧ�ܣ�����ϵ��վ����Ա��");
			}
		}else{
			resultMap.put("error", "ע��ʧ�ܣ����û��ѱ�ע�ᣡ");
		}
		return resultMap;
	}

}
