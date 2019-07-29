package service;

import java.util.Map;

public interface UserLogin {
	Map<String, Object> userLogin(String username, String password);//会员登录
	Map<String, Object> userRegister(String username, String password);//会员注册
}
