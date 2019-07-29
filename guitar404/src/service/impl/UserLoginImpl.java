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
	 * 用户登录
	 */
	@Override
	public Map<String, Object> userLogin(String username, String password) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		
		//判断用户名是否存在
		User user = userDao.findByUsername(username);
		if(user!=null){
			if(user.getPassword().equals(password)){
				//判断是否是管理员
				if (user.getType()==1 && user.getState()==1) {
					resultMap.put("ok", true);
					resultMap.put("loginAdmin", user);
				}
				//判断是否管理员登录，普通用户是否是被删除
				if(user!=resultMap.get("loginAdmin") && user.getState()==1){
					resultMap.put("ok", true);
					resultMap.put("loginUser", user);
				}else{
					resultMap.put("error", "登录失败！该用户已被注销！");
				}
			}else{
				resultMap.put("error", "登录失败！密码不正确！");
			}
		}else{
			resultMap.put("error", "登录失败！用户名不存在！");
		}
		return resultMap;
	}
	/**
	 * 用户注册
	 */
	@Override
	public Map<String, Object> userRegister(String username, String password) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
		String date = format.format(new Date());
		
		//判断用户名是否已被注册
		User user = userDao.findByUsername(username);
		if(user==null){
			user = new User();
			user.setId(CommonUtil.getUUID());//自动生产ID
			user.setUsername(username);
			user.setPassword(password);
			user.setType(0);//设置类型为0，就是普通用户
			user.setDate(date);
			//保存到数据库
			int row = userDao.create(user);
			if(row>0){
				resultMap.put("ok", true);
			}else{
				resultMap.put("error", "注册失败！请联系网站管理员！");
			}
		}else{
			resultMap.put("error", "注册失败！此用户已被注册！");
		}
		return resultMap;
	}

}
