<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title>后台管理-商品编辑</title>
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
				  <li><a href="#">商品管理</a></li>
				  <li class="active">商品编辑</li>
				</ol>
				<form action="${ctx}/admin/guitar" method="post" enctype="multipart/form-data">
				  <input type="hidden" name="act" value="save"/> 
				  <c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				  </c:if>
				  <div class="form-group">
				    <label>ID</label>
				    <input type="text" class="form-control" name="id" readonly="readonly" value="${guitar.id}">
				  </div>
				  <div class="form-group">
				  <span>商品名称</span>
				    <input type="text" class="form-control" name="name" value="${guitar.name}">
				  </div>
				  <div class="form-group">
				    <label>尺寸</label>
				    <select class="form-control" name="size">
						  <option value="38" >38</option>
						  <option value="39" >39</option>
					      <option value="40" selected="selected">40</option>
					      <option value="41" >41</option>
					</select>
				  </div>
				  <div class="form-group">
				    <label>颜色</label>
				   <select class="form-control" name="color">
						  <option value="日落色" >日落色</option>
						  <option value="黑色" >黑色</option>
					      <option value="原木色" selected="selected">原木色</option>
					</select>
				  </div>
				  <div class="form-group">
				  <span>价格</span>
				    <input type="text" class="form-control" name="price" value="${guitar.price}">
				  </div>
				   <div class="form-group">
				  <span>品牌</span>
				    <input type="text" class="form-control" name="brandName" value="${guitar.brand}">
				  </div>
				  <div class="form-group">
				  <span>材质</span>
				    <input type="text" class="form-control" name="materialName" value="${guitar.material}">
				  </div>
				  <div class="form-group">
				    <label>类型</label>
					   <select class="form-control" name="type">
						  <option value="电音" >电音</option>
					      <option value="民谣" selected="selected">民谣</option>
					      <option value="古典" >古典</option>
						</select>
				  </div>	
				   <div class="form-group">
				    <label>缩略图</label>
				   <input type="file" name="img" />
    				<p class="help-block">请选择你要上传的缩略图</p>
				  </div>
				  <div class="form-group">
				    <label>详情</label>
				    <div id="editor">${book.detail}</div>
				    <textarea id="detail" name="detail" style="width:100%; height:200px;display:none;"></textarea>
				  </div>		 
				  <button type="submit" class="btn btn-default">提交</button>
				</form>
			  </div>
			</div>
		</div>
    <script src="${ctx}/static/js/jquery.js"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${ctx}/static/wangEditor-3.1.1/wangEditor.min.js"></script>
   <!--  <script type="text/javascript">
	    var E = window.wangEditor
	    var editor = new E('#editor');
	    var $detail = $('#detail');
	    editor.customConfig.onchange = function (html) {
	        // 监控变化，同步更新到 textarea
	        $detail.val(html)
	    }
	 	// 配置服务器端图片上传地址
	    editor.customConfig.uploadImgServer = '${ctx}/admin/book/upload';
	 	// 将图片大小限制为 3M
	    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
	 	// 限制一次最多上传 5 张图片
	    editor.customConfig.uploadImgMaxLength = 5
	    editor.create();
	    // 初始化 textarea 的值
	    $detail.val(editor.txt.html());
    </script> -->
</body>
</html>