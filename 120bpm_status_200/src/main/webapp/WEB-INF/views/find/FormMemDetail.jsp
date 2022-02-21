<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#topPar{
		display: grid;
		grid-template-columns : 0.5fr 0.1fr 1fr;
		margin: 2%;
		text-align: center;
		width: 95%;
		background: #ffffff;
	}
	#memImg{
		width: 150px;
		height: 150px;
		margin-top: 20px;
	}
	#basicInfo th{
		width: 100px;
		font-size: 15px;
		text-align: left;
		height: 30px;
	}

	#basicInfo td{
		text-align: left;
		font-size: 15px;
	}
	#selectMem{
		float: right;
		width: 60px;
		margin: 3%;
	}
	
	#projectInfo{
		margin-top: 6%; 
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<div id = "topPar">
		<div class = "topChild">
			<img id = "memImg" src="${cPath}/resources/imgs/member/${memVO.proflImgNm}">
		</div>
		
		<div></div>
		
		<div class = "topChild">
			
			<hr>
			<table id = "basicInfo">
				<tr>
					<th>이름</th>
					<td>${memVO.memName}</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${memVO.memId}</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>${memVO.memEmail}</td>
				</tr>
				
				<tr>
					<th>소속</th>
					<td>${memVO.psitnClCode eq 'M00201'?'정직원' : '프리랜서'}</td>
				</tr>
			</table>
			<hr>
		</div>
	</div>
	
	<div id = "bottomPar">
		<h4>경력사항</h4>
		<table class = 'table' id = "careerInfo">
		<tr>
			<th>참여사업명</th>
			<th>근무처명</th>
			<th>직위</th>
			<th>발주처명</th>
		</tr>
		<c:set var="cnt" value="0"/>
			<c:set value="${memVO.careerList}" var="careerList"/>
		<c:choose>
			<c:when test="${(fn:length(careerList) eq 1) and (careerList[0].careerMatterNo eq null)}">
				<tr>
					<td colspan="4">
						경력사항이 없습니다
					</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${careerList}" var="career" varStatus="status">
				
					<tr>
						<td>${career.partcptnBiz}</td>
						<td>${career.wrkplcNm }</td>
						<td>${career.ofcpsNm}</td>
						<td>${career.orntNm }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		
		</c:choose>
		</table>
	</div>
	<hr>
	<div id = "projectInfo">
		<h4>프로젝트 정보</h4>
		<table class = 'table'>
			<tr>
				<th>프로젝트명</th>
				<th>시작일자</th>
				<th>종료일자</th>
				<th>역할</th>
			</tr>
		<c:choose>
			<c:when test="${empty projectList }">
				<tr>
					<td colspan="4" >
						프로젝트 이력이 없습니다
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${projectList}" var="prt">
					<c:choose>
						<c:when test="${fn:length(prt.prjctNm) ge 10}">
							<tr>
								<td title = "${prt.prjctNm }">${fn:substring(prt.prjctNm,0,10) += "..."}</td>
								<td>${prt.prjctBeginde }</td>
								<td>${prt.prjctEndde }</td>
								<td>${prt.authorNm }</td>
							</tr>
						</c:when>
						
						<c:otherwise>
							<tr>
								<td>${prt.prjctNm}</td>
								<td>${prt.prjctBeginde }</td>
								<td>${prt.prjctEndde }</td>
								<td>${prt.authorNm }</td>
							</tr>
						</c:otherwise>
					</c:choose>
					
					
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
	</div>
</body>
</html>
















