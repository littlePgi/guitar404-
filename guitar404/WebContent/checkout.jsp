<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>麦吉利吉他商城-结算</title>
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


	<!--[if lt IE 8]>
	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->

	<div class="wrapper wrapper-box">
		<!--Header Area Start-->
		<header>
		    <!--Default Header Area Start-->
		    <div class="default-header-area header-sticky">
		        <div class="container">
		            <div class="row align-items-center">
		                <div class="col-lg-3 col-md-4 col-12">
		                    <!--Logo Area Start-->
		                    <div class="logo-area">
		                        <a href="index.html"><img src="user/img/logo/guitar.png" alt=""></a>
		                    </div>
		                    <!--Logo Area End-->
		                </div>
		                <div class="col-lg-6 col-md-4 d-none d-lg-block col-12">
                            <!--Header Menu Area Start-->
                            <div class="header-menu-area text-center">
                                <nav>
                                    <ul class="main-menu">
                                        <li><a href="${ctx}">首页 </a>
                                        </li>
                                        <li><a href="columu">商品列表 </i></a></li>
                                        <li><a href="blog.html">装饰用 </i></a></li>
                                        <li><a href="about.html">关于我们</a></li>
                                        <li><a href="contact.html">调戏客服小姐姐</a></li>
                                        
                                    </ul>
                                </nav>
                            </div>
                            <!--Header Menu Area End-->
                        </div>
                        <div class="col-lg-3 col-md-5 col-12">
                            <!--Header Search And Mini Cart Area Start-->
                            <div class="header-search-cart-area">
                                <ul>
                                    <li><a class="sidebar-trigger-search" href="#"><span class="icon_search"></span></a></li>
                                    <c:if test="${not empty sessionScope}">
                                    <li class="currency-menu"><a href="#"><span class="icon_lock_alt"></span></a>
                                        <!--Crunccy dropdown-->
                                        <ul class="currency-dropdown">
                                          <!--Language Currency Start-->
                                          <c:if test="${not empty sessionScope.loginUser}">
	                                          <li><a href="#">个人操作</a>
	                                              <ul>
	                                                  <li><a href="cart?act=list">购物车</a></li>
	                                                  <li><a href="order?act=listAll">订单</a></li>
	                                                  <li><a href="information?act=list">我的账户</a></li>
	                                                  <li><a href="${ctx}/logout">注销</a></li>
	                                              </ul>
	                                          </li>
                                          </c:if>
                                          <c:if test="${not empty sessionScope.loginAdmin}">
										  <li><a href="my-account.html">管理员操作</a>
										  <ul>
                                                <li><a href="${ctx}/admin/index.jsp">后台管理</a></li>
                                                <li><a href="${ctx}/logout">注销</a></li>
                                            </ul>
										</c:if>   
                                          <!--Account Currency End-->
                                        </ul>
                                        <!--Crunccy dropdown-->
                                    </li>
                                    </c:if>
                                     <c:if test="${empty sessionScope}">                     
                                          <span style="font-size:16px;"><a href="${ctx}/login-register.jsp">[登录]</a></span></li>
									</c:if>  
                                    <li class="mini-cart">
                                    <a href="cart?act=list">
                                    	<span class="icon_bag_alt"></span>
                                     </a>
                                        <!--Mini Cart Dropdown Start-->
                                        <!--Mini Cart Dropdown End-->
                                    </li>
                                </ul>
                            </div>
                            <!--Header Search And Mini Cart Area End-->
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
		<div class="breadcrumb-area pb-80">
		    <div class="container">
		        <div class="row">
		            <div class="col-12">
                        <div class="breadcrumb-bg">
                            <ul class="breadcrumb-menu">
                                <li><a href="index.html">Home</a></li>
                                <li>Cheackout</li>
                            </ul>
                            <h2>Cheackout</h2>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--Breadcrumb Area End-->
		<!--Checkout Area Strat-->
		<form action="order?act=save" method="post">
		<input type="hidden" name="orderId" value="${order2.id}" />
		<div class="checkout-area pb-50">
		    <div class="container">
		        <div class="row">
		            <div class="col-lg-6 col-12">
		                    <div class="checkbox-form">
		                        <h3>寄到哪</h3>
		                        <div class="row">
		                           <!--  <div class="col-md-6">
		                                <div class="checkout-form-list">
		                                    <label>用户名<span class="required">*</span></label>
		                                    <input readonly="readonly" value="" type="text">
		                                </div>
		                            </div> -->
		                            <div class="col-md-6">
		                                <div class="checkout-form-list">
		                                    <label>收货人姓名<span class="required">*</span></label>
		                                    <input name="name" type="text">
		                                </div>
		                            </div>
		                            <div class="col-md-12">
		                                <div class="checkout-form-list">
		                                    <label>收货地址 <span class="required">*</span></label>
		                                    <input name="addr" placeholder="收货地址" type="text">
		                                </div>
		                            </div>
		                            <div class="col-md-6">
		                                <div class="checkout-form-list">
		                                    <label>联系电话  <span class="required">*</span></label>
		                                    <input name="mobil" type="text">
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		            </div>
		            <div class="col-lg-6 col-12">
		                <div class="your-order">
		                    <h3>您的订单</h3>
		                    <div class="your-order-table table-responsive">
		                        <table class="table">
		                            <thead>
		                                <tr>
		                                    <th class="cart-product-name">商品</th>
		                                    <th class="cart-product-total">总计</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <tr class="cart_item">
		                                  <td class="cart-product-name">${order2.guitar_name}<strong class="product-quantity"> * ${order2.number}</strong></td>
		                                  <td class="cart-product-total"><span class="amount">${order2.money}</span></td>  
		                                </tr>
		                            </tbody>
		                            <tfoot>
		                                <tr class="order-total">
		                                    <th>订单总计</th>
		                                    <td><strong><span class="amount">${order2.money * order2.number}</span></strong></td>
		                                </tr>
		                            </tfoot>
		                        </table>
		                    </div>
		                    <div class="payment-method">
		                        <div class="payment-accordion">
		                            <div id="accordion">
                                      <div class="card">
                                        <div class="card-header" id="#payment-1">
                                          <h5 class="panel-title">
                                            <a class="" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                             	 支付宝
                                            </a>
                                          </h5>
                                        </div>
                                        <div id="collapseOne" class="collapse show" data-parent="#accordion">
                                          <div class="card-body">
                                            <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="card">
                                        <div class="card-header" id="#payment-2">
                                          <h5 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                             	微信
                                            </a>
                                          </h5>
                                        </div>
                                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                          <div class="card-body">
                                            <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="card">
                                        <div class="card-header" id="#payment-3">
                                          <h5 class="panel-title">
                                            <a class="collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                         		    云闪付
                                            </a>
                                          </h5>
                                        </div>
                                        <div id="collapseThree" class="collapse" data-parent="#accordion">
                                          <div class="card-body">
                                            <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="order-button-payment">
                                        <input value="付款" type="submit">
                                    </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		</form>
		<!--Checkout Area End-->
		<!--Footer Area Start-->
		<!--Footer Area End-->
	</div>
    <!--All Js Here-->
    <div>
		<p style="text-align:center;">麦吉利商城@本商城所有最终解释权归麦吉利商城所有</p>
		<p style="text-align:center;">*****想要链接吗@偏不给*****</p>
	</div>
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
