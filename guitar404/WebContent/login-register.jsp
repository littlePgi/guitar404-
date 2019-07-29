﻿<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>登录 || 注册</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Place favicon.ico in the root directory -->
	
    <!--All Css Here-->
    
	<!-- Elegant Icon Font CSS-->
    <link rel="stylesheet" href="user/css/elegant_font.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="user/css/font-awesome.min.css">
    <!-- Ionicons CSS-->
    <link rel="stylesheet" href="user/css/ionicons.min.css">
    
	<!-- Bootstrap CSS-->
	<link rel="stylesheet" href="user/css/bootstrap.min.css">
	<!-- Plugins CSS-->
	<link rel="stylesheet" href="user/css/plugins.css">
	<!-- Style CSS -->
	<link rel="stylesheet" href="user/style.css">
	<!-- Responsive CSS -->
	<link rel="stylesheet" href="user/css/responsive.css">
	<!-- Modernizr Js -->
	<script src="user/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<div class="wrapper wrapper-box">
		<!--Header Area Start-->
		<header>
		    <!--Default Header Area Start-->
		    <div class="default-header-area header-sticky">
		        <div class="container">
		            <div class="row align-items-center">
		                <div class="col-lg-3 col-md-4 col-12">
		                    <!--网站LOGO-->
		                    <div class="logo-area">
		                        <a href="index.html">麦吉利吉他商城</a>
		                    </div>
		                    <!--Logo Area End-->
		                </div>
		                <div class="col-lg-6 col-md-4 d-none d-lg-block col-12">
                            <!--Header Menu Area Start-->
                            <div class="header-menu-area text-center">
                                <nav>
                                    <ul class="main-menu">
                                        <li><a href="indexServlet">首页</i></a></li>                                   
                                        <li><a href="about.html">关于我们</a></li>
                                        <li><a href="contact.html">联系我们</a></li>                                
                                   </ul>
                                </nav>
                            </div>
                            <!--Header Menu Area End-->
                        </div>
                        <div class="col-lg-3 col-md-5 col-12">
                        </div>
		            </div>
		            <div class="row">
                        <div class="col-12"> 
                            <!--Mobile Menu Area Start-->
                            <div class="mobile-menu d-lg-none"></div>
                            <!--Mobile Menu Area End-->
                        </div>
                    </div>
		        </div>
		    </div>
		    <!--Default Header Area End-->
		</header>
		<!--Header Area Start-->
		<!-- main-search start -->
        <div class="main-search-active">
            <div class="sidebar-search-icon">
                <button class="search-close"><span class="ion-android-close"></span></button>
            </div>
            <div class="sidebar-search-input">
                <form>
                    <div class="form-search">
                        <input id="search" class="input-text" value="" placeholder="Search Entire Store" type="search">
                        <button>
                            <i class="ion-android-search"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <!-- main-search End -->
		<!--Breadcrumb Area Start-->
		<div class="breadcrumb-area pb-75">
		    <div class="container">
		        <div class="row">
		            <div class="col-12">
                        <div class="breadcrumb-bg">
                            <ul class="breadcrumb-menu">
                                <li><a href="index.html">Home</a></li>
                                <li>Login Register</li>
                            </ul>
                            <h2>Login Register</h2>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--Breadcrumb Area End-->
		<!--Login Register Area Strat-->
		<div class="login-register-area pb-50">
		    <div class="container">
		        <div class="row">
                    <!--Login Form Start-->
		            <div class="col-md-6 col-12">
		                <div class="customer-login-register">
		                    <div class="form-login-title">
		                        <h2>登录</h2>
		                        <c:if test="${not empty prompts}">
		                        	<p style="color:red;">${prompts}</p>
		                        </c:if>
		                        <c:if test="${not empty error}">
		                        	<p style="color:red;">${error}</p>
		                        </c:if>
		                         <c:if test="${not empty reset}">
		                        	<p style="color:red;">${reset}</p>
		                        </c:if>
		                    </div>
		                    <div class="login-form">
		                        <form action="login" method="post">
		                            <div class="form-fild">
		                                <p><label>用户名   <span class="required">*</span></label></p>
		                                <input name="username" value="" type="text">
		                            </div>
		                            <div class="form-fild">
		                                <p><label> 密码    <span class="required">*</span></label></p>
		                                <input name="password" value="" type="password">
		                            </div>
		                            <div class="login-submit">
		                                <button type="submit" class="form-button">登录</button>
		                                <label>
		                                    <input class="checkbox" name="rememberme" value="" type="checkbox">
		                                    <span>记住密码</span>
		                                </label>
		                            </div>
		                            <div class="lost-password">
		                                <a href="reset.jsp">忘记密码</a>
		                            </div>
		                        </form>
		                    </div>
		                </div>
		            </div>
		            <!--Login Form End-->
		            <!--Register Form Start-->
		            <div class="col-md-6 col-12">
		                <div class="customer-login-register register-pt-0">
		                    <div class="form-register-title">
		                        <h2>注册</h2>
		                        <c:if test="${not empty prompt}">
		                        	<p style="color:red;">${prompt}</p>
		                        </c:if>
		                    </div>
		                    <div class="register-form config-2">
		                        <form action="register" method="post">
		                            <div class="form-fild">
		                                <p><label>用户名 <span class="required">*</span></label></p>
		                                <input name="username" value="" type="text">
		                            </div>
		                            <div class="form-fild">
		                                <p><label>密码 <span class="required">*</span></label></p>
		                                <input name="password" value="" type="password">
		                            </div>
		                            <div class="form-fild">
		                                <p><label>电话号码 <span class="required">*</span></label></p>
		                                <input name="mobil" value="" type="text">
		                            </div>
		                            <select name="sex">
		                            	<option selected="selected">男</option>
		                            	<option>女</option>
		                            </select>
		                            <div class="register-submit">
		                                <button type="submit" class="form-button">提交</button>
		                            </div>
		                        </form>
		                    </div>
		                </div>
		            </div>
		            <!--Register Form End-->
		        </div> 
		    </div>
		</div>
	</div>
	<!--脚部-->
	<div>
		<p style="text-align:center;">麦吉利商城@本商城所有最终解释权归麦吉利商城所有</p>
		<p style="text-align:center;">*****想要链接吗@偏不给*****</p>
	</div>
	<!--脚部-->
    <!--All Js Here-->
	<!--Jquery 1.12.4-->
	<script src="user/js/vendor/jquery-1.12.4.min.js"></script>
	<!--Popper-->
	<script src="user/js/popper.min.js"></script>
	<!--Bootstrap-->
	<script src="user/js/bootstrap.min.js"></script>
	<!--Ajax Mail-->
	<script src="user/js/ajax-mail.js"></script>
	<!--Plugins-->
	<script src="user/js/plugins.js"></script>
	<!--Main Js-->
	<script src="user/js/main.js"></script>
</body>
</html>
