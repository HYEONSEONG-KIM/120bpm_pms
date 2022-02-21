<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<style> 
@import
	url('https://fonts.googleapis.com/css2?family=Geostar&family=Geostar+Fill&display=swap')
	;

#logo {
	width: 40px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
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
			<security:authentication property="principal.adaptee"
				var="authMember" />
			<security:authentication property="authorities" var="authMemRoles" />

			<div class="profile clearfix">
				<div class="profile_pic">
					<img src="${cPath }/resources/imgs/member/${authMember.proflImgNm}" alt="프로필" class="img-circle profile_img">
				</div>
				<div class="profile_info">
					<span>Welcome</span>
					<h6>${authMember.memLnm}${authMember.memFnm}</h6>
				</div>
			</div>
			<br>
 
				<c:if test="${authMember.mngrAt eq '0'}">
					<!-- 일반사용자 sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section active">
							<ul class="nav side-menu" style="">
								<li data-menu="mypage"><a href="${cPath}/mypage"><i class="fa fa-home"></i>
										내 일감 </a></li>    
								<li ><a ><i class="fa fa-user"></i> 개인정보관리 <span
										 		class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li data-menu="myAccount"><a href="${cPath}/mypage/myAccount" >
										개인정보수정</a></li>  
										<li data-menu="myCareer"><a href="${cPath}/mypage/myCareer" >
										경력사항관리 </a></li>   
									</ul>
								</li>
								<li data-menu="notification"><a href="${cPath}/mypage/notification"><i
										class="fa fa-desktop"></i>푸시알림 </a></li>
								<li data-menu="profileSetting"><a href="${cPath}/mypage/profileSetting"><i class="fa fa-users"></i>
										프로필 설정 </a></li>
				 			</ul> 
						</div> 
					</div> 
					<!-- /sidebar menu --> 
				</c:if> 
					<div class="sidebar-footer  d-flex justify-content-end"> 
						<button type="button" class="btn goHome"><i class="fa fa-home"></i>홈으로</button>
						
					</div> 
		</security:authorize>


		<security:authorize access="!isFullyAuthenticated()">
			<h4>로그인 후 이용 가능</h4>
		</security:authorize>

		<!-- /sidebar menu -->
	</div>
</div>


<script> 
	$(function() {
		
		//메뉴 이름 세팅
		$("#setting").addClass("active");
		$(".datamenu").css("display", "block"); 
		let lis = $("li");
		$.each(lis, function(i, li) {
			if ($(li).data("menu") == "${menu}") {
				$(li).addClass("current-page");
			}
		});
		
		
		$(".goHome").on("click", function(){
			location.href="${cPath}/main";
		});
	}); 	
</script>