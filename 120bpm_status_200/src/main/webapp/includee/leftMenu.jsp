<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Geostar&family=Geostar+Fill&display=swap')
	;
#logo{
	width : 40px;
	 border-radius: 70%;
    overflow: hidden;
} 

.profile {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	background: #fff;
}
.nav_title{ 
	box-shadow: -2px 2px 2px 2px #cfedfc;
}
</style>
<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="${cPath }/main" class="site_title"><img id="logo"
				src="${cPath }/resources/imgs/img/logo.jpg"> <span>120BPM</span></a>
		</div>

 
		<div class="clearfix"></div>
 
		<!-- 사용자 정보 -->
		<security:authorize access="isFullyAuthenticated()">
  			<security:authentication property="principal.adaptee" var="authMember"/>
			<security:authentication property="authorities" var="authMemRoles"/>
			
				<div class="profile clearfix"> 
					<div class="profile_pic">
						<img src="${cPath }/resources/imgs/member/${authMember.proflImgNm}" alt="프로필" class="img-circle profile_img">
					</div> 
					<div class="profile_info">
						<span>Welcome</span> 
						<h6>${authMember.memName}</h6>
					</div>  
				</div>
					<br> 
					
				<c:choose>
					<c:when test="${authMember.mngrAt eq '0'}">
							<!-- 일반사용자 sidebar menu -->
							<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
								<div class="menu_section active">
									<ul class="nav side-menu" style="">
										<li><a href="${cPath}/main"><i class="fa fa-home"></i> 홈 </a>
										</li>
										<li data-menu="projects"><a href="${cPath}/main/projects"><i class="fa fa-desktop"></i> 프로젝트 </a>
										</li> 
<%-- 										<li ><a href="${cPath}/"><i class="fa fa-calendar"></i> 마이 캘린더 </a> --%>
										</li>
										<li><a href="${cPath}/notice/noticeList"><i class="fa fa-bullhorn"></i> 공지사항 </a>
										</li>
										<li><a href="${cPath}/mypage"><i class="fa fa-child"></i> 마이페이지 </a>
										</li>
									</ul> 
								</div>
							</div>
							<!-- /sidebar menu -->
					</c:when>
					
					<c:otherwise>
						<!-- 관리자 sidebar menu -->
							<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
								<div class="menu_section active">
									<ul class="nav side-menu" style="">
										<li data-menu="main"><a href="${cPath }/main"><i class="fa fa-home"></i> 홈 </a>
										</li>  
										<li data-menu="projectManage"><a  href="${cPath }/admin/project/list"><i class="fa fa-desktop"></i> 프로젝트 관리 </a>
										</li>
										<li ><a ><i class="fa fa-user"></i> 사용자 관리 <span
												class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li data-menu="memList"><a  href="${cPath}/admin/mem/list">전체 사용자 조회</a></li>
												<li data-menu="notAccept"><a  href="${cPath }/admin/mem/notaccept">승인대기</a></li>
											</ul></li>
										<li><a><i class="fa fa-edit"></i> 역할&권한
												<span class="fa fa-chevron-down"></span></a>
											<ul class="nav child_menu">
												<li data-menu="role"><a  href="${cPath}/admin/role/list">역할</a></li>
												<li data-menu="report"><a href="${cPath}/admin/role/report">권한보고서</a></li>
											</ul></li>
										 
										<li data-menu="notice"><a  href="${cPath }/notice/noticeList"><i class="fa fa-bullhorn"></i>공지사항</a>
										</li>	
											
											
										<li id="setting"><a> <i class="fa fa-gears"></i> 기본 설정 <span
												class="fa fa-chevron-down"></span></a>  
											<ul class="nav child_menu datamenu"> 
												<li data-menu="defaultSetting" class="setup"><a href="${cPath }/admin/settings?setup=defaultSetting" >일반</a></li>
												<li data-menu="display" class="setup"><a  href="${cPath }/admin/settings?setup=display">표시방식</a></li>
<%-- 												<li data-menu="attatchments" class="setup"><a  href="${cPath }/admin/settings?setup=attatchments">파일</a></li> --%>
											</ul></li>
									</ul>
								</div>
							</div> 
										
					</c:otherwise>
				</c:choose>
		</security:authorize>
		
		
		
		
		<security:authorize access="!isFullyAuthenticated()">
			<h4>로그인 후 이용 가능</h4>
		</security:authorize>

	





		<!-- /sidebar menu -->
	</div>
</div>


 <script>
  	$(function(){  
//   		$("#setting").addClass("active");  
//   		$(".datamenu").css("display", "block");
  		let lis = $("li"); 
  		$.each(lis, function(i,li){ 
  			if($(li).data("menu")=="${menu}"){
  				$(li).addClass("current-page");
  			}	 
  			if($(".setup").hasClass("current-page")){
  				$("#setting").addClass("active");
  				$(".datamenu").css("display", "block");
  			}
  				
  		})    
  		 	
  	})
  </script>