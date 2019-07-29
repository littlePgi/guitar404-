<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>麦吉利吉他商城-商品列表</title>
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
                                        <li><a href="columu">商品列表 </a></li>
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
                                <li>Shop 4 Column</li>
                            </ul>
                            <h2>Shop Four Column</h2>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--Breadcrumb Area End-->
		<!--Shop Area Start-->
		<div class="shop-area pb-40">
		    <div class="container">
		       <div class="row">
		            <div class="col-lg-12 col-12">
		                <div class="shop-layout">
		                    <!--Grid & List View Start-->
		                    <div class="shop-topbar-wrapper d-md-flex justify-content-md-between align-items-center">
		                        <div class="grid-list-option">
		                             <ul class="nav">
                                      <li>
                                        <a class="active" data-toggle="tab" href="#grid"><i class="fa fa-th"></i></a>
                                      </li>
                                      <li>
                                        <a data-toggle="tab" href="#list"><i class="fa fa-th-list"></i></a>
                                      </li>
                                    </ul>
		                         </div>
		                    </div>
		                    <!--Grid & List View End-->
		                    <!--Shop Product Start-->
		                    <div class="shop-product">
		                        <div id="myTabContent-2" class="tab-content">
		                            <div id="grid" class="tab-pane fade show active">
		                                <div class="product-grid-view">
		                                    <div class="row">
                                                <div class="col-lg-3 col-xl-3 col-md-4 col-sm-6">
                                                    <!--Single Product Area Start-->
                                                    <div style="width: 1300px;">
                                                    <c:forEach items="${guitarList }" var="guitar">
                                                    <div class="single-product-area mb-40" style="float:left;width:270px;height:400px;margin-right: 30px;border:1px gray solid;">
                                                        <div class="product-img img-full">
                                                            <a href="details?id=${guitar.id}">
                                                                <img class="first-img" src="${ctx}/${guitar.imgaddr}" alt="图片走丢了" style = "width:270px;height:270px;">
                                                            </a>
                                                            <div class="product-action">
                                                                <ul>
                                                                    <li><a href="${ctx}/cart?act=seve&guitarId=${guitar.id}" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                    <li><a href="${ctx }/collection?act=save&guitarId=${guitar.id}" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="product-content">
                                                            <h4><a href="${ctx}/details?id=${guitar.id}">${guitar.name}</a></h4>
                                                            <div class="product-price">
                                                                <span class="now-price">￥${guitar.price}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </c:forEach>
                                                    <!--Single Product Area End--> 
                                                </div>
                                                </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div id="list" class="tab-pane fade">
		                                <div class="product-list-view">
		                                <c:forEach items="${guitarList }" var="guitar">
		                                    <div class="product-list-item mb-40">
		                                        <div class="row" style="border:1px solid gray">
		                                            <!--Single List Product Start-->
		                                            <div class="col-md-4">
		                                                <div class="single-product-area">
		                                                    <div class="product-img img-full">
                                                                <a href="${ctx}/details?id=${guitar.id}">
                                                                    <img class="first-img" src="${ctx}/${guitar.imgaddr}" alt="图片走丢了" style = "width:270px;border-right:1px solid gray"" alt="">
                                                                </a>
                                                                <span class="sticker">New</span>
                                                            </div>
		                                                </div>
		                                            </div>
		                                            <div class="col-md-8">
		                                                <div class="product-content shop-list">
		                                                    <h4><a href="${ctx}/details?id=${guitar.id}">${guitar.name}</a></h4>
                                                            <div class="product-price">
                                                                <span class="now-price">${guitar.price}</span>
                                                            </div>
                                                            <div class="product-description">
                                                                <p>吉他简介</p>
                                                            </div>
                                                            <div class="product-list-action">
                                                                <ul>
                                                                    <li><a href="${ctx}/cart?act=seve&guitarId=${guitar.id}" title="Add To Cart"><span class="icon_bag_alt"></span></a></li>
                                                                    <li><a href="${ctx}/collection?act=save&guitarId=${guitar.id}" title="Add to Wish List"><span class=" icon_heart_alt "></span></a></li>
                                                                </ul>
                                                            </div>
		                                                </div>
		                                            </div>
		                                            <!--Single List Product End-->
		                                        </div>
		                                    </div>
		                                    </c:forEach>
		                                </div>
		                            </div>
		                            <!--Pagination Start-->
		                            <!-- <div class="product-pagination">
		                                <ul>
		                                    <li class="active"><a href="#">1</a></li>
		                                    <li><a href="#">2</a></li>
		                                    <li><a href="#">3</a></li>
		                                    <li><a href="#">4</a></li>
		                                    <li><a href="#">5</a></li>
		                                    <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
		                                </ul>
		                            </div> -->
		                            <!--Pagination End-->
		                        </div>
		                    </div>
		                    <!--Shop Product End-->
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--Shop Area End-->
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
		<!-- Modal Area Strat -->
        <div class="modal fade" id="open-modal" tabindex="-1" role="dialog" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i></button>
              </div>
              <div class="modal-body">
                <div class="row">
                    <!--Modal Img-->
                    <div class="col-md-5">
                        <!--Modal Tab Content Start-->
                        <div class="tab-content product-details-large" id="myTabContent">
                          <div class="tab-pane fade show active" id="single-slide1" role="tabpanel" aria-labelledby="single-slide-tab-1">
                              <!--Single Product Image Start-->
                              <div class="single-product-img img-full">
                                <img src="img/single-product/small/single-product1.jpg" alt="">
                              </div>
                              <!--Single Product Image End-->
                          </div>
                          <div class="tab-pane fade" id="single-slide2" role="tabpanel" aria-labelledby="single-slide-tab-2">
                              <!--Single Product Image Start-->
                              <div class="single-product-img img-full">
                                <img src="img/single-product/small/single-product2.jpg" alt="">
                              </div>
                              <!--Single Product Image End-->
                          </div>
                          <div class="tab-pane fade" id="single-slide3" role="tabpanel" aria-labelledby="single-slide-tab-3">
                              <!--Single Product Image Start-->
                              <div class="single-product-img img-full">
                                <img src="img/single-product/small/single-product3.jpg" alt="">
                              </div>
                              <!--Single Product Image End-->
                          </div>
                          <div class="tab-pane fade" id="single-slide4" role="tabpanel" aria-labelledby="single-slide-tab-4">
                              <!--Single Product Image Start-->
                              <div class="single-product-img img-full">
                                <img src="img/single-product/small/single-product4.jpg" alt="">
                              </div>
                              <!--Single Product Image End-->
                          </div>
                          <div class="tab-pane fade" id="single-slide5" role="tabpanel" aria-labelledby="single-slide-tab-4">
                              <!--Single Product Image Start-->
                              <div class="single-product-img img-full">
                                <img src="img/single-product/small/single-product5.jpg" alt="">
                              </div>
                              <!--Single Product Image End-->
                          </div>
                        </div>
                        <!--Modal Content End-->
                        <!--Modal Tab Menu Start-->
                        <div class="single-product-menu">
                            <div class="nav single-slide-menu owl-carousel" role="tablist">
                                <div class="single-tab-menu img-full">
                                    <a class="active" data-toggle="tab" id="single-slide-tab-1" href="#single-slide1"><img src="img/single-product/small/single-product1.jpg" alt=""></a>
                                </div>
                                <div class="single-tab-menu img-full">
                                    <a data-toggle="tab" id="single-slide-tab-2" href="#single-slide2"><img src="img/single-product/small/single-product2.jpg" alt=""></a>
                                </div>
                                <div class="single-tab-menu img-full">
                                    <a data-toggle="tab" id="single-slide-tab-3" href="#single-slide3"><img src="img/single-product/small/single-product3.jpg" alt=""></a>
                                </div>
                                <div class="single-tab-menu img-full">
                                    <a data-toggle="tab" id="single-slide-tab-4" href="#single-slide4"><img src="img/single-product/small/single-product4.jpg" alt=""></a>
                                </div>
                                <div class="single-tab-menu img-full">
                                    <a data-toggle="tab" id="single-slide-tab-5" href="#single-slide5"><img src="img/single-product/small/single-product5.jpg" alt=""></a>
                                </div>
                            </div>
                        </div>
                        <!--Modal Tab Menu End-->
                    </div>
                    <!--Modal Img-->
                    <!--Modal Content-->
                    <div class="col-md-7">
                        <div class="modal-product-info">
                            <h1>Sit voluptatem</h1>
                            <div class="modal-product-price">
                               <span class="old-price">$74.00</span>
                               <span class="new-price">$69.00</span>
                           </div>
                           <a href="single-product.html" class="see-all">See all features</a>
                           <div class="add-to-cart quantity">
                                <form class="add-quantity" action="#">
                                     <div class="modal-quantity">
                                         <input type="number" value="1">
                                     </div>
                                    <div class="add-to-link">
                                        <button class="form-button" data-text="add to cart">add to cart</button>
                                    </div>
                                </form>
                           </div>
                           <div class="cart-description">
                               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco,Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus.</p>
                           </div>
                            <div class="social-share">
                               <h3>Share this product</h3>
                               <ul class="socil-icon2">
                                   <li><a href=""><i class="fa fa-facebook"></i></a></li>
                                   <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                   <li><a href=""><i class="fa fa-pinterest"></i></a></li>
                                   <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                                   <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                               </ul>
                            </div>
                        </div>
                    </div>
                    <!--Modal Content-->
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Modal Area End -->
	</div>





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
