<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="left_mun">
  <div id="menu">
   <dl>
    <dt>我的交易</dt>
    <dd><a href="${ctx}/user/order?act=list">我的订单</a></dd>
    <dd><a href="#">我的积分</a></dd>
   </dl>
   <dl>
    <dt>我的收藏</dt>
    <dd><a href="#">图书</a></dd>
    <dd><a href="#">作者</a></dd>
   </dl>
    <dl>
    <dt>我的足迹</dt>
    <dd><a href="#">浏览记录</a></dd>
    <dd><a href="#">评论记录</a></dd>
    <dd><a href="#">点赞记录</a></dd>
   </dl>
   <dl>
    <dt>设置</dt>
    <dd><a href="#">个人资料</a></dd>
    <dd><a href="${ctx}/user/consignee?act=list">地址管理</a></dd>
    <dd><a href="#">修改密码</a></dd>
   </dl>
  </div>
 </div>