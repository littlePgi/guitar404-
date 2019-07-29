<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>后台管理-用户编辑</title>
	<link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/common/admin_header.jsp" %><!-- 引入头部 -->
		<div class="container">
			<div class="row">
			  <div class="col-xs-6 col-md-3" style="height:200px;">
			  	<%@ include file="/common/admin_menu.jsp" %><!-- 引入左边菜单 -->
			  </div>
			  <div class="col-xs-6 col-md-9" style="height:200px;">
			  	<ol class="breadcrumb">
				  <li><a href="#">首页</a></li>
				  <li><a href="#">用户管理</a></li>
				  <li class="active">用户编辑</li>
				</ol>
				<form action="${ctx}/admin/user" method="post">
				  <input type="hidden" name="act" value="save"/> 
				  <c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				  </c:if>
				  <div class="form-group">
				    <label>ID</label>
				    <input type="text" class="form-control" name="id" readonly="readonly" value="${user.id}">
				  </div>
				  <div class="form-group">
				    <label>用户名</label>
				    <input type="text" class="form-control" name="username" value="${user.username}">
				  </div>
				  <div class="form-group">
				    <label>密码</label>
				    <input type="text" class="form-control" name="password" value="${user.password}">
				  </div>
				  <div class="form-group">
				  <span>性别</span>
				    <label><input type="radio" name="radio" value="男" checked="checked" />男</label>
				    <label><input type="radio" name="radio" value="女" />女</label>
				  </div>
				  <div class="form-group">
				    <label>电话号码</label>
				    <input type="text" class="form-control" name="mobil" value="${user.mobil}">
				  </div>			 
				  <button type="submit" class="btn btn-default">提交</button>
				</form>
			  </div>
			</div>
		</div>
    <script src="${ctx}/static/js/jquery.js"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js"></script>
</body>
</html>