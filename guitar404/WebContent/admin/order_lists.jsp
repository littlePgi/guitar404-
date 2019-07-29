<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>后台管理-订单管理</title>
	<link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<style type="text/css">
		.headshot{
			width:30px;
			height:30px;
		}
		/* table .contorl{
			width:100%;
			border-collapse: collapse;
			table-layout:fixed;/* 只有定义了表格的布局算法为fixed，下面td的定义才能起作用。 */
		}
		td{
			overflow:hidden;		/* 内容超出宽度时隐藏超出部分的内容 */ 
			white-space:nowrap;		/* 不换行 */
			text-overflow:ellipsis;	/* 当对象内文本溢出时显示省略标记(...) ；需与overflow:hidden;一起使用*/
		} */
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
				  <li><a href="index.jsp">首页</a></li>
				  <li><a href="guitar_list.jsp">订单管理</a></li>
				  <li class="active">已发货订单列表</li>
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
							<th>订单号</th>
							<th>商品名称</th>
							<th>下单时间</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">
						<tr>
							<td>${order.id}</td>
							<td>${order.guitar_name}</td>
							<td>${order.start_date}</td>
							<td>${order.number}</td>
							<td>${order.money}</td>
							<td>
								<a href="${ctx}/admin/order?act=delete&id=${order.id}" class="btn btn-danger btn-xs" onclick="return confirm('是否确认要删除？');"><i class="fa fa-remove"></i> 删除</a>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<a href="${ctx}/admin/order?act=list&abt=list" class="btn btn-success"><i class="fa fa-plus"></i>查看未发货订单</a>
			  </div>
			</div>
		</div>
    <script src="${ctx}/static/js/jquery.js"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        editor.create();
    </script>
</body>
</html>