package service;

import java.util.Map;

public interface UserLoginService {
Map<String, Object> adminLogin(String username, String password);//����Ա��¼����
	
	Map<String, Object> userLogin(String username, String password);//��Ա��¼
	Map<String, Object> userRegister(String username, String password, String mobile, String sex);//��Աע��
}
