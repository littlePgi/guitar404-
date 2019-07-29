<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>麦吉利吉他商城-商品详情</title>
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
                                <li>Single Product</li>
                            </ul>
                            <h2>Single Product</h2>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--Breadcrumb Area End-->
		<!--Single Product Area Start-->
		<c:if test="${not empty guitar}">
		<div class="single-product-area pb-70">
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12 col-lg-6">
		                <!-- Product Details Left -->
                       
                        <div class="product-details-left">
                            <div class="product-details-images slider-lg-image-1">
                                <div class="lg-image">
                                    <div class="easyzoom easyzoom--overlay">
                                        <a href="${ctx}/${guitar.imgaddr}">
                                          <img src="${ctx}/${guitar.imgaddr}" alt="" >
                                        </a>
                                        <a href="${ctx}/${guitar.imgaddr}" class="popup-img venobox" data-gall="myGallery"><i class="fa fa-expand"></i></a>
                                     </div>
                                </div>
	                           <!--  <div class="product-details-thumbs slider-thumbs-1">										
 	                                <div class="sm-image"><img src="user/img/single-product/small/single-product1.jpg" alt="product image thumb"></div>
	                            </div> -->
                        	</div>
                        </div>
                        <!--Product Details Left -->
		            </div>
		            
		            <div class="col-md-12 col-lg-6">
                        <!--Product Details Content Start-->
		                <div class="product-details-content">
                            <!--Product Nav Start-->
                            <div class="product-nav">
                                <a href="#"><i class="fa fa-angle-left"></i></a>
                                <a href="#"><i class="fa fa-angle-right"></i></a>
                            </div>
                            <!--Product Nav End-->
                            <!-- 添加购物车 -->
			                    <h2>${guitar.name}</h2>
			                    <div class="single-product-reviews">
	                                <i class="fa fa-star"></i>
	                                <i class="fa fa-star"></i>
	                                <i class="fa fa-star"></i>
	                                <i class="fa fa-star"></i>
	                                <i class="fa fa-star-o"></i>
	                                <a class="review-link" href="#">(买家满意度)</a>
	                            </div>
	                            <div class="single-product-price">
	                                <span class="price new-price">￥${guitar.price}</span>
	                            </div>
	                            <dd>
									<p>颜色分类：</p>
										<ul class="color-list" id="d_color_list" style="list-style:none;">
											<li style="border:1px gray solid;width:210px;">
												<img alt="" src="${ctx}/${guitar.imgaddr}" style="width:50px;height:60px;">
												<span>41寸圆角哑光 RD-04</span>
											</li>
										</ul>
									<div class="clear"></div>
								</dd>
	                            <div class="single-product-quantity">
	                                <form class="add-quantity" action="cart?act=seve" method="post">
	                                	<c:if test="${not empty loginUser}">
	                                	<input type="hidden" name="userId" value="${loginUser.id}" />
	                                	</c:if>
	                                	<c:if test="${not empty loginAdmin}">
	                                	<input type="hidden" name="adminUesrId" value="${loginAdmin.id}" />
	                                	</c:if>
	                                	<!-- 获取商品id -->
	                                	<input type="hidden" name="guitarId" value="${guitar.id}" />
	                                     <div class="product-quantity">
	                                         <input value="1" type="number" name="count">
	                                     </div>
	                                    <div class="add-to-link">
	                                        <button type="submit" class="product-btn" data-text="add to cart">添加购物车</button>
	                                    </div>
	                                </form>
	                           </div>
                            <div class="wishlist-compare-btn">
                                <a href="#" class="wishlist-btn">收藏</a>
                            </div>
                            <div class="single-product-sharing">
                                <h3>分享</h3>
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                </ul>
                            </div>
		                </div>
		                <c:if test="${not empty prompt}">
		                	<span>${prompt}</span>
		                </c:if>
		                <!--Product Details Content End-->
		            </div>
		        </div>
		    </div>
		</div>
		</c:if>
		<%-- </c:forEach> --%>
		<!--Single Product Area End-->
				<!--Related Products Area Start-->
		<div class="related-products-area pb-35">
		    <div class="container">
		        <div class="row">
		            <div class="col-12">
		                <!--Section Title 2 Start-->
		                <div class="section-title2">
		                    <h2>猜你喜欢</h2>
		                </div>
		                <!--Section Title 2 End-->
		            </div>
		        </div>
		        <div class="row">
		            <div class="col-12">
                        <div class="row">
                            <div class="product-slider owl-carousel">
								<div style="width: 1300px;height:830px;overflow:hidden">
									<c:forEach items="${guitars}" var="guitars">
										<div class="single-product-area mb-40" style="border:1px solid gray;float:left;margin-right:30px;width:270px;height:390px;">
											<div class="product-img img-full">
												<a href="${ctx}/details?id=${guitars.id}"> 
												<img class="first-img" src="${ctx}/${guitars.imgaddr}" alt="" style="width: 270px;height:270px;">
												</a>
												<div class="product-action">
													<ul>
														<li><a href="cart.html" title="Add To Cart"><span
																class="icon_bag_alt"></span></a></li>
														<li><a href="wishlist.html" title="Add to Wish List"><span
																class=" icon_heart_alt "></span></a></li>
													</ul>
												</div>
											</div>
											<div class="product-content">
												<h4>
													<a href="${ctx}/details?id=${guitars.id}">${guitars.name}</a>
												</h4>
												<div class="product-price">
													<span class="now-price">￥${guitars.price}</span>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
                            </div>
                        </div>
		            </div>
		        </div>
		    </div>
		</div>
		<!--New Product Area End-->
		<!--Product Description Review Area Start-->
		
		<div class="product-description-review-area pb-20">
		    <div class="container">
		        <div class="row">
		            <div class="col-md-12">
		                <div class="product-review-tab">
		                    <!--Review And Description Tab Menu Start-->
		                    <ul class="nav dec-and-review-menu">
                              <li>
                                <a class="active" data-toggle="tab" href="#description">商品描述</a>
                              </li>
                              <li>
                                <a data-toggle="tab" href="#reviews">评论</a>
                              </li>
                            </ul>
		                    <!--Review And Description Tab Menu End-->
		                    <!--Review And Description Tab Content Start-->
		                    <div class="tab-content product-review-content-tab" id="myTabContent-4">
		                    <c:forEach items="${guitarList}" var="guitarList">
                              <div class="tab-pane fade active show" id="description">
                                  <div class="single-product-description">
                                     <img alt="" src="${ctx}/${guitarList.url}" style="width:100%;">
                                  </div>
                              </div>
                              </c:forEach>
                              <div class="tab-pane fade" id="reviews">
                                  <div class="review-page-comment">
                                    <h2 style="margin-top:30px;">品论区</h2>
                                    <ul>
                                        <li>
                                            <div class="product-comment">
                                                <img src="img/icon/author.png" alt="">
                                                <div class="product-comment-content">
                                                    <div class="product-reviews">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <p class="meta">
                                                        <strong>admin</strong> - <span>November 22, 2018</span>
                                                    <div class="description">
                                                        <p>Good Product</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="review-form-wrapper">
                                        <div class="review-form">
                                            <span class="comment-reply-title">Add a review </span>
                                            <form action="#">
                                                <p class="comment-notes">
                                                    <span id="email-notes">Your email address will not be published.</span>
                                                     Required fields are marked
                                                     <span class="required">*</span>
                                                </p>
                                                <div class="comment-form-rating">
                                                    <label>Your rating</label>
                                                    <div class="rating">
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                                <div class="input-element">
                                                    <div class="comment-form-comment">
                                                        <label>Comment</label>
                                                        <textarea name="message" cols="40" rows="8"></textarea>
                                                    </div>
                                                    <div class="review-comment-form-author">
                                                        <label>Name </label>
                                                        <input required="required" type="text">
                                                    </div>
                                                    <div class="review-comment-form-email">
                                                        <label>Email </label>
                                                        <input required="required" type="text">
                                                    </div>
                                                    <div class="comment-submit">
                                                        <button type="submit" class="form-button">Submit</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                  </div>
                              </div>
                            </div>
		                    <!--Review And Description Tab Content End-->
		                </div>
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
