<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>120BPM | Login</title>
<script type="text/javascript" src="${cPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/additional-methods.min.js"></script>
<link rel="stylesheet" href="${cPath}/resources/css/loginForm.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
body{
	font-family: 'Noto Sans KR', sans-serif;
}
.swal2-styled.swal2-confirm{
	border: 0;
    border-radius: .25em;
    background: initial; 
    background-color: #42b4e6;
    color: #fff;
    font-size: 1em;
}  
.swal2-styled.swal2-confirm:focus {
    box-shadow: 0 0 0 3px rgb(115 200 240 / 50%);
}
.swal2-icon.swal2-error [class^=swal2-x-mark-line]{
    display: block;
    position: absolute;
    top: 2.3125em;
    width: 2.9375em;
    height: .3125em;
    border-radius: .125em;
    background-color: #F5DA81;
}
.swal2-icon.swal2-error{
    border-color: #F5DA81;
    color: #F5DA81;
}
#selectUser{
	width: 170px;
	margin-left : 170px;
	text-align: center;
}
</style>
</head>
<body> 
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
	<script type="text/javascript">
       let message = "${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}";
       Swal.fire({
    	   title: '로그인실패',
    	   text: message,
    	   icon: 'error',
    	   confirmButtonText: '확인'
    	 })
     </script>
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
</c:if>
 
 	<security:authorize access="isFullyAuthenticated()">
  		<security:authentication property="principal.adaptee" var="authMember"/>
		<security:authentication property="authorities" var="authMemRoles"/>
		
		<script type="text/javascript">
		location.href = "${cPath}/main";
		</script>
	
	</security:authorize>
 
	<div id="loginDiv"> 
		 
		<form name="loginForm" action="${cPath }/login/loginCheck" method="post">
		<img id="logo" src="${cPath }/resources/imgs/img/logo.png"  alt="120BPM"> 
		<h1><hr class="inline-hr"><span class="logotext">120BPM</span><hr class="inline-hr"></h1><br><br>
			<input type="text" name="memId" placeholder="아이디를 입력하세요." id = "memId" required><br> 
			<input type="password" name="memPass" placeholder="패스워드를 입력하세요." id = "memPass" required >
			 <br>    
			<div  id="remember" >
			<input type="checkbox" name = "Remember-me">Remember Me
			<select id = "selectUser">
				<option>--계정 선택--</option>
				<option value = "joinUser">가입회원</option>
				<option value = "commonUser">기존회원</option>
				<option value = "pm">PM</option>
				<option value = "admin">관리자</option>
			</select>
			</div>
			<br>
			<input type = "submit" id="loginBtn" value="로그인"><br><br>
			 
			<a href="">아이디찾기</a> |
			<a href="">비밀번호찾기</a>
			<hr> 
			계정이 없으신가요? <a href="${cPath }/member/joinStep1" >회원가입</a> 
		</form>
	</div> 

</body>
<script type="text/javascript">
	$('#selectUser').on('change',function(){
		let value = $(this).val();
		let id = null;
		let pass = null;
		if(value == 'commonUser'){
			id = 'ddit2102KSH';
			 pass = 'java';
		}else if(value == 'admin'){
			id = 'admin';
			 pass = 'java';
		}else if(value == 'pm'){
			id = 'ddit2102KHS';
			 pass = 'java';
		}else if(value = 'joinUser'){
			id = 'ddit2102BMS';
			 pass = '!23QweAsd';
		}
		$('#memId').val(id);
		$('#memPass').val(pass);
		
		
		
	})
</script>
</html>













