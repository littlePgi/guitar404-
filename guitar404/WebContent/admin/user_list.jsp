<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>后台管理-用户管理</title>
	<link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<style type="text/css">
		.headshot{
			width:30px;
			height:30px;
		}
	</style>
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
				  <li class="active">用户列表</li>
				</ol>
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>
				<c:if test="${not empty message}">
					<div class="alert alert-success" role="alert">${message}</div>
				</c:if>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>用户名</th>
							<th>性别</th>
							<th>手机号码</th>
							<th>用户类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="user">
						<c:if test="${user.state==1}">
						<tr>							
							<td>${user.id}</td>
							<td>${user.username}</td>
							<td>${user.sex}</td>
							<td>${user.mobil}</td>
							<td>${user.type}</td>
							<td>
								<a href="${ctx}/admin/user?act=edit&id=${user.id}" class="btn btn-info btn-xs"><i class="fa fa-edit"></i> 修改</a>
								<a href="${ctx}/admin/user?act=delete&id=${user.id}" class="btn btn-danger btn-xs" onclick="return confirm('是否确认要删除？');"><i class="fa fa-remove"></i> 删除</a>
							</td>
						</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
				<a href="${ctx}/admin/user?act=edit" class="btn btn-success"><i class="fa fa-plus"></i> 添加用户</a>
			  </div>
			</div>
		</div>
    <script src="${ctx}/static/js/jquery.js"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js"></script>
    <!-- <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        editor.create();
    </script> -->
</body>
</html>