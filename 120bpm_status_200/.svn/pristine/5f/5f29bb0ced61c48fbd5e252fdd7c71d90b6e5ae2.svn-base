<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.parent {
	width: 95%;
	background: #fcfcfc;
	display: grid;
	grid-template-columns : 1fr 1fr 1fr;
	margin: 2%;
	text-align: center;
}

.roleInfo {
	width: 80%%;
	margin: 20px;
	float: left;
	box-shadow: 1px 2px 3px 1px #d5d7db;
	padding: 0 10px;
	border-radius: 20px;
	height: 200px;
}
.roleInfo:hover{
	cursor: pointer;
}

.smallD h3, .smallD h6{
	text-align: center;
}
#makeRole{
	margin-right: 3%;
	margin-bottom: 20px;
}
.roleInfo:hover, #makeRole:hover{
		cursor: pointer;
		box-shadow: 3px 2px 2px grey;
		
	}
.deletePrtMem{
	border-radius: 30px;
	float: right;
	margin-right: 10px;
}
#makeRole img{
		width : 55px;
	 	border-radius: 50%;
		margin-top: 4.5rem;
		box-shadow: 3px 2px 2px grey;
}
#makeRole{
		margin: 20px;
		float: left;
		box-shadow: 1px 2px 3px 1px #d5d7db;
		padding: 0 10px;
		border-radius: 20px;
		height: 200px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="parent">	
		<c:if test="${not empty roleList }">
					<c:forEach items="${roleList}" var="role">
						<div class="roleInfo" data-auth = "${role.author}">
							<c:if test="${not empty role.authorNm }">
								<h3>  ${role.authorNm}</h3>
							</c:if>
							<hr>
									
							<c:if test="${not empty role.authorDc }">
									<h6>${role.authorDc}</h6>
							</c:if>
							<c:if test="${not empty role.authorCreatde}">
							<span>등록일 &nbsp:&nbsp ${role.authorCreatde} &nbsp&nbsp|&nbsp&nbsp </span>
		
							</c:if>
									
							<c:if test="${not empty role.projectCnt}">
							<span>프로젝트 수 &nbsp:&nbsp ${role.projectCnt}</span>
							<br>
							</c:if>
							<hr>
						</div>
					</c:forEach>
			</c:if>
			<div  id = "makeRole" data-command = "create">
					 <img alt="추가" src="${cPath }/resources/imgs/img/plusbutton.png">
			</div>
		</div>
		
</body>
<script type="text/javascript">
	$('.roleInfo').on('click',function(){
		let roleId = $(this).data('auth');
		location.href = "${cPath}/admin/role/detail/"+roleId;
	})

	$('#makeRole').on('click',function(){
		location.href = "${cPath}/admin/role/makeRole";
		
	})
</script>
</html>