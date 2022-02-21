<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Geostar&family=Geostar+Fill&display=swap')
	;
#logo{
	width : 40px;
	 border-radius: 70%;
    overflow: hidden;
} 
</style>
<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="index.html" class="site_title"><img id="logo" src="${cPath }/resources/imgs/img/logo.jpg">
				<span>120BPM</span></a>
		</div>   
 
		<div class="clearfix"></div>

		<!-- menu profile quick info -->
		<div class="profile clearfix">
			<div class="profile_pic">
				<img src="${cPath }/resources/imgs/img/profile.jpg" alt="..." class="img-circle profile_img">
			</div>
			<div class="profile_info">
				<span>Welcome,</span>
				<h6>John Doe</h6>
			</div>  
		</div>
		<!-- /menu profile quick info -->

		<br>

		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section active">
				<ul class="nav side-menu" style="">
					<li data-menu="main"><a href="${cPath }/admin/main"><i class="fa fa-home"></i> 홈 </a>
					</li>  
					<li><a href="main.jsp"><i class="fa fa-desktop"></i> 프로젝트 관리 </a>
					</li>
					<li><a><i class="fa fa-user"></i> 사용자 관리 <span
							class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="tables.html">승인완료</a></li>
							<li><a href="tables_dynamic.html">승인대기</a></li>
						</ul></li>
					<li><a><i class="fa fa-edit"></i> 역할 및 권한
							<span class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu">
							<li><a href="chartjs.html">역할</a></li>
							<li><a href="chartjs2.html">권한보고서</a></li>
						</ul></li>
					<li><a><i class="fa fa-gears"></i> 기본 설정 <span
							class="fa fa-chevron-down"></span></a>
						<ul class="nav child_menu"> 
							<li data-menu="defaultSetting"><a href="${cPath }/admin/settings" >일반</a></li>
							<li><a href="media_gallery.html">표시방식</a></li>
							<li><a href="typography.html">프로젝트</a></li>
							<li><a href="icons.html">파일</a></li>
							<li><a href="glyphicons.html">메일알림</a></li>
						</ul></li>
				</ul>
			</div>

 
		</div>
		<!-- /sidebar menu -->

	</div>
</div>
 
 <script>
  	$(function(){ 
  		let lis = $("li");
  		$.each(lis, function(i,li){ 
  			if($(li).data("menu")=="${menu}"){
  				$(li).addClass("current-page");
  			}	 
  		})   
  		 	
  	})
  </script>