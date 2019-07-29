<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="user_top">
 <div class="top_style">
 <span class="l_f">客服热线：025-45874156</span>
 <div class="user_top_name r_f">
  <span class="shop_daun list_name">
  <div class="shop_erwm">
  <div class="erweima"> <img src="${ctx}/static/images/img_28.jpg"  width="80p" hidden="80"/></div>
  </div>  
  </span> 
 <span class="user_shopping">${loginUser.username}(${loginUser.mobile}) &nbsp;&nbsp;<a href="${ctx}/logout">退出</a></span>
 </div> 
 </div>
</div>
<div class="user_lanmu">
 <div class="user_style nav">
  <a href="#" class="user_logo"><img src="${ctx}/static/images/user_logo_03.png" /></a>
  <div class="navitems">
   <ul class="">
    <li><a href="#">首页</a></li>
    <li><a href="#">账户设置</a></li>
    <li><a href="#">消息</a></li>
   </ul>
  </div>
  <div class="cart_shop">
   <a href="${ctx}/user/cart?act=list"><em class="icon_cart"><span class="digital">1</span></em>我的购物车</a>
  </div>
 </div>
</div>