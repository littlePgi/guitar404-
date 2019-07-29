<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="${ctx}">麦吉利吉他商城</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		      	<li><a href="${ctx}/admin/index.jsp">首页 <span class="sr-only">(current)</span></a></li>
		        <li><a href="${ctx}/admin/guitar?act=list">商品列表</a></li>
		        <li><a href="${ctx}/admin/guitar?act=edit">发布新吉他</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#">关于麦吉利</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户操作 <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="${ctx}/logout">退出登录</a></li>
		          </ul>
		        </li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>