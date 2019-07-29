<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<div class="header">
 <div class="header_top">
   <div class="top_info clearfix">
   <div class="logo_style l_f"><a href="${ctx}"><img src="${ctx}/static/images/logo.jpg" /></a></div>
   <div class="Search_style l_f">
   <form action="${ctx}/search">
   <div class="select">
    <select name="type" size="1">
      <option value="1" <c:if test="${param.type=='1'}">selected</c:if>>图书</option>
      <option value="2" <c:if test="${param.type=='2'}">selected</c:if>>作者</option>
    </select>
    </div>
    <input name="keyword" type="text" class="add_Search" value="${param.keyword}"/>
    <input type="submit" value="" class="submit_Search"/>
    </form>
   </div>
   <div class="Cart_user r_f">
   <div class="Cart_Quantity "><a href="${ctx}/user/cart?act=list"><span class="number">0</span></a></div>
   <div class="header_operating l_f">
    <span class="header_touxiang"><img src="${ctx}/static/images/touxiang_03.png" /></span>
    <c:if test="${empty loginUser}">
    <a href="${ctx}/login.jsp">登录</a><a href="${ctx}/register.jsp">注册</a>
    </c:if>
     <c:if test="${not empty loginUser}">
    	 <a href="${ctx}/user/" title="点击进入会员中心">${loginUser.username}</a><a href="${ctx}/logout">注销</a>
     </c:if>
   </div>
   </div>
 </div>
 <div class="header_menu">
 <!--菜单导航栏
 <ul class="menu" id="nav">
   <li class="nLi"><a href="#">网站首页</a></li>
   <li class="nLi"><a href="#">设计精粹</a></li>                
   <li class="nLi Down"><a href="#">场景方案</a><em class="icon_jiantou"></em>
    <ul class="sub">
      <li><a href="#">新闻首页</a></li>
      <li><a href="#">新闻人物</a></li>
      <li><a href="#">新闻电视</a></li>
      <li><a href="#">新闻图片</a></li>
      <li><a href="#">新闻视频</a></li>
      <li><a href="# ">新闻专题</a></li>
    </ul>
   </li>             
   <li class="nLi Down"><a href="#">单品大库</a><em class="icon_jiantou"></em></li>      
   <li class="nLi Down"><a href="#">奇货可享</a><em class="icon_jiantou"></em></li>
   <li class="nLi Down"><a href="#">找找感觉</a><em class="icon_jiantou"></em></li>
 </ul>
 <script>jQuery("#nav").slide({ type:"menu", titCell:".nLi", targetCell:".sub",effect:"slideDown",delayTime:300,triggerTime:0,returnDefault:false,trigger:"click"});</script>
 <div class="q_code">
  <a href="" class="q_code_applnk" rel="nofollow"></a>
    <div class="q_code_layer" style="display: none;">
    <a href="" class="qcode_lnk" rel="nofollow">
      <span class="qcode_title">只分享装修干货</span>
    </a>  
    </div>
  </div>
 </div>-->
 </div>
</div>