<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>120BPM | Welcome</title>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="${cPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${cPath }/resources/assets/css/bootstrap-5.0.0-alpha-2.min.css" />
<link rel="stylesheet"
	href="${cPath }/resources/assets/css/LineIcons.2.0.css" />
<link rel="stylesheet" href="${cPath }/resources/assets/css/animate.css" />
<link rel="stylesheet"
	href="${cPath }/resources/assets/css/lindy-uikit.css" />
<link rel="stylesheet"
	href="${cPath }/resources/assets/css/base-style.css" />
<style>
@import url('https://fonts.googleapis.com/css2?family=Geostar&family=Geostar+Fill&display=swap');

.hero-section-wrapper {
/* 	background-image: url('${cPath}/resources/imgs/img/4853433.jpg'); */
/* 	background-size: 100%; */
	background:  #42b4e6;
}

.headerTitle {
	font-family: 'Geostar Fill', cursive;
	display: inline-block;
}
#logo{
	width : 50px;
}
#centerImg{
	background: rgba(255, 255, 255, 0.5);
}
</style>
</head>  
<c:if test="${not empty joinSuccess}">
<script>    
$(function(){
       	 Swal.fire({
        	  title: '회원가입완료!', 
        	  text: '관리자 승인후 사이트 이용이 가능합니다',
        	  confirmButtonText: '확인!'
        	})
})
</script>
</c:if>

<body>
	<security:authorize access="isFullyAuthenticated()">
  		<security:authentication property="principal.adaptee" var="authMember"/>
		<security:authentication property="authorities" var="authMemRoles"/>
		
		<script type="text/javascript">
			location.href = "${cPath}/main";
		</script>
	
	</security:authorize>

	
	<section id="home" class="hero-section-wrapper hero-section-wrapper-1">

		<div class="hero-section hero-style-1">
			<header class="header header-4">
				<div class="navbar-area">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-lg-12">
								<nav class="navbar navbar-expand-lg">
									<h4 class="headerTitle pt-3 mb-2 "> 
										<img id="logo" src="${cPath }/resources/imgs/img/logo.png" class="d-inline-block align-top" alt=""> ${S0010110}
									</h4> 
							</div>
						</div>
					</div> 
				</div>
			</header>
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="hero-content-wrapper">
							<h2>
								당신의 안정적이고 <br>규칙적인 프로젝트를 위하여
							</h2>
							<p>120BPM에서 최적화된 프로젝트 LIFECYCLE 케어를 경험하세요</p>
							<a href="${cPath }/login/loginCheck" class="button button-lg radius-50">로그인</a> 
							<a href="${cPath }/member/joinStep1" class="button button-lg radius-50">회원가입</a>
						</div>
					</div>
					<div class="col-lg-5 align-self-end"> 
						<div class="hero-image">
							<img id="centerImg" src="${cPath }/resources/imgs/img/com.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>