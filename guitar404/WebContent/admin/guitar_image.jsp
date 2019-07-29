<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>后台管理-商品图片</title>
	<link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<style type="text/css">
		.headshot{
			width:30px;
			height:30px;
		}
		.book-image{
			list-style:none;
		}
		.book-image li{
			float:left;
			margin-left:10px;
			margin-top:10px;
		}
		.book-image li img{
			width:180px;
			height:180px;
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
				  <li><a href="#">商品管理</a></li>
				  <li class="active">商品图片列表</li>
				</ol>
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>
				<c:if test="${not empty message}">
					<div class="alert alert-success" role="alert">${message}</div>
				</c:if>
				<div class="well" style="font-size:20px;font-weight:bold;">${guitar.name}</div>
				<ul class="book-image">
					<c:forEach items="${guitarImageList}" var="guitarImageList">
					<li><img src="${ctx}/${guitarImageList.url}" class="img-thumbnail"></li>
					</c:forEach>
					<div style="clear:both;"></div>
				</ul>
				<!-- 图片上传 -->
				<form action="${ctx}/admin/guitarImage" method="post" enctype="multipart/form-data">
				  <input type="hidden" name="guitarId" value="${guitar.id}" /><!-- 隐藏域放置图书的id -->
				  <div class="form-group">
				    <label for="exampleInputFile">选择要上传的图片
				    <input type="file" name="file" multiple></label>
				    <p class="help-block">支持多图片上传</p>
				  </div>
				  <button type="submit" class="btn btn-info"><i class="fa fa-upload"></i> 上传</button>
				</form>
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