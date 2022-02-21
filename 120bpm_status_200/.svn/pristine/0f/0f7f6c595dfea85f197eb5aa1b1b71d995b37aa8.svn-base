<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />
<title> ${S0010110}</title>  

<tiles:insertAttribute name="preScript" />
<style> 
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap'); 
body{ 
		 font-family:'Noto Sans KR', sans-serif !important;
} 
.swal2-styled.swal2-confirm {
	border: 0;
	border-radius: .25em;
	background: initial;
	background-color: #42b4e6;
	color: #fff;
	font-size: 1em;
}

.swal2-styled.swal2-confirm:focus {
	box-shadow: 0 0 0 3px rgb(115 200 240/ 50%);
}

.swal2-icon.swal2-error [class^=swal2-x-mark-line] {
	display: block;
	position: absolute;
	top: 2.3125em;
	width: 2.9375em;
	height: .3125em;
	border-radius: .125em;
	background-color: #F5DA81;
}

.swal2-icon.swal2-error {
	border-color: #F5DA81;
	color: #F5DA81;
}
</style>
<c:if test="${not empty setupmessage}">
	<script type="text/javascript">
		$(function() {
			if ("${setupmessage}" == "OK") {
				Swal.fire({
					title : "SUCCESS",
					text : "설정이 저장되었습니다.",
					icon : 'success',
					confirmButtonText : '확인'
				})
			} else {
				Swal.fire({
					title : "SERVER ERROR",
					text : "다시 시도해주세요.",
					icon : 'error',
					confirmButtonText : '확인'
				})
			}
		});
	</script>
</c:if>
</head>  
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<tiles:insertAttribute name="leftMenu" />
			<tiles:insertAttribute name="headerMenu" />
			<div class="right_col" role="main" style="min-height: 4546px;">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3></h3>
						</div>
						<div class="title_right">
						</div>
					</div>
					<div class="clearfix"></div>  
					<div class="row"> 
						<div class="col-md-11 col-sm-6  ml-5 " >
							<!-- 센터내용 -->
							<tiles:insertAttribute name="content" />
						</div>
					</div> 
				</div>
			</div>
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</body>
</html>
