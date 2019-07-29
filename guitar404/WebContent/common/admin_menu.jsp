<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">控制台</div>
	<!-- List group -->
	<div class="list-group">
		<a class="list-group-item" href="${ctx}/admin/guitar?act=list"><i class="fa fa-book"></i> 商品管理</a> 
		<a class="list-group-item" href="${ctx}/admin/user?act=list"><i class="fa fa-user"></i> 用户管理</a>
		<a class="list-group-item" href="${ctx}/admin/order?act=list&abt=list""><i class="fa fa-cart-arrow-down"></i> 订单管理</a>
	</div>
</div>