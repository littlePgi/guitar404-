<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>后台管理-商品管理</title>
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
				  <li><a href="guitar_list.jsp">商品管理</a></li>
				  <li class="active">商品列表</li>
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
							<th>缩略图</th>
							<th>ID</th>
							<th>商品名称</th>
							<th>品牌</th>
							<th>材质</th>
							<th>尺寸</th>
							<th>颜色</th>
							<th>价格</th>
							<th>类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="guitar">
						<c:if test="${guitar.state==1}">
						<tr>
							<td><img src="${ctx}/${guitar.imgaddr}" class="img-circle headshot"/></td>						
							<td>${guitar.id}</td>
							<td>${guitar.name}</td>
							<td>${guitar.brand}</td>
							<td>${guitar.material}</td>
							<td>${guitar.size}</td>
							<td>${guitar.color}</td>
							<td>${guitar.price}</td>
							<td>${guitar.type}</td>
							<td>
								<a href="${ctx}/admin/guitar?act=edit&id=${guitar.id}" class="btn btn-info btn-xs"><i class="fa fa-edit"></i> 修改</a>
								<a href="${ctx}/admin/guitar?act=delete&id=${guitar.id}" class="btn btn-danger btn-xs" onclick="return confirm('是否确认要删除？');"><i class="fa fa-remove"></i> 删除</a>
								<a href="${ctx}/admin/guitar?act=image&id=${guitar.id}" class="btn btn-warning btn-xs"><i class="fa fa-image"></i> 图片</a>
							</td>
						</tr>
						</c:if>
						</c:forEach>
					</tbody>
				</table>
				<a href="${ctx}/admin/guitar?act=edit" class="btn btn-success"><i class="fa fa-plus"></i> 添加商品</a>
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