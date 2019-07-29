package service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.User;
import service.UserLoginService;
import util.CommonUtil;

public class UserLoginServiceImpl implements UserLoginService {
	private UserDao userDao = null;
	
	public UserLoginServiceImpl() {
		userDao=new UserDaoImpl();
	}
	
	@Override
	public Map<String, Object> adminLogin(String username, String password) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		if(username==null||username.equals("")||password==null||password.equals("")){
			resultMap.put("error", "�û��������벻��Ϊ�գ�");
		}else{
			User user = userDao.findByUsername(username);
			if(user==null){
				resultMap.put("error", "�û����������");
			}else{
				if(user.getPassword().equals(password)){
					resultMap.put("ok", true);
					resultMap.put("loginAdmin", user);//�ѵ�¼�ɹ��Ĺ���Ա���󱣴浽map������servlet�㱣�浽session��
				}else{
					resultMap.put("error", "�����������");
				}
			}
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> userLogin(String username, String password) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		
		//�ж��û����Ƿ����
		User user = userDao.findByUsername(username);
		if(user!=null){
			if(user.getPassword().equals(password)){
				if(user.getState()==1){
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

	@Override
	public Map<String, Object> userRegister(String username, String password, String mobile, String sex) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
		String date = format.format(new Date());
		
		//�ж��û����Ƿ��ѱ�ע��
		User user = userDao.findByUsername(username);
		if(user==null){
			user = new User();
			user.setId(CommonUtil.getUUID());
			user.setUsername(username);
			user.setPassword(password);
			user.setSex(sex);
			user.setMobil(mobile);
			user.setSex(sex);
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
