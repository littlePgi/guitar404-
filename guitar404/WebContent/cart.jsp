<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>麦吉利吉他商城-购物车</title>
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
                                        <li><a href="columu">商品列表</a></li>
                                        <li><a href="blog.html">装饰用 </a></li>
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
                                <li>Shopping Cart</li>
                            </ul>
                            <h2>Shopping Cart</h2>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--Breadcrumb Area End-->
		<!--Shopping Cart Area Strat-->
		<div class="Shopping-cart-area pb-80">
		    <div class="container">
		        <div class="row">
		            <div class="col-12">
		                <!-- <form action="#"> -->
		                    <div class="table-content table-responsive">
		                        <table class="table">
		                            <thead>
		                                <tr>
		                                    <th class="indecor-product-remove">移除商品</th>
		                                    <th class="indecor-product-thumbnail">商品图片</th>
		                                    <th class="cart-product-name">商品名</th>
		                                    <th class="cart-product-name">商品规格</th>
		                                    <th class="indecor-product-price">商品单价</th>
		                                    <th class="indecor-product-quantity">商品数量</th>
		                                    <th class="indecor-product-remove">结算</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <c:forEach items="${cartList}" var="cart">
		                            	<form action="checkout" method="post">
		                            	<input type="hidden" name="cartId" value="${cart.id}" />
		                                <tr>
		                                    <td class="indecor-product-remove"><a href="cart?act=delete&cartId=${cart.id}"><i class="fa fa-times"></i></a></td>
		                                    <td class="indecor-product-thumbnail"><img src="${ctx}/${cart.guitar_imgaddr}" alt="对不起，图片走丢了" style="width:100px;"></a></td>
		                                    <td class="indecor-product-name"><a href="#">${cart.guitar_name}</a></td>
		                                    <td class="indecor-product-name">${cart.guitar_size_color}</td>
		                                    <td class="indecor-product-price"><span class="amount">${cart.guitar_price}</span></td>
		                                    <td class="indecor-product-quantity">
		                                        <input value="1" name="number">
		                                    </td>
		                                    <td>
		                                    	<input name="cartId" class="checkbox cart-cb" type="checkbox" value="${cart.id}" style="width:18px;height:18px;" />
		                                    </td>
		                                </tr>
		                                <tr>
		                                	<td>订单提交</td>
		                                	<td><input name="note" type="text" placeholder="备注" style="width:300px;border:1px gray solid;"/></td>
		                                	<td>应付金额
			                                	<input type="text" name="money" value="${cart.guitar_price}" readonly="readonly" style="width:160px;border:0px;" />
		                                	</td>
		                                	<td><input type="submit" value="付款" style="cursor:pointer;font-size:20px;"/></td>
		                                </tr>
			                              </form>
		                                </c:forEach>
		                            </tbody>
		                        </table>
		                    </div>
		                    <div class="row">
		                        <div class="col-md-5 ml-auto">
		                            <div class="cart-page-total">
		                               <div class="toolbar_right clearfix">
		                               <h2>结算</h2>
									     <div class="Quantity l_f marginright">已选择<em>0</em>件商品</div>
									     <div class="l_f">总价：<em class="Total_price">￥0.00</em></div>
									   </div>
		                                <a href="#">去付款</a>
		                            </div>
		                        </div>
		                    </div>
		                <!-- </form> -->
		            </div>
		        </div>
		    </div>
		</div>
		<!--Shopping Cart Area End-->
		<!--Footer Area Start-->
		<footer>
		    <div class="footer-container">
		        <!--Footer Top Area Start-->
		        <div class="footer-top-area footer-bg pt-80 pb-40">
		            <div class="container">
		                <div class="row">
		                    <div class="col-xl-4 col-lg-6 col-md-6 col-12">
		                        <!--Single Footer Wiedget Start-->
		                        <div class="single-footer-wiedget mb-30">
		                            <div class="footer-logo">
		                                <a href="index.html"><img src="img/logo/logo.png" alt=""></a>
		                            </div>
		                            <div class="social-link">
		                                <ul>
		                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
		                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
		                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
		                                    <li><a href="#"><i class="fa fa-youtube"></i></a></li>
		                                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
		                                </ul>
		                            </div>
		                            <div class="desc-footer">
		                                <p>Mauris interdum magna eu neque convallis, vel laoreet lectus ultrices. Mauris at ullamcorper orci. Maecenas in nulla erat.</p>
		                            </div>
		                            <div class="address-footer">
		                                <p class="phone"><span>+123.456.789 - +123.456.678</span></p>
		                                <p class="mail"><span>support@devitems.com</span></p>
		                            </div>
		                        </div>
		                        <!--Single Footer Wiedget End-->
		                    </div>
		                    <div class="col-xl-2 col-lg-6 col-md-6 col-12">
		                        <!--Single Footer Wiedget Start-->
		                        <div class="single-footer-wiedget mb-30">
		                            <div class="footer-title">
		                                <h3>Information</h3>
		                            </div>
		                            <ul class="link-widget">
		                                <li><a href="#">About Us</a></li>
		                                <li><a href="#">Delivery Information</a></li>
		                                <li><a href="#">Privacy Policy</a></li>
		                                <li><a href="#">Terms & Conditions</a></li>
		                                <li><a href="#">Contact Us</a></li>
		                                <li><a href="#">Returns</a></li>
		                                <li><a href="#">Site Map</a></li>
		                            </ul>
		                        </div>
		                        <!--Single Footer Wiedget End-->
		                    </div>
		                    <div class="col-xl-2 col-lg-6 col-md-6 col-12">
		                        <!--Single Footer Wiedget Start-->
		                        <div class="single-footer-wiedget mb-30">
		                            <div class="footer-title">
		                                <h3>Extras</h3>
		                            </div>
		                            <ul class="link-widget">
		                                <li><a href="#">Brands</a></li>
		                                <li><a href="#">Gift Certificates</a></li>
		                                <li><a href="#">Affiliate</a></li>
		                                <li><a href="#">Specials</a></li>
		                                <li><a href="#">My Account</a></li>
		                                <li><a href="#">Order History</a></li>
		                                <li><a href="#">Wish List</a></li>
		                            </ul>
		                        </div>
		                        <!--Single Footer Wiedget End-->
		                    </div>
		                    <div class="col-xl-4 col-lg-6 col-md-6 col-12">
		                        <!--Single Footer Wiedget Start-->
		                        <div class="single-footer-wiedget mb-30">
		                            <div class="footer-title">
		                                <h3>Send Newsletter</h3>
		                                <p>Sign up for our newsletter &amp; promotions</p>
		                            </div>
		                            <!--Newsletter Area Start-->
                                    <div class="newsletter-area">
                                        <div class="newsletter-form">
                                           <!-- Newsletter Form -->
                                           <form action="http://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="popup-subscribe-form validate" target="_blank" novalidate>
                                               <div id="mc_embed_signup_scroll">
                                                  <div id="mc-form" class="mc-form subscribe-form" >
                                                    <input id="mc-email" type="email" autocomplete="off" placeholder="Enter your email here" />
                                                    <button id="mc-submit">Subscribe !</button>
                                                  </div>
                                               </div>
                                           </form>
                                        </div>
                                    </div>
                                    <!--Newsletter Area End-->
                                    <div class="payment">
                                        <h3>payments</h3>
                                        <img src="img/payment/payment.png" alt="payment">
                                    </div>
		                        </div>
		                        <!--Single Footer Wiedget End-->
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!--Footer Top Area End-->
		        <!--Footer Bottom Area Start-->
		        <div class="footer-bottom-area pt-30 pb-20">
		            <div class="container">
		                <div class="row">
		                    <div class="col-lg-6 col-md-12 col-12">
		                        <!--Footer Copyright Start-->
		                        <div class="footer-copyright">
		                            <p>Copyright &copy; <a href="http://www.17sucai.com/">Indecor.</a> All Rights Reserved</p>
		                        </div>
		                        <!--Footer Copyright End-->
		                    </div>
		                    <div class="col-lg-6 col-md-12 col-12">
		                        <div class="custom-link-footer">
		                            <ul>
		                                <li><a href="#">About Us</a></li>
		                                <li><a href="#">Customer Services</a></li>
		                                <li><a href="#">Term & Conditions</a></li>
		                            </ul>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <!--Footer Bottom Area End-->
		    </div>
		</footer>
		<!--Footer Area End-->
	</div>
	<script>
	//计算购物车总价
  	$(".statistics span").each(function(){
  		total += parseFloat($(this).text());
  	})
  	$(".Total_price").text(total.toFixed(2));
  	
  	//多选框的事件
  	$(".cart-cb").click(function(){
  		var count = $("input[name='cartId']:checked").size();//获取已选中的购物车项数量
  		$(".Quantity em").text(count);
  	})
	</script>
	<!--Jquery 1.12.4-->
	<script src="jquery-3.3.1.js"></script>
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
