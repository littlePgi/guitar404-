package service;

import java.util.Map;

public interface UserLogin {
	Map<String, Object> userLogin(String username, String password);//��Ա��¼
	Map<String, Object> userRegister(String username, String password);//��Աע��
}
