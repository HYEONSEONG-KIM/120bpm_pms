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
<title>${S0010110}</title> 

<tiles:insertAttribute name="preScript" />
<link rel="icon" href="images/favicon.ico" type="image/ico" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap'); 
body{   
		 font-family:'Noto Sans KR', sans-serif !important;
} 
</style>
<c:if test="${not empty delBkmkMessage}">
	<script type="text/javascript">
		$(function() {
			if ("${delBkmkMessage}" == "OK") {
				Swal.fire({
					title : "SUCCESS",
					text : "즐겨찾기 일감 해제되었습니다.",
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
			<tiles:insertAttribute name="MyLeftMenu" />
			<tiles:insertAttribute name="headerMenu" />
			<div class="right_col" role="main" style="min-height: 4546px;">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3></h3>
						</div> 
						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group"></div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-11 col-sm-6  ml-5 ">
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
