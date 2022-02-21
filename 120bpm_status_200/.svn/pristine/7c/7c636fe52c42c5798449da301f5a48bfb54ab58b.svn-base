<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 	/webStudy7/src/main/webappfont-awesome/css/font-awesome.min.css -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/common.js"></script>
<link rel="stylesheet" href="${cPath }/resources/css/commons.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript"	src="${cPath }/resources/js/jquery.form.min.js"></script>
<title></title>
<head> 
<style>


.refuse{
	box-shadow:inset 0px 1px 0px 0px #f5978e;
	background-color:#f24537;
	border-radius:6px;
	border:1px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding::6px 17px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
}

.refuse:hover {
	background-color:#c62d1f;
	color:#ffffff;
}
.refuse:active {
	position:relative;
	top:1px;
}

.approve:hover  #allAccept:hover{
	/* background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%); */
	background-color:#1e62d0;
	color:#ffffff;
}
.approve:active   #allAccept:active{
	position:relative;
	top:1px;
	
}


.approve , #allAccept{
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background-color:#3d94f6;
	border-radius:6px;
	border:1px solid #337fed;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding::6px 17px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;
}

.bold {
	font-weight: bolder;
}

.status, .code {
	color: #26838D;
}

.btnArea, .add {
	text-align: right;
}

#details{
	background:  #FBFBFB;
}

#replyTable{
border: 1px solid  #FBFBFB;
}


.add{
overflow:auto  !important;
height: 100px !important;
}


.test td , .test tr , .test th{
   border: 1px solid  #E6E6E6;
}
 
th{
border-right: black!important;
}

body{
overflow: auto ;
}


.badge{
color: black;

}

.insertBookMark{
border-color:#aba9a9;
}

.right{
text-align: right;
}

 
 .modal {
        text-align: center;
         border-radius: 10px;
         font-size: 1.3em;
         
}
  .modal__background{
  position: fixed;
  top:0; left: 0; bottom: 0; right: 0;
  background: rgba(230, 230, 230, 0.8);
}  

.scroll{
overflow: auto; overflow-x:hidden;
height: 100px !important;
}

.contents{
overflow:auto;
height: 100px;
}
 .textScroll{
   overflow: auto;
 }
 
.name{
width : 10px;
height : 10px;
word-break:break-all;
}

.head { 
  width: 100%;
  height: 32px;
  padding: 12px 30px;
  overflow: hidden;
  background: #e2525c;
}


.workParent{
padding : 1px;

}

#searchItem{
display: none;
}

.table{
  border:none;
  width : 100%!important;
 
}
 
#fixedChart{
width: 160px;
}

.observer{
text-align : left;
height: 250px !important;
/*  overflow-x:hidden; */
}

#replyTable thead{
/* background-color: thea */
}
.minal{
 width: 130px;
}
 
.sj{
  width: 1000px!important;
  height: 58px!important;
}

#pName{
  word-break:break-all;
}

.projectNm{
 width: 400px!important;
}


.idLength{
 
  display:inline-block;
  width: 40px!important;
 /*  height: 40px!important; */
 /*   */
  overflow : hidden;
  white-space: nowrap;
	text-overflow : ellipsis; 
}
#workSj{
word-break:break-all;
text-align: left;
 
}
.repArea{
width: 100%;
}
.section {
background-color: #F0F9FC;
}
.tooltip {
  display: inline-block;
  color: deeppink;
  font-weight: bold;
}

.tooltip-text {
  display: none;
  position: absolute;
  max-width: 200px;
  border: 1px solid;
  border-radius: 5px;
  padding: 5px;
  font-size: 0.8em;
  color: white;
  background: deeppink;
}

.tooltip:hover .tooltip-text {
  display: block;
}

.wider{
width: 140px;
}

.comment-box{
overflow: auto;
height: 100px;
width: 450px!important;
}

#replyTable{
height: 500px!important;
max-height:500px!important;
min-height:500px!important;
}
 #listBody{
height: 500px!important;
max-height:  500px!important;
min-height:  500px!important;
} 

.repArea{
height: 800px;
max-height:  800px;
min-height:  800px;
}

#repModifyForm{
display: none;
}

.text-center{
text-align: center;

}


.witdthMin{
 width: 40px!important;

}

.section mina{
font-size:200px;
}

.dates{
width: 160px !important;

}

.fixedReply{
width: 200px;

}
.fixed{
width: 90px!important;

}
fixedBtn{
width: 250px;

}
.right{
text-align: right;
}

.feedback{
width: 700px!important;
} 

.observer .card{
max-height: 120px !important;
min-height: 120px !important;
margin: 2%;
}
.observer .card-body{
text-align: center;
}

.show{
text-align: right;

} 

.notexist{
height: 148px;

}

</style>
 </head>
<body> 
<security:authentication property="principal.adaptee" var="authMember" />
<security:authentication property="authorities" var="authMemRoles" />

<c:if test="${not empty message }">
	<script type="text/javascript">
		Swal.fire({
			 title: "잘못된 요청입니다!",
			  text:  "${message }",
			  icon: "error",
			  button: "OK",
			}) 
	</script>
</c:if>


<c:if test="${not empty success }">
	<script type="text/javascript">
		Swal.fire({
			 title: "${act}",
			  text:  "${success}",
			  icon: "success",
			  button: "OK",
		}) 
	</script>
</c:if>
 

<c:if test="${not empty downLoadFail }">
	<script type="text/javascript">
		Swal.fire({
			 title: "파일 다운로드 실패",
			  text:  "${downLoadFail}",
			  icon: "error",
			  button: "OK",
		}) 
 <% session.removeAttribute("downLoadFail"); %>
	</script>
</c:if>

	<div class="container">
		<div class="row">
			 
			 
			 
				<table class="table test" id="details" >
				<tbody>
				 <tr>
			 			<th colspan="1"  class="code section" >프로젝트명</th>
						<th colspan="3" class="projectNm  tol"><span id="pName">${work.prjctNm }</span></th>
						<td colspan="5"  class="btnArea">
						<c:choose>
					<c:when test="${empty work.workBkAt }">
						<button class="btn btn-light insertBookMark"><i class="fa fa-star-o" aria-hidden="true"></i></button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-light deleteBookMark " data-workBkmkCode="${work.workBkAt}" >⭐ </button>
					</c:otherwise>
				</c:choose>

<%-- 
						 	
								 	
						 
					</c:when> --%>
 		<c:if test="${work.workDeleteAt eq '0'}">
				<c:choose>
					<c:when test="${authMember.memId eq work.memId||authVO.author eq 'ROLE_PM' }">
						<c:if test="${ work.workReqSttusCode ne 'W00301' && work.workReqSttusCode ne 'W00302'  }">
							<button id="workUpdate" class="btn updateBtn">수정</button>
							<button id="del" class="btn deleteBtn">삭제</button>
						</c:if>
					</c:when>
					<c:otherwise>
					</c:otherwise>
			 </c:choose>
			 </c:if>
			 
			  <c:if test="${work.workDeleteAt eq '0'}">
			 <c:if test="${work.workOthbcAt eq '1'}"> 
			 		<c:if test="${authVO.author ne 'ROLE_PM' }">
					 <c:if test="${authMember.memId eq work.memId }">
					 <c:if test="${ work.workReqSttusCode ne 'W00301' && work.workReqSttusCode ne 'W00302'  }">
									<button class="btn  btbtn acceptReq">승인 요청</button>
						  			</c:if>
						 	</c:if>
			 		 </c:if>
			 		<c:if test="${authVO.author eq 'ROLE_PM'  }">
			 				<c:if test="${work.workReqSttusCode eq 'W00301' || authMember.memId eq work.memId   }">
			 				<!--  -->
					 				<%-- <c:if test="${ authMember.memId  eq work.memId }"> --%>
								 			<button class="btn approve">승인</button>
								 			<button class="btn refuse ">반려</button>
								 	</c:if>
								</c:if>  	
					 		<%-- 		<c:if test="${  }">
								 			<button class="btn approve">승인</button>
								 			<button class="btn refuse ">반려</button>
								 	</c:if> --%>
						 <%-- 	</c:if> --%>
						 	 </c:if>
			</c:if> 
						<button class="btn gobackBtn" onclick="goback()">이전으로</button>
						</td>
			 	</tr>
				
		 
				
				<tr>
						<th colspan="1"  class="code section" >제목</th>
						<th colspan="9" class="sj"><span id="workSj" class="tol">${work.workSj }</span></th>
				</tr>
			

<%-- 	 
					  --%>
					<tr>
						<th  class="section minal ">카테고리</th>
						<td  colspan="" class="category wider">&nbsp;${work.ctgryNm}&nbsp;</td>
						
						<th  class="section minal">상태</th>
						<td  class="wider">${work.workStatus }</td>
						 
						<th  class="section minal">시작일자</th>
						<td class="dates" >${work.workBgnde!=null ?work.workBgnde :'미정' }</td>
						<th  class="section minal">종료일자</th>
						<td class="dates">${work.workBgnde!=null? work.workEndde :'미정' }</td>
						
						
					</tr>
					
					<tr>
						<th colspan="" class="section minal">담당자</th>
						<td >${work.memName}</td>
						
						<th  class="section minal">우선순위</th>
						<td colspan="">${work.priortNm }</td>
								
						<th  class="section minal">요청상태</th>
						 <c:choose>
						 	<c:when test="${work.workOthbcAt eq '0'}">
						 	 <td  colspan="2">승인 대상 아님
							 </td>
						 	</c:when>
							 
							<c:otherwise>
							 <td  colspan="2">${work.workReqNm }
							 </td>
							</c:otherwise>
						 </c:choose>
						 <td  colspan="2"> 
						 		<c:if test="${not empty work.workReturnWhy}">
						 		&nbsp;&nbsp;
						 		<button class="btn whyNot btn-info btn-sm"  data-workCode="${work.workCode }">
								사유
								</button>
								
						 		</c:if>
						 		
						     </td>	
						<%--  <th class="section minal" >반려사유</th>
						 <c:choose>
						<c:when  >
						 <td>
						
						</span>
						</td>
						</c:when>
						<c:otherwise>
						 <td>등록된 반려사유 없음</td>
						</c:otherwise>
						</c:choose> --%>
					</tr>
 
					

					 
					<tr>
					 	<th class="section upline" >내용</th>
						<td colspan="9">
						<div  class="contents"> 
						${work.workCn }
						</div>
						</td>
					</tr>
					
					 <tr>
					 <th  class="section" >진척도
					 </th>
					 
					 <td  colspan="3" >
					<!--  <div id="fixedChart"> -->
					 <div  id="chart"></div>
					 <!-- </div> -->
					 </td>
					 <td colspan="1">
					  <c:if test="${not empty  work.workDeleteAt }">
					 
						 	<c:if test="${authMember.memId eq work.memId }">
								 	<c:if test="${ work.workReqSttusCode ne 'W00301' && work.workReqSttusCode ne 'W00302'  }">
									<button type="button" id="degreePoint" class="btn updateBtn"  data-bs-toggle="modal" data-bs-target="#mydegreeUpdate">진척도 <br>수정</button>
								<!-- 	<button class="btn  btbtn acceptReq">완료 승인 요청</button> -->
						  			</c:if>
						 	</c:if>
						</c:if> 
				 
					 </td>
					 
					 <th class="line section minal" colspan="1">첨부파일</th>
					 <td colspan="4">
					 <div class="scroll">
							  <c:forEach items="${work.workFileList }" var="workFile">
							<c:if test="${not empty workFile.workFileCode }">
								<c:url value="/project/${pCode}/file/down/${workFile.workFileCode}" var="downloadURL">
										 </c:url>
									<p class='file'> 
										${workFile.workFileNm }<button type="button" data-downCode="${downloadURL }" class="btn btn-light fileDown"><i class="fa fa-download" aria-hidden="true"></i></button>
									</p>
							</c:if>
							</c:forEach>
									  
							 </div>
						 </td>
					 </tr>
 
					<tr>
						
					</tr>
					<tr>
						<td colspan="10">
						
						 </tr>
			 
					<tr>
						<th class="upline section"  colspan="1">일감 관계 
						<p>
						<c:url value="/project/${work.prjctNo}/work/create" var="insertURL">
							<c:param name="upperWorkCode" value="${work.workCode }"></c:param>
							<c:param name="upperWorkSj" value="${work.workSj }"></c:param>
						</c:url>
						<button class="btn badge badge-light controlBtn" id="lowerAdd" 
						data-gopage="${insertURL }" >하위일감 추가</button> 
						</p>
						</th>
						 <td colspan="4"  >
						 <div id="scroll">
						 <span class="workParent">
						 	
						 </span>
						 </div>
					 
						  </td>
						  <th colspan="1"  class="section">일감 대상<br>관리자</th>
						<td colspan="5" class="add">
					 <c:set var="observerList" value="${work.workObserverList }" />
					<%--  ${work.workObserverList } --%>
						<div class="scroll observer">
						   <c:choose>
									<c:when test="${not empty observerList }">
											  <div class="row">
											  <c:forEach items="${observerList}" var="observer">
											   <div class="col-sm-6">
		 										 	<c:if test="${not empty observer.observerName}">
													 <div class="card">
													  <div class="card-body">
													 <span class="witdthMin"> 
													  ${observer.observerName}</span> 
													  </div>
													  </div>
		 										 	</c:if>
		 										 	</div>
											  </c:forEach>
		 									 </div>
									</c:when>
								 
							</c:choose> 
						</div>
						</td>
						  
						  
					</tr>
				 
					<tr>
						
					</tr>
					<tr>
						<td colspan="6"> </td>
					</tr>
					</tbody>
					
				</table>
				
<div class ="repArea">				
<div id="replyInsertArea">
	<form method="post" action="${pageContext.request.contextPath}/project/${pCode}/work/reply/create"  id="replyInsertForm" >
				 <div class="card ">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> 피드백 등록
	</div>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<label for="replyId"> </label>
				 
			</div>
			<textarea class="form-control" name="workRepCn" id="exampleFormControlTextarea1" rows="3"></textarea>
			<span class="right">
			<button type="button" id="insertRep" class="btn btn-dark mt-3 insertBtn ">등록</button>
			</span>
		    </li>
		</ul>
	</div>
</div>
				 <input type="hidden" name="memId" value="${authMember.memId}">
 				 <input type="hidden" name="prjctNo"  value="${pCode}">
 				 <input type="hidden" name="ctgryCode"  value="${work.ctgryCode}">
 				 <input type="hidden" name="workCode"  value="${work.workCode}">
				  
				 </form>
	</div>			 
<div id="repModifyForm">
				 <form method="post" action="${pageContext.request.contextPath}/project/${pCode}/work/reply/modify"  id="replyModifyForm" >
				 <div class="card ">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i>피드백 수정
	</div>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<label for="replyId"> </label>
				 
			</div>
			<textarea class="form-control" name="workRepCn" id="modifyRepCn" rows="3"></textarea>
			<span class="right">
			<button type="button" id="updateRep" class="btn btn-dark mt-3 updateBtn ">수정</button>
			<button type="button" id="updateBack" class="btn btn-dark mt-3 gack ">취소</button>
			</span>
		    </li>
		</ul>
	</div>
</div>
				 <input type="hidden" name="memId" value="${authMember.memId}">
 				  <input type="hidden" name="workRepNo" />
 				   <input type="hidden" name="workCode"  value="${work.workCode}">
				 </form>
				 
				 
			</div>
			
		<table id="replyTable" class="table ">
			 <thead class="repHead">
				<tr>	
					<th  class="text-center fixed">번호</th>
					<th colspan="3" class="text-center feedback">피드백</th>
					<th colspan="2" class="text-center fixedReply">작성자</th>
					<th colspan="2" class="text-center fixedReply">작성일자</th>
					<th  colspan="3" class="text-center fixedBtn">&nbsp;</th>
				</tr>
					<tbody id="listBody" class="overflow-auto">
					 
					</tbody>
					<tfoot>
					<tr>
					<td colspan="11">
				<div id="pagingArea"></div>
					</tr>
					</tfoot>
				</table> 

	</div>
 </div>
			
		</div>
		  
		  
		  
		  
		
<!-- 진척도 수정 모달 -->
<!-- Modal   <!--  -->  
<div id="background"  >
		 <div class="modal fade" id="mydegreeUpdate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-fullscreen-lg-down  modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="staticBackdropLabel">
		     <i class="fa fa-pencil-square-o" aria-hidden="true"></i>     
		        진척도 수정</h2>
		      		 <a class="btn-close trigger closeDegree" href="#">
       					 <i class="fa fa-times" aria-hidden="true"></i>
    				  </a>
		      </div>
		      
		      <div class="modal-body">
		      <form id="updateDegreeForm"  action="${cPath}/project/${pCode}/work/modify/updateDegree" method="Post">
		        <label class="fontlager" for="workPrgsDgreePoint"> 진척도  </label> 
		         <select class="form-control" name="workPrgsDgreePoint">
					<option value="0">0%</option>
					<option value="10">10%</option>
					<option value="20">20%</option>
					<option value="30">30%</option>
					<option value="40">40%</option>
					<option value="50">50%</option>
					<option value="60">60%</option>
					<option value="70">70%</option>
					<option value="80">80%</option>
					<option value="90">90%</option>
					<option value="100">100%</option>
				</select>
				<input type="hidden" name="workCode" value="${work.workCode }">
		      <div class="modal-footer">
		        <button type="submit" class="btn updateBtn updateDegreeBtn">수정</button>
		        <button type="button" id="closeDegree" class="btn btn-secondary closeDegree" data-bs-dismiss="modal">닫기</button>
		      </div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
</div>

	
<!--승인시 비밀번호 체크 -->
  <div id="background">
		 <div class="modal fade pmModal" id="acceptModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-fullscreen-lg-down  modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="staticBackdropLabel" >
		       	  <i class="fa fa-pencil-square-o" aria-hidden="true"></i> 	비밀번호 확인
		    </h2>
		      		 <a class="btn-close trigger closeModal" href="#">
       					 <i class="fa fa-times" aria-hidden="true"></i>
    				  </a>
		      </div>
		      <div class="modal-body">
		      <span>승인 처리를 계속하려면 먼저 본인임을 인증하세요.</span><br> 
		      	<form id="acceptCheckForm" action="${cPath }/project/${pCode }/work/manage/create/acceptChcek"  method="Post" >
		      	<label>비밀번호</label>
		      		<input  type="password" onkeyup="acceptDown()" id="pmAccept"  name="memPass" class="inputPass memIdCheck clearValue" placeholder="비밀번호 입력" required>
		      		<input type="hidden" class="clearValue" name="memId">
		      		<input type="hidden"id="workCodeArray" class="clearValue" name="workCodes" >
		      		<!-- <input type="hidden"id="memEmail" name="memMails" > -->
		      	</form>
		    	<div class='show'> <button type="button"  class="btn btn-sm btn-light showMemPass" >비밀번호 보기<span class="checkAt"><i class="fa fa-square-o" aria-hidden="true"></i></span></button></div>
		      <div class="modal-footer">
		        <button type="button" id="acceptChecking"    class="btn updateBtn ">저장</button>
		        <button type="button"  class="btn btn-secondary closeModal" data-bs-dismiss="modal">닫기</button>
		      </div>
				 
		      </div>
		    </div>
		  </div>
		</div>
		</div>
		
			
<!-- 반려시 비밀번호 체크 & 반려사유 입력 -->
  <div id="background">
		 <div class="modal fade pmModal" id="refuseModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-fullscreen-lg-down  modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="staticBackdropLabel" >
		       	  <i class="fa fa-pencil-square-o" aria-hidden="true"></i> 	반려사유
		    </h2>
		      		 <a class="btn-close trigger closeModal" href="#">
       					 <i class="fa fa-times" aria-hidden="true"></i>
    				  </a>
		      </div>
		      <div class="modal-body">
		       <h3 style="text-align: center;">반려사유와 비밀번호를 입력하세요</h3>
		      	<form id="refuseForm" method="Post" action="${cPath }/project/${pCode}/work/manage/create/refuse">
		      	 <div>
		    		 <label for="workReturnWhy"></label>
		    		<textarea rows="12" cols="20"  class="holderArea form-control clearValue" name="workReturnWhy"></textarea>
		    	</div>
		    	<input type="hidden" id="refuseMail"  name="memEmail">
		    	<!-- <input type="hidden" name="memId" > -->
		    	<input type="hidden"  id="refuseWorkCode" name="workCode" >
		    	<input type="hidden" id="refuseWorkSj" name="workSj" >
		    	<input type="hidden" id="refuseMemName" name="memName" >
		    	<input  type="password"  name="memPass" id="refuseMemPass" class=" inputPass memIdCheck clearValue" placeholder="비밀번호 입력" required>
		      	</form>
		    	<div class='show'> <button type="button"  class="btn btn-sm btn-light showMemPass ">비밀번호 보기<span class="checkAt"><i class="fa fa-square-o" aria-hidden="true"></i></span></button></div>
		      <div class="modal-footer">
		        <button type="submit" id="refuseBtn" class="btn updateBtn ">저장</button>
		        <button type="button"  class="btn btn-secondary closeModal" data-bs-dismiss="modal">닫기</button>
		      </div>
				 
		      </div>
		    </div>
		  </div>
		</div>
		</div>
			
		
    


 <!-- 비밀번호 체크 승인 요청 -->
  <div id="background">
		 <div class="modal fade" id="checkModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-fullscreen-lg-down  modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="staticBackdropLabel" >
		       	  <i class="fa fa-pencil-square-o" aria-hidden="true"></i> 	비밀번호 확인
		    </h2>
		      		 <a class="btn-close trigger closeModal" href="#">
       					 <i class="fa fa-times" aria-hidden="true"></i>
    				  </a>
		      </div>
		      <div class="modal-body">
		      	<form id="passCheckForm" method="Post" action="${cPath }/project/${pCode}/work/create/accountCheck">
		      	<label>비밀번호</label>
		      		<input  type="password"  id="notPmPass" onkeyup="enterDown()"  name="memPass" class="holderInput inputPass memIdCheck" placeholder="비밀번호 입력" required>
		    	<input type="hidden" name="memId" value="${authMember.memId}">
		    	<input type="hidden" name="workCode" value="${work.workCode }">
		      	<input type="hidden" name="choice">
		      	</form>
		    	<div class='show'> <button type="button"   class="btn btn-sm btn-light showMemPass" id="">비밀번호 보기<span class="checkAt"><i class="fa fa-square-o" aria-hidden="true"></i></span></button></div>
		      <div class="modal-footer">
		        <button type="submit" id="ckeckSubmit" class="btn updateBtn check">확인</button>
		        <button type="button"  class="btn btn-secondary closeModal" data-bs-dismiss="modal">닫기</button>
		      </div>
				 
		      </div>
		    </div>
		  </div>
		</div>
</div>
	
<form id="workRepDeleteForm" action="${cPath }/project/${pCode}/work/reply/remove" method="post">
				<input type="hidden" name="workRepNo" />
				<input type="hidden" name="workCode" value="${work.workCode }">
</form>
<!-- //////////////////////////////////////////////////////////////////////////////////// -->
  <form id="searchForm" action="${cPath }/project/${pCode }/work/reply" method="get">
			<input type="hidden" name="workCode" value="${work.workCode }" />
			<input type="hidden" name="page" />
  </form> 
		
<script type="text/javascript">
let acceptReq = $("#acceptReq");
let updateDegreeBtn = $("#updateDegreeBtn");

let closeDegree = $("#closeDegree");

let staticBackdrop = $("#staticBackdrop")
let mydegreeUpdate = $("#mydegreeUpdate")
let degreePoint = $("[name='workPrgsDgreePoint']");
 
let checkModal = $("#checkModal");  
let checkAt = $(".checkAt");

var choiceInput =$("input[name='choice']")

let updateBtn = $("#workUpdate")

let insertRep = $("#insertRep");
let workRepDeleteForm = $("#workRepDeleteForm")

//===================입력한 비밀번호 

$(".showMemPass").on("mouseup" , function(){
$(".memIdCheck").attr("type" , "password");
/* checkAt.html('<i class="far fa-square"></i>') */
 checkAt.html('<i class="fa fa-square-o" aria-hidden="true"></i>')
});

$(".showMemPass").on("mousedown" , function(){
	$(".memIdCheck").attr("type" , "text");
	/* checkAt.html("<i class='far fa-check-square'></i>") */
	checkAt.html('<i class="fa fa-check-square" aria-hidden="true"></i>')
	 
	});

 
 //===========================일감 승인
 
   $(".approve").on("click" , function(){
	  var value = "${work.workCode}"
	  $("#workCodeArray").val(value)
	  $( '#background' ).addClass( 'modal__background' );
	  $("#acceptModal").show();
  })
  
  
  $(function(){
	  $("#acceptCheckForm").ajaxForm({
			 dataType :"text",
			 traditional : true,
			 success:function(resp){
				 if(resp=="OK"){
					 Swal.fire({
						 title: "승인 완료",
						  text:  "일감 승인 처리에 성공했습니다",
						  icon: "success",
						  button: "OK",
					}).then(function(){
						 location.reload();
				    });
					 
				 }else if(resp=="NOTAUTH"){
					   Swal.fire({
						 title: "승인 실패",
						  text:  "비밀번호가 일치하지 않습니다",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						arrayClear();
						
				    });  
					
				 }else if(resp="SENDFAIL"){
					 Swal.fire({
						 title: "알림 메일 전송실패",
						  text:   "알림 메일 보내기에 실패했습니다",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						arrayClear();
						
				    });
					 
				 }
			 }
		
		})
		   
 //=================================
let refuseForm= $("#refuseForm") 

$("#refuseBtn").on("click" , function(){
	refuseForm.submit();
})

$(".refuse").on("click" , function(){
	 $("#refuseMemName").val("${work.memName}")
	$("#refuseMemName")
    $("#refuseWorkSj").val("${work.workSj}")
    $("#refuseWorkCode").val("${work.workCode}")
    $("#refuseMail").val("${work.memEmail}")
	$("#refuseModal").show();  
    $( '#background' ).addClass( 'modal__background' );
	
	
})
	//===============================	  
		  
		  $("#refuseForm").ajaxForm({
			 dataType :"text",
			 traditional : true,
			 success:function(resp){
				 if(resp=="OK"){
					 Swal.fire({
						 title: "반려 완료",
						  text:  "반려 처리에 성공했습니다",
						  icon: "success",
						  button: "OK",
					}).then(function(){
						 location.reload();
				    });
					 
				 }else if(resp=="NOTAUTH"){
					 Swal.fire({
						 title: "반려 실패",
						  text:  "비밀번호가 일치하지 않습니다",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						arrayClear();
						
				    });
					
				 }else if(resp="SENDFAIL"){
					 Swal.fire({
						 title: "알림 메일 전송 실패",
						  text:  "알림 메일보내기에 실패했습니다",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						arrayClear();
						
				    });
					 
				 }
			 }
		
		})
		//===========================================  
		  
	  
  })
		
 
 

 
 

//=========================================
	
$(".closeModal").on("click" , function(){
		arrayClear();
}) 
	
	function arrayClear(){
		 $(".pmModal").hide();
		  $( '#background' ).removeClass( 'modal__background' );
		  $(".clearValue").val("");
		  $(".memIdCheck").val("");  
	}

	
function acceptDown(){
	if (window.event.keyCode == 13) { 
		$("#acceptCheckForm").submit();
	 } 
}



$("#acceptChecking").on("click" , function(){
	$("#acceptCheckForm").submit();
		
})


		//=============댓글처리====================
insertRep.on("click" , function(){
	$("#replyInsertForm").submit();
})



let replyInsertForm = $("#replyInsertForm").ajaxForm({
	 dataType : "json",
	 method : "Post",
	 success :function(resp){
		 if(resp=="OK"){
				Swal.fire({
					 title: "피드백 추가",
					  text:  "피드백 추가에 성공했습니다",
					  icon: "success",
					  button: "OK",
				}) .then(function(){
					$("#exampleFormControlTextarea1").val("")
					$("#searchForm").submit();
			    });  
				
		 }else{
					Swal.fire({
						 title:"피드백 추가",
						  text:  "피드백 추가에 실패했습니다",
						  icon: "error",
						  button: "OK",
					}); 
	 	}
		
	 }
			
		 });

let repModifyForm =  $("#repModifyForm")

$("#listBody").on("click" , ".modify", function(){

	 $("#replyInsertArea").hide();
	 repModifyForm.show();
	 var trId = $(this).closest("tr")
	 $(repModifyForm).find("[name='workRepNo']").val(trId.prop("id"));
	 
	 trSpan= $(trId).find(".comment-box").find("span")
	 
	 var trCn  = trSpan.text();

	  $("#modifyRepCn").val(trCn)
	  document.getElementById('modifyRepCn').focus();
 })

 
 $("#updateRep").on("click" , function(){
	 $(replyModifyForm).submit();
 })

 
 
 $("#replyModifyForm").ajaxForm({
	 dataType : "text",
	 method : "Post",
	 success :function(resp){
		 if(resp=="OK"){
				Swal.fire({
					 title: "피드백 수정",
					  text:  "피드백 수정에 성공했습니다",
					  icon: "success",
					  button: "OK",
				}).then(function(){
					$("#searchForm").submit();
					$("#modifyRepCn").val("")
			    }); 
				
		 
		 }else{
					Swal.fire({
						 title:"피드백 수정",
						  text:  "피드백 수정에 실패했습니다",
						  icon: "error",
						  button: "OK",
					}); 
	 	}
		
	 }
			
		 });
		 
		 
		 
$("#updateBack").on("click", function(){
	 $("#replyInsertArea").show()
	 $("#repModifyForm").hide();
	 $("#modifyRepCn").val()
})
 
 $("#listBody").on("click" , ".delete", function(){
	    var trId = $(this).closest("tr");
 		$(workRepDeleteForm).find("[name='workRepNo']").val(trId.prop("id"));
         Swal.fire({
             title: '삭제하시겠습니까?',
             text: "삭제한 피드백은 복구할 수 없습니다",
             icon: 'warning',
             showCancelButton: true,
             confirmButtonColor: '#3085d6',
             cancelButtonColor: '#d33',
             confirmButtonText: '삭제',
             cancelButtonText: '취소'
         }).then((result) => {
             if (result.isConfirmed) {
            	 workRepDeleteForm.submit();
             }
         })
    
 
 })
 
 	
workRepDeleteForm.ajaxForm({
	 dataType : "text",
	 method : "post",
	 success :function(resp){
		 if(resp == "OK"){
				
			 Swal.fire({
					 title: "피드백 삭제",
					  text:  "피드백 삭제에 성공했습니다",
					  icon: "success",
					  button: "OK",
				}).then(function(){
					$("#searchForm").submit();
			    });
				
		 }else{
					Swal.fire({
						 title:"피드백 삭제",
						  text:  "피드백 삭제에 실패했습니다",
						  icon: "error",
						  button: "OK",
					}) 
					
		 }
	 }
}) 


let listBody = $("#listBody");
let pagingArea = $("#pagingArea");

updateBtn.on("click" , function(){
	location.href="${cPath}/project/${pCode}/work/modify/${work.workCode}"
})

	let searchForm = $("#searchForm");
	
$(function(){
 
	
})

	
$("tbody").on("mouseenter",  "#workSj",function() {
         if (this.offsetWidth < this.scrollWidth) {
             $(this).attr('title', $(this).text());
         } else {
             $(this).removeAttr("title");
         }
     });
	 
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})




$("tbody").on("mouseenter",  "#pName",function() {
         if (this.offsetWidth < this.scrollWidth) {
             $(this).attr('title', $(this).text());
         } else {
             $(this).removeAttr("title");
         }
     });
	 
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})

$("tbody").on("mouseenter",  ".idLength",function() {
         if (this.offsetWidth < this.scrollWidth) {
             $(this).attr('title', $(this).text());
         } else {
             $(this).removeAttr("title");
         }
     });
	 
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})


		 
 
	
 $("#searchForm").paging().ajaxForm({
		dataType : "json", 
		success : function(pagingVO){
			listBody.empty();
			pagingArea.empty();
			let repList = pagingVO.dataList;
			let trTags = [];
			if(repList && repList.length>0){
				$(repList).each(function(idx , rep){
					trTags.push(makeTrTag(rep));
				});
				var trLen =  trTags.length 

				if(trLen<5){
					for(var i = 0 ;i<5-trLen; i++){
						trTags.push( 
								$("<tr>").html(
									$("<td>").attr("colspan" , "11").prop("class" , "text-center , notexist")
								)  
						) 
					}
				}	
			pagingArea.html(pagingVO.pagingHTMLBS);
		
			}else{
			 
				
				 trTags.push( 
							$("<tr>").html(
								$("<td>").attr("colspan" , "11").prop("class" , "text-center , notexist").html("현재 등록된 피드백이 없습니다")	
							)  
				 
				 )
					
					 
						for(var i = 0 ;i<5; i++){
							trTags.push( 
									$("<tr>").html(
										$("<td>").attr("colspan" , "11").prop("class" , "text-center , notexist")
									)  
							) 
						}
					
				}//else문
			
				
			listBody.append(trTags)
				
			}//success
	}).submit();

	 
 ; 
	
	
  function makeTrTag(resp){
	 
 
	  
	    if("${authMember.memId}"==resp.repWriterId){
	    
	    let btn = [] 
		let trTags = [] ;
		btn.push(
			$("<div >").append(
				$("<span class='text-left'>").html(resp.repWriter+"&nbsp;&nbsp;"),
				resp.workRepRgsde + "&nbsp;&nbsp;",
				$("<span class='text-right'>").append(
						$("<button>").prop("class", "btn  deleteBtn delete").html('<i class="fa fa-trash-o" aria-hidden="true"></i>'),
						$("<button>").prop("class", "btn  updateBtn modify").html('<i class="fa fa-pencil-square-o" aria-hidden="true"></i>')
							)	
				)	
			);
	    
 
	    
	    return	$("<tr>").append(
				$("<td>").prop("colspan" , '11')
						 .append(btn,
								 $('<div class="comment-box">').append(
											$("<span>").html(resp.workRepCn)	
									)
								 
						 )
				).prop("id" , resp.workRepNo).prop("class" , 'repContents');

	    /* $("<tr>").append(
					$("<td>").prop("class" , "text-center").html(resp.rnum), 
					$("<td>").append(
						$('<div class="comment-box">').append(
								$("<span>").html(resp.workRepCn)	
						)
					).attr("colspan" , "3").prop("class" , "feedback"), 
					$("<td>").append(resp.repWriter).prop("class" , "text-center").attr("colspan" , "2"),
					$("<td>").append(resp.workRepRgsde).prop("class" , "text-center").attr("colspan" , "2"),
					$("<td>").attr("colspan" , "3").append(btn)
				).prop("id" , resp.workRepNo) */
	  }else{
		  
		    let btn = [] 
			let trTags = [] ;
			btn.push(
				$("<div >").append(
					$("<span class='text-left'>").html(resp.repWriter+"&nbsp;&nbsp;"),
					resp.workRepRgsde + "&nbsp;&nbsp;"
					)
				)
				 return	$("<tr>").append(
				$("<td>").prop("colspan" , '11')
						 .append(btn,
								 $('<div class="comment-box">').append(
											$("<span>").html(resp.workRepCn)	
									)
								 
						 )
				).prop("id" , resp.workRepNo).prop("class" , 'repContents');

		}  
  }///work		
	     

  
  
  
function goback(){
	  
	var  preUrl = document.referrer 
 	console.log(preUrl)
	    if(preUrl==null || preUrl.indexOf("create")!=-1 || preUrl.indexOf("modify")!=-1 ||preUrl.indexOf("down")!=-1||preUrl.indexOf("workDetail")!=-1){
		  location.href="${cPath}/project/${pCode}/workList"; 
	 }else{
		 history.go(-1); 
	}   
	 
}

 

//파일 다운로드  
$("tbody").on("click" ,".fileDown"   , function(){
	 let target = $(this)[0];
	 var url = $(target).attr("data-downCode");
	 location.href= url;
}) 


 

$("#del").on("click" , function(){
	$(choiceInput).val("del")
	 modalOpen();
})



$(".acceptReq").on("click" , function(){
	$(choiceInput).val("req")
	 modalOpen();
})

function modalOpen(){
	
		$(checkModal).show();
		 document.getElementById("notPmPass").focus();
	 	$( '#background' ).addClass( 'modal__background' );
}


function enterDown() {
		if (window.event.keyCode == 13) { 
			/* $("#passCheckForm").submit(); */
	 		checks=  $("#ckeckSubmit")
			checks.attr('disabled', true); 
		  } 
		
		return false;
		}

 
$(".check").on("click" , function(){
	$("#passCheckForm").submit();
	$(this).attr('disabled', true);
	
}); //ajaxForm

 

$("#passCheckForm").ajaxForm({
	dataType : 'text',  
	success : function(result){  
		$(".memIdCheck").val("");
		choice = $(choiceInput).val()
		 
		if(result=='OK'){ 
					let workCode = "${work.workCode}";
					if(choice =="req"){
						let memName ="${work.memLnm}${work.memFnm }";
						let workSj = "${work.workSj}";
						
						  $("#checkModal").hide();
						  $( '#background' ).removeClass( 'modal__background' );
						  
							  $.ajax({
								url : "${cPath}/project/${pCode}/work/modify/updateReq", 
								data : {"memName" : memName  , 
										"workCode" : workCode ,
										"workSj" : 	workSj	 },
								dataType : "text",
								method :"POST",
								success :function(resp){
									console.log(resp)
									if(resp == "SEND" ){
											Swal.fire({
												  icon: "success",
												  title: "승인 요청 성공",
												  text: "승인요청이 성공적으로 완료되었습니다.",
												}).then(function(){
													 location.reload();
													 
											    });
									}else if(resp == "SENDFAIL" ){
											Swal.fire({
												  icon: "error",
												  title: "승인 요청 오류",
												  text:  "PM에 알림 실패",
												}).then(function(){
													 location.reload();
													 
											    });
									}else{
											Swal.fire({
												  icon: "error",
												  title: "승인 요청 실패",
												  text:  "서버상의 오류로 승인요청에 실패했습니다. 잠시후에 다시 시도해주세요",
												}).then(function(){
													 location.reload();
												 
											    });
										}
							
								}//성공
								
						})//ajax   
							}else{//삭제 요청
								
								 $.ajax({
										url : "${cPath}/project/${work.prjctNo}/work/remove", 
										data : { 
												"workCode" : workCode ,
												  },
										dataType : "text",
										method :"POST",
										success :function(resp){
											if(resp == "OK"){
												Swal.fire({
													  icon: "success",
													  title: "삭제 성공",
													  text: "삭제가 성공적으로 완료되었습니다.",
													  button :"확인",
													}).then(function(){
													 	location.href="${cPath}/project/${pCode}/workList"
												    });
												}else if(resp == "FILEDELFAIL" ){
													Swal.fire({
														  icon: "error",
														  title: "삭제 실패",
														  text:  "파일 삭제에 문제가 생겼습니다.",
														  button :"확인",
														}).then(function(){
															 location.reload();
															 
													    });
												}else{
													Swal.fire({
														  icon: "error",
														  title: "승인 요청 실패",
														  text:  "서버상의 오류로 승인요청에 실패했습니다. 잠시후에 다시 시도해주세요",
														}).then(function(){
															 location.reload();
															  
													    });
												}
									}//성공
								
								})//ajax   
								
							}
			
		}else if(result=='FAIL'){ 
			Swal.fire({
		    	   title: '비밀번호가 일치하지 않습니다',
		    	   icon: 'error',
		    	   confirmButtonText: '확인'
		    	 }).then(function(){
		    		 checks=  $("#ckeckSubmit")
					 checks.attr('disabled', false); 
			    });
		}else{
			Swal.fire({
		    	   title: '일감의 담당자가 아닙니다',
		    	   icon: 'error',
		    	   confirmButtonText: '확인'
		    	 }).then(function(){
					 checks.attr('disabled', false); 
			    });
		}    
	}     
	
})
  




  
  
  
 $("#degreePoint").on("click" , function(){
	 	$("[name='workPrgsDgreePoint']").val("${work.workPrgsDgreePoint}").prop("selected",true);
	    $("#mydegreeUpdate").show();
	    $( '#background' ).addClass( 'modal__background' );
	     return false;
 })   
 
 
 
  $(".closeModal").on("click" , function(){
	  $("#checkModal").hide();
	  $( '#background' ).removeClass( 'modal__background' );
	  
 }) 
 
 
  $(".closeDegree").on("click" , function(){
	  $("#mydegreeUpdate").hide();
	  $( '#background' ).removeClass( 'modal__background' );
	  
 }) 
 
 
	 let updateDegreeForm =	$("#updateDegreeForm").ajaxForm({
			dataType :"json",
			success :function(resp){
			console.log(resp)
			if(resp =="OK"){ 
				Swal.fire({
					  icon: "success",
					  title: "진척도 수정 완료",
					  text: "진척도가 수정되었습니다",
					}).then(function(){
						 location.reload();
				    });
				
				
			 }else if(resp=="FAIL"){
				
				Swal.fire({
					  icon: "error",
					  title: "진척도 수정 실패",
					  text: "서버 오류로 수정에 실패했습니다 잠시후 다시 시도해주세요",
					}).then(function(){
						  $("#mydegreeUpdate").hide();
						  $( '#background' ).removeClass( 'modal__background' );
				    });
				
			}else{
				Swal.fire({
					  icon: "error",
					  title: "작성자 아이디가 일치하지 않습니다",
					  text:  "잘못된 접근입니다",
					}).then(function(){
						  $("#mydegreeUpdate").hide();
						  $( '#background' ).removeClass( 'modal__background' );
				    });
			 }
		}
	});
	 
 
 
  //파일처리할 때 사용할 것 

let card = $(".workParent") 
 $.ajax({
	 url : "${cPath}/project/${pCode}/work/workDetail/parentList",
	 dataType :"json" ,
	 method :"post",
	 data : {"workCode" : "${work.workCode}"} ,
	 success : function(workParent){
		 let liTags = []; 
		 let parent = workParent[workParent.length-1].parentList;
		
		 console.log(parent )
		
		let set = parent[0];
		
		 paths = set.path.split("!");
		 console.log(paths)
	
		 roots = set.roots.split("!");
		 console.log(roots)
		 if(paths.length>2){
				  card.append(
						  $("<div>").append(makeLiTag(paths , roots ) ).prop("class" , "card")
				  	); 
		 }else{
			 
			 card.append(
					  $("<div>").html("상/하위 일감 관계가 존재하지 않습니다.")
					 );
		 }
		 	  
	 }
 })
 

 $(".workParent").on("click" , ".showDetail" , function(){
	// var code =	 $(this).data("workCode");
	 
	 var code =	 $(this).data("workCode");
	 console.log(code)
	location.href="${cPath}/project/${pCode}/workDetail/" +code;
	 
 })
 
 
 function makeLiTag(paths , roots){
	 let liTags = [];
	 var str ="";
	for( i = 1 ; i <paths.length ; i++){
		console.log(paths)
		if(paths[i] == "${work.workCode}"){
			str+="&nbsp;"
			liTags.push(	$("<ul>").prop("class" , "list-group-item   text-primary  ")
			 .data("workCode" , paths[i]).html( str+ roots[i])
			  )
		}else{
			str+="&nbsp;"
			liTags.push(
						$("<ul>").prop("class" , "list-group-item ").html( str+ roots[i])
						 .append(
						 $("<button>").prop("class" ,"btn showDetail").data("workCode" , paths[i]).html(" 🔍 ")	  
				 )   
			 )
		}
					
	}
	return liTags;
	 
}
 
 
 $("tbody").on("click" ,".deleteBookMark"   , function(){
	    let bookMark = $(this)[0]
		let	workBkmkCode =   $(bookMark).attr("data-workBkmkCode")  	//$(this).data("workBkmkCode")
		console.log(workBkmkCode)
		//$(work).attr("data-workCode")
		/* 	$("#searchForm").submit(); */
		  $.ajax({
			url :  "${cPath}/project/${pCode}/work/remove/"+workBkmkCode,
			dataType :"json",
			method : "POST",
			success :function(result){
				if(result=="OK"){
					Swal.fire({
						 title: "즐겨찾기 삭제",
						  text: "즐겨찾기 삭제에 성공했습니다",
						  icon: "success",
						  button: "OK",
						}).then(function(){
							 location.reload();
					    });
				}else{
					
					Swal.fire({
						title : "즐겨찾기 삭제",
						text : "즐겨찾기 삭제에 실패했습니다.",
						icon : "error",
						button: "OK"
						}).then(function(){
							 location.reload();
					    });
					 
					
					
					
				}
			}
		})	 
	});
	
	
	
	
	
	$("tbody").on("click" , ".insertBookMark" , function(){
		$.ajax({
			url :"${cPath}/project/${pCode}/work/create/bkmk",
 			data : {"workCode" : "${work.workCode}" , "ctgryCode" : "${work.ctgryCode}"}, 
			dataType :"json",
			type : "post",
			success : function(resp){
				if(resp=="OK"){
					
					Swal.fire({
							title: "즐겨찾기 추가",
						  text: "즐겨찾기 추가에 성공했습니다",
						  icon: "success",
						  button: "OK",
						}).then(function(){
							 location.reload();
					    });
				}else{
					Swal.fire({
						title : "즐겨찾기 추가",
						text : "즐겨찾기 추가에 실패했습니다.",
						icon : "error",
						button: "OK"
						});
					
					}//else
				
				}//success
		 		
		})
	
	})
	
	
	
$(".controlBtn").on('click', function(){
	 
		let gopage = $(this).data("gopage");
		if(gopage){
			location.href = gopage
		}
})
	
	
	$("tbody").on("click" , ".whyNot" , function(){
		let work = $(this)[0]
 
		   $.ajax({
			url : "${cPath}/project/${pCode}/workDetail/returnWhy",
			data : {"workCode" :  $(work).attr("data-workCode")},
			dataType :"json",
			type : "post",
			success :function(resp){
				//console.log(resp)
			if(resp.result =="SUCCESS"){
				Swal.fire({
					  icon :"info", 
					  text: resp.why,
					  button: "확인"
					});
			}else{
				Swal.fire({
					  icon :"error", 
					  text: resp.why,
					  button: "닫기"
					});
				
			}
		 }
		});     
		
	});
	 

	var options = {
	  chart: {
	    height: 180,
	    width : 350, 
	    type: "radialBar"
	  },
	  
	  series:  ["${work.workPrgsDgreePoint}"],
	  
	  plotOptions: {
	    radialBar: {
	      hollow: {
	        margin: 10,
	        size: "70%"
	      },
	     
	      dataLabels: {
	        showOn: "always",
	        name: {
	          offsetY: -10,
	          show: true,
	          color: "#888",
	          fontSize: "10px"
	        },
	        value: {
	          color: "#111",
	          fontSize: "20px",
	          show: true
	        }
	      }
	    }
	  },

	  stroke: {
	    lineCap: "round",
	  },
	  labels: ["Progress"]
	};

	var chart = new ApexCharts(document.querySelector("#chart"), options);

	chart.render();
 
 </script>



 </body>
