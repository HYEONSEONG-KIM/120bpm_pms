<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




	<div id = "topPar">
		<div class = "topChild">
			<h3>인적사항</h3>
			<hr>
			<table id = "basicInfo">
				<tr>
					<th>이름</th>
					<td>${memVO.memLnm}${memVO.memFnm}</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${memVO.memId}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${memVO.memHp}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${memVO.memEmail}</td>
				</tr>
				
				<tr>
				<th>주소</th>
					<td>${memVO.memAddr1} ${memVO.memAddr2} (${memVO.memZip})</td>
				</tr>
				
			</table>
			<hr>
		</div>
		<div></div>
		<div class = "topChild">
			<img id = "memImg" src="${cPath}/resources/imgs/member/${memVO.proflImgNm}">
		</div>
	</div>
	
	<div id = "middlePar">
		<h4>서비스 정보</h4>
		<table class="table" id = "detailInfo">
			<tr>
				<th>회원가입승인여부</th>
				<td>${memVO.memJoinConfmAt eq '0'?'미승인':'승인완료'}</td>
				<th>승인일자</th>
				<td>${memVO.memJoinConfmDe}</td>
			</tr>

			<tr>
				<th>회원가입일자</th>
				<td>${memVO.memJoinDe}</td>
				<th>개인정보동의일자</th>
				<td>${memVO.indvdlinfoAgreDe}</td>
			</tr>
			<tr>
				<th>마지막 로그인일자</th>
				<td>${memVO.memLastLoginDe}</td>
				<th>소속</th>
				<td>${memVO.psitnClCode eq 'M00201'?'정직원' : '프리랜서'}</td>
			</tr>
		</table>
	</div>

	<div id = "bottomPar">
		<h4>경력사항</h4>
		<table class = 'table' id = "careerInfo">
		<tr>
			<th>번호</th>
			<th>참여사업명</th>
			<th>근무처명</th>
			<th>직위</th>
			<th>시작일자</th>
			<th>종료일자</th>
			<th>발주처명</th>
		</tr>
		<c:set var="cnt" value="0"/>
		<c:forEach items="${memVO.careerList}" var="career" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${career.partcptnBiz}</td>
				<td>${career.wrkplcNm }</td>
				<td>${career.ofcpsNm}</td>
				<td>${career.beginde}</td>
				<td>${career.endde }</td>
				<td>${career.orntNm }</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
	<div id = "projectPar">
		<h4>현재 프로젝트 현황</h4>
		<table class = 'table' id = "projectInfo">
			<tr>
				<th>번호</th>
				<th>프로젝트 명</th>
				<th>역할</th>
				<th>시작일자</th>
				<th>종료일자</th>
				<th>발주처명</th>
				<th>사업규모</th>
			</tr>
			
			<c:forEach items="${projectList}" var="project" varStatus="status">
				<tr>
					<td>${status.index + 1 }</td>
					<td style="text-align: left;">${project.prjctNm }</td>
					<td>${project.authorNm }</td>
					<td>${project.prjctBeginde }</td>
					<td>${project.prjctEndde }</td>
					<td>${project.prjctOrnt }</td>
					<td>${project.bsnssclae }</td>
				</tr>
			</c:forEach>
		</table>
	
	</div>
