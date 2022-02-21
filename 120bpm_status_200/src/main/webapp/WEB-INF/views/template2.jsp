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


<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
	</script>
</c:if>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<tiles:insertAttribute name="leftMenu2" />
			<tiles:insertAttribute name="headerMenu" />
			<div class="right_col" role="main" style="min-height: 4546px;"> 
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								
							</h3>
						</div>
						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-secondary" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
 
					<div class>
						<!-- 센터내용 -->
						<tiles:insertAttribute name="content" />
					</div>
				</div>
			</div>
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</body>
</html>
