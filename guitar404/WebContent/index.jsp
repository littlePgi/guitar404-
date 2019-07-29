<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>麦吉利商城-首页</title>
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
<body>
<!--[if lt IE 8]>
	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->

	<div class="wrapper">
		<!--Header Area Start-->
		<header>
		    <!--Default Header Area Start-->
		    <div class="default-header-area header-sticky header-bg">
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
                                        <li><a href="indexServlet">首页</i></a>
                                        </li>
                                        <li><a href="columu">商品列表 </a></li>
                                        <li><a href="blog.html">装饰用 </a>
                                            <!--Dropdown Menu Start-->
                                            <ul class="dropdown">
                                                <li><a href="blog.html">Blog Two Column</a></li>
                                                <li><a href="blog-three-column.html">Blog Three Column</a></li>
                                                <li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
                                                <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                                                <li><a href="single-blog.html">Single Blog</a></li>
                                                <li><a href="single-blog-left-sidebar.html">Single Blog Left Sidebar</a></li>
                                                <li><a href="blog-audio-post.html">Blog Post Audio</a></li>
                                                <li><a href="blog-gallery-post.html">Blog Post gallery</a></li>
                                                <li><a href="blog-video-post.html">Blog Post Video</a></li>
                                            </ul>
                                            <!--Dropdown Menu End-->
                                        </li>
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
                                        <c:if test="${not empty sessionScope.loginUser}">                      
                                          <li><a href="my-account.html">个人操作</a>
                                            <ul>
                                                <li><a href="cart?act=list">购物车</a></li>
                                                <li><a href="order?act=listAll">订单</a></li>
                                                <li><a href="information?act=list">我的账户</a></li>
                                                <li><a href="${ctx}/logout">注销</a></li>
                                            </ul>
                                          </li>
										</c:if> 
										<c:if test="${not empty sessionScope.loginAdmin}">
										  <li><a href="#">管理员操作</a>
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
                                          <span style="font-size:16px;"><a href="login-register.jsp">[登录]</a></span></li>
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
		<!--Slider And Banner Area 3 Start-->
		<div class="slider-area-and-banner-area-3">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="home3-slider-area">
                            <div class="hero-slider hero-slider3 owl-carousel">
                                <!--Single Slider Start-->
                                <div class="single-slider home3-single-slider"> 
                                <a href="${ctx}/details?id=98b37f7e51774132bfd75803f13a2feb"><img alt="" src="user/img/slider/bo.jpg"></a>
                                </div>
                                <!--Single Slider End-->
                                <!--Single Slider Start-->
                                <div class="single-slider home3-single-slider">   
                                   <a href="${ctx}/details?id=8ba8a505a5e642e4840e5f946e02a463"><img alt="" src="user/img/slider/lun.jpg"></a>
                                </div>
                                <!--Single Slider End-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
		<!--Slider And Banner Area 3 End-->
		<!--All Section Area-->
		<div class="wrapper-box">
		    <!--Testimonial Area Start-->
            <div class="testimonial-area testimonial-style-3 pt-75 pb-75">
                <div class="container">
                    <div class="row">
                        <div class="testimonial-slider owl-carousel">
                            <div class="col-12">
                                <!--Single Testimonial Area Start-->
                                <div class="single-testimonial-area">
                                    <div class="img-circle">
                                        <img src="user/img/testimonial/guitarfather.jpg" alt="">
                                    </div>
                                    <div class="testimonial-content">
                                        <p class="author-desc"> 姓名：Francisco Tarrega (弗朗西斯科·塔雷加),1852年11月21日出生于西班牙比利亚雷亚尔,1909年12月15日逝世于西班牙巴塞罗那,现代吉他之父塔雷加（一）</p>
                                        <p class="testimonial-author">吉他之父:弗朗西斯科·塔雷父</p>
                                    </div>
                                </div>
                                <!--Single Testimonial Area End-->
                            </div>
                            <div class="col-12">
                                <!--Single Testimonial Area Start-->
                                <div class="single-testimonial-area">
                                    <div class="testimonial-image">
                                        <img src="img/testimonial/testimonial2.png" alt="">
                                    </div>
                                    <div class="testimonial-content">
                                        <p class="author-desc">Perfect Themes and the best of all that you have many options to choose! Best Support team ever!Very fast responding and experts on their fields! Thank you very much! ..</p>
                                        <p class="testimonial-author">Amber Laha</p>
                                    </div>
                                </div>
                                <!--Single Testimonial Area End-->
                            </div>
                            <div class="col-12">
                                <!--Single Testimonial Area Start-->
                                <div class="single-testimonial-area">
                                    <div class="testimonial-image">
                                        <img src="img/testimonial/testimonial3.png" alt="">
                                    </div>
                                    <div class="testimonial-content">
                                        <p class="author-desc"> Code, template and others are very good. The support has served me immediately and solved my problems when I need help. Are to be congratulated. Att Renan Andrade ..</p>
                                        <p class="testimonial-author">Dewey Tetzlaff</p>
                                    </div>
                                </div>
                                <!--Single Testimonial Area End-->
                            </div>
                            <div class="col-12">
                                <!--Single Testimonial Area Start-->
                                <div class="single-testimonial-area">
                                    <div class="testimonial-image">
                                        <img src="img/testimonial/testimonial4.png" alt="">
                                    </div>
                                    <div class="testimonial-content">
                                        <p class="author-desc">  All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you ! ..</p>
                                        <p class="testimonial-author">Lavina Wilderman</p>
                                    </div>
                                </div>
                                <!--Single Testimonial Area End-->
                            </div>
                            <div class="col-12">
                                <!--Single Testimonial Area Start-->
                                <div class="single-testimonial-area">
                                    <div class="testimonial-image">
                                        <img src="img/testimonial/testimonial5.png" alt="">
                                    </div>
                                    <div class="testimonial-content">
                                        <p class="author-desc">  All Perfect !! I have three sites with magento , this theme is the best !! Excellent support , advice theme installation package , sorry for English, are Italian but I had no problem !! Thank you ! ..</p>
                                        <p class="testimonial-author">Stefano</p>
                                    </div>
                                </div>
                                <!--Single Testimonial Area End-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Testimonial Area End-->
            <!--Product Area Start-->
            <div class="product-area pt-20 pb-35">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <!--Section Title 2 Start-->
                            <div class="section-title2">
                                <h2>商品展示</h2>
                                <!--Product Tab Menu Start-->
                                <div class="product-tab-menu">
                                    <ul class="nav">
                                        <li><a class="active" data-toggle="tab" href="#bedroom">民谣</a></li>
                                        <li><a data-toggle="tab" href="#diningroom">电音</a></li>
                                        <li><a data-toggle="tab" href="#livingroom">古典</a></li>
                                    </ul>
                                </div>
                                <!--Product Tab Menu End-->
                            </div>
                            <!--Section Title 2 End-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="tab-content" >
                                <div class="tab-pane fade show active" id="bedroom">
                                    <div class="row">
                                        <div class="product-slider owl-carousel">
                                            <div class="col-md-12"">
                                                <!--Single Product Area Start-->
                                                <div style="width: 1300px;">
                                                   <c:forEach items="${flok}" var="flok">
	                                                <div class="single-product-area mb-40" style="float: left;width:270px;height:380px;margin-right: 30px;border:1px gray solid;">
		                                                    <div class="product-img img-full">
		                                                        <a href="${ctx}/details?id=${flok.id}">
		                                                            <img class="first-img" src="${ctx}/${flok.imgaddr}" alt="" style = "width:270px">
		                                                        </a>
		                                                        <span class="sticker">上新</span>
		                                                        <div class="product-action">
		                                                            <ul>
		                                                                <li><a href="cart?act=seve&guitarId=${flok.id}" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
		                                                                <li><a href="${ctx }/collection?act=save&guitarId=${flok.id}" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
		                                                            </ul>
		                                                        </div>
		                                                    </div>
		                                                    <div class="product-content" style="border-top:1px gray solid;">
		                                                        <h4><a href="${ctx}/details?id=${flok.id}">${flok.name}</a></h4>
		                                                        <div class="product-price">
		                                                            <span class="now-price">￥${flok.price}</span>
		                                                        </div>
		                                                    </div>
	                                                </div>
	                                                 </c:forEach>
	                                                </div>
                                                <!--Single Product Area End--> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <!--电音吉他列表--> 
                                <div class="tab-pane fade" id="diningroom">
                                    <div class="row">
                                        <div class="product-slider owl-carousel">
                                            <div class="col-md-12">
                                                <!--Single Product Area Start-->
                                                <div style="width: 1300px;">
                                                   <c:forEach items="${music}" var="music">
	                                                <div class="single-product-area mb-40" style="float: left;width:270px;height:380px;margin-right: 30px;border:1px gray solid;">
		                                                    <div class="product-img img-full">
		                                                        <a href="${ctx}/details?id=${music.id}">
		                                                            <img class="first-img" src="${ctx}/${music.imgaddr}" alt="" style = "width:270px;">
		                                                        </a>
		                                                        <span class="sticker">上新</span>
		                                                        <div class="product-action">
		                                                            <ul>
		                                                                <li><a href="cart?act=seve&guitarId=${music.id}" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
		                                                                <li><a href="${ctx }/collection?act=save&guitarId=${music.id}" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
		                                                            </ul>
		                                                        </div>
		                                                    </div>
		                                                    <div class="product-content">
		                                                        <h4><a href="${ctx}/details?id=${music.id}">${music.name}</a></h4>
		                                                        <div class="product-price">
		                                                            <span class="now-price">￥${music.price}</span>
		                                                        </div>
		                                                    </div>
	                                                </div>
	                                                 </c:forEach>
	                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="livingroom">
                                    <div class="row">
                                        <div class="product-slider owl-carousel">
                                            <div class="col-md-12">
                                                <!--Single Product Area Start-->
                                                <div style="width: 1300px;">
                                                   <c:forEach items="${classical}" var="classical">
	                                                <div class="single-product-area mb-40" style="float: left;width:270px;height:380px;margin-right: 30px;border:1px gray solid;">
		                                                    <div class="product-img img-full">
		                                                        <a href="${ctx}/details?id=${classical.id}">
		                                                            <img class="first-img" src="${ctx}/${classical.imgaddr}" alt="" style = "width:270px;height:300px;">
		                                                        </a>
		                                                        <span class="sticker">上新</span>
		                                                        <div class="product-action">
		                                                            <ul>
		                                                                <li><a href="cart?act=seve&guitarId=${classical.id}" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
		                                                                <li><a href="${ctx}/collection?act=save&guitarId=${classical.id}" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
		                                                            </ul>
		                                                        </div>
		                                                        <ul class="product-quickview">
		                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
		                                                        </ul>
		                                                    </div>
		                                                    <div class="product-content">
		                                                        <h4><a href="${ctx}/details?id=${classical.id}">${classical.name}</a></h4>
		                                                        <div class="product-price">
		                                                            <span class="now-price">￥${classical.price}</span>
		                                                        </div>
		                                                    </div>
	                                                </div>
	                                                 </c:forEach>
	                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="office">
                                    <div class="row">
                                        <div class="product-slider owl-carousel">
                                            <div class="col-md-12">
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product1.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                        <ul class="product-quickview">
                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">Lenovo Ideacentre 300</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$116.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product7.jpg" alt="">
                                                            <img class="hover-img" src="img/product/product9.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$602.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                            </div>
                                            <div class="col-md-12">
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product17.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                        <ul class="product-quickview">
                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">HP Notebook 15-ay011nr</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$78.80</span>
                                                            <span class="regular-price">$80.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product18.jpg" alt="">
                                                            <img class="hover-img" src="img/product/product17.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                        <ul class="product-quickview">
                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">ASUS ZenBook</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$104.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                            </div>
                                            <div class="col-md-12">
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product4.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                        <ul class="product-quickview">
                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$602.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product19.jpg" alt="">
                                                            <img class="hover-img" src="img/product/product1.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                        <ul class="product-quickview">
                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">Acer Aspire Desktop</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$98.00</span>
                                                            <span class="regular-price">$122.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                            </div>
                                            <div class="col-md-12">
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product4.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                        <ul class="product-quickview">
                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">Acer Aspire E 15</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$602.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product8.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                        <ul class="product-quickview">
                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">Acer Aspire AIO</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$86.00</span>
                                                            <span class="regular-price">$92.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                            </div>
                                            <div class="col-md-12">
                                                <!--Single Product Area Start-->
                                                <div class="single-product-area mb-40">
                                                    <div class="product-img img-full">
                                                        <a href="single-product.html">
                                                            <img class="first-img" src="img/product/product10.jpg" alt="">
                                                        </a>
                                                        <span class="sticker">New</span>
                                                        <div class="product-action">
                                                            <ul>
                                                                <li><a href="cart.html" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                <li><a href="wishlist.html" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                <li><a href="compare.html" title="Compare this Product"><span class="icon_datareport"></span></a></li>
                                                            </ul>
                                                        </div>
                                                        <ul class="product-quickview">
                                                            <li><a href="#open-modal" data-toggle="modal" title="Quick View"><span class="icon_search"></span></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="product-content">
                                                        <h4><a href="single-product.html">HP Pavilion 22cwa</a></h4>
                                                        <div class="product-price">
                                                            <span class="now-price">$110.00</span>
                                                            <span class="regular-price">$122.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Single Product Area End-->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <!--Product Area End-->
            <!--Our Collection Area Start-->
            <div class="our-collection-area collection-bg pb-75">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <!--Section Title Start-->
                            <div class="section-title">
                                <span class="sub-title">Our Collections</span>
                                <h2>Hot categories in this week</h2>
                            </div>
                            <!--Section Title End-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3" style="margin-top:70px;">
                            <!--Single Categorie Collection Start-->
                            <div class="single-categorie-collection mt-30">
                                <div class="categorie-collection-img">
                                    <a href="#"><img src="user/img/banner/img06.jpg" alt=""></a>
                                </div>
                            </div>
                            <!--Single Categorie Collection End-->
                        </div>
                        <div class="col-md-3">
                            <!--Single Categorie Collection Start-->
                            <div class="single-categorie-collection mt-30">
                                <div class="categorie-collection-img">
                                    <a href="#"><img src="user/img/banner/img03.jpg" alt="" style="height:260px;"></a>
                                </div>
                            </div>
                            <!--Single Categorie Collection End-->
                        </div>
                        <div class="col-md-6" style="margin-top:50px;">
                            <!--Single Categorie Collection Start-->
                            <div class="single-categorie-collection mt-30">
                                <div class="categorie-collection-img">
                                    <a href="#"><img src="user/img/banner/img01.jpg" alt=""></a>
                                </div>
                            </div>
                            <!--Single Categorie Collection End-->
                        </div>
                        <div class="col-md-6">
                            <!--Single Categorie Collection Start-->
                            <div class="single-categorie-collection mt-30">
                                <div class="categorie-collection-img">
                                    <a href="#"><img src="user/img/banner/img05.jpg" alt=""></a>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <a href="#"><img src="user/img/banner/img07.jpg" alt=""></a>
                                </div>
                            </div>
                            <!--Single Categorie Collection End-->
                        </div>
                        <div class="col-md-3">
                            <!--Single Categorie Collection Start-->
                            <div class="single-categorie-collection mt-30">
                                <div class="categorie-collection-img">
                                    <a href="#"><img src="user/img/banner/img04.jpg" alt=""></a>
                                </div>
                            </div>
                            <!--Single Categorie Collection End-->
                        </div>
                        <div class="col-md-3" style="margin-top:80px;">
                            <!--Single Categorie Collection Start-->
                            <div class="single-categorie-collection mt-30">
                                <div class="categorie-collection-img">
                                    <a href="#"><img src="user/img/banner/img02.jpg" alt="" style="width:300px;"></a>
                                </div>
                            </div>
                            <!--Single Categorie Collection End-->
                        </div>
                    </div>
                </div>
            </div>
            <!--Our Collection Area End-->
	<!--脚部-->
	<div>
		<p style="text-align:center;">麦吉利商城@本商城所有最终解释权归麦吉利商城所有</p>
		<p style="text-align:center;">*****想要链接吗@偏不给*****</p>
	</div>
	<!--脚部-->
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