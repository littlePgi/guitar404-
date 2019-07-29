package service;

import java.util.Map;

public interface UserLoginService {
Map<String, Object> adminLogin(String username, String password);//管理员登录方法
	
	Map<String, Object> userLogin(String username, String password);//会员登录
	Map<String, Object> userRegister(String username, String password, String mobile, String sex);//会员注册
}
