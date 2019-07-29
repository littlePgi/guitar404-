<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>在线书店-用户注册成功</title>
	<link  href="${ctx}/static/css/common.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/static/css/style.css" type="text/css" rel="stylesheet" />
	<script src="${ctx}/static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="${ctx}/static/js/jquery.SuperSlide.2.1.1.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/layer/layer.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</head>
<body>
	<div class="login_style register_style">
 <div class="login_top">
 	<a href="#"><img src="${ctx}/static/images/logo.jpg"  /></a>
 	<span class="title">会员注册</span>
 </div>
 <div class="login_add_style clearfix">
  <div class="login_ad">
   <img src="${ctx}/static/images/bg_login_03.png" />
  </div>
  <div class="add_login_cont clearfix relative">
    <div class="login_content Reg_log_style ">
     <div class="hd"><ul class="login_name clearfix"><li>普通会员</li></ul></div>
      <div class="login_prompt">
      	<a href="#"><i class="icon_explanation"></i>恭喜您，注册本网站会员成功！</a>
      </div>
      <p><a href="${ctx}/login.jsp">立即登录</a> | <a href="${ctx}">返回首页</a></p>
    </div>
    <script> jQuery(".Reg_log_style").slide({trigger:"click"});</script> 
    <!--二维码-->
    <div class="erweima">
   <img src="${ctx}/static/images/erweima.jpg" width="80px" height="80px"/>
   <h5>微信扫一扫</h5>
  </div>
  </div> 
  </div> 
</div>
	<%@ include file="/common/footer.jsp" %><!-- 引入脚部 -->
</body>
</html>