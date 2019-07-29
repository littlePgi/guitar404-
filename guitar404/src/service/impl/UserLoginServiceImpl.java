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
			resultMap.put("error", "用户名或密码不能为空！");
		}else{
			User user = userDao.findByUsername(username);
			if(user==null){
				resultMap.put("error", "用户名输入错误！");
			}else{
				if(user.getPassword().equals(password)){
					resultMap.put("ok", true);
					resultMap.put("loginAdmin", user);//把登录成功的管理员对象保存到map，带到servlet层保存到session中
				}else{
					resultMap.put("error", "密码输入错误！");
				}
			}
		}
		return resultMap;
	}

	@Override
	public Map<String, Object> userLogin(String username, String password) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		
		//判断用户名是否存在
		User user = userDao.findByUsername(username);
		if(user!=null){
			if(user.getPassword().equals(password)){
				if(user.getState()==1){
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

	@Override
	public Map<String, Object> userRegister(String username, String password, String mobile, String sex) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ok", false);
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
		String date = format.format(new Date());
		
		//判断用户名是否已被注册
		User user = userDao.findByUsername(username);
		if(user==null){
			user = new User();
			user.setId(CommonUtil.getUUID());
			user.setUsername(username);
			user.setPassword(password);
			user.setSex(sex);
			user.setMobil(mobile);
			user.setSex(sex);
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
