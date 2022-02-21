<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="${cPath }/resources/css/commons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/ckeditor/ckeditor.js"></script>
<!-- 추가할 스크립트-->
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/vendor/jquery.ui.widget.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.iframe-transport.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.fileupload.js"></script>
<link rel="stylesheet" href="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/css/jquery.fileupload.css">
<script type="text/javascript" src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.fileupload-process.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- 여기까지만 추가하시면 됩니다 -->

<title>일감 등록 폼</title>
<style>
body{
font-size : 1.2em;
overflow: auto;

}
 

.textTag{

width :80%;

}


.box {
 width: 30%;
background-color: #99ccff;
	
	}

 #search{
  height: 38px;
  border-radius: 1px;
 }
.backgroundColor{
background-color: white;
max-width: 1100px; 
 
}
 
.sizing{
overflow:auto;
height: 100px;
}

.bottom{
clear:left;
}

.modal__background{
  position: fixed;
  top:0; left: 0; bottom: 0; right: 0;
  background: rgba(230, 230, 230, 0.8);
} 

.modal{
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
 
}
 

.modal-dialog{
    overflow-y: initial !important;
}
.modal-content{
    height: 100%;
    overflow-y: auto;
}

.required , .error{
color: red;
}
.checkleft{
float: right;
}

.next{
width:100%; word-break:break-all;word-wrap:break-word;"
}

#par , #part{
	display: grid;
	grid-template-columns :50% 50% ;
	width: 95%;
	 /* justify-content: center; */
}

 

 
.uploadBtn{
width: 25%;
}

#reset{
 height: 38px;
 border-radius: 1px;

}
  .col-md-11{

background-color: white; 
 border-radius: 15px;
}
   

.minSelect{
width:20%!important;
}

.setLine{
height: 38px!important;
}
.cnArea{

clear: both;
}

 
 
.upperLabel{
width: 206px;
}
.smaller{
font-size: smaller;
}
 
.table{
width: 100%;
padding: 1%;
}

th{
background-color: #F0F9FC;
}

/* .table td , tr{
border: 1px solid;
} */

.right{
float: right;
}

input[type="checkbox"] {
  position: relative;
  top: 4px;
  
}

.selTag{
width: 35%;
}

#blank{
margin-left: 20px;
}


#addModal{

display: none;
}

 
.uploadDiv{
display : none;
justify-content: flex-end ;
}

.uploadBtn{
width: 120px;
display: flex;
 
}
.btnArea{
width: 100%;
}
.buttonSize{
width: 80px;

}

.fixedBtn{
width: 80px;
 
}

 
 input[type='password']{
  width:200px!important;
  height:100px !important;
  font-size:20px;
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
 
<div class='backgroundColor' >
<div class='backgroundColor'>
<c:choose>
 	<c:when test="${command eq 'INSERT' }">
 		<h3>새 일감 등록하기</h3>			
 	</c:when>
 	<c:otherwise>
 		<h3>일감 수정하기</h3>
	<input class="form-control textTag " type="hidden" name="workCode" 
		${command ne "INSERT" ? "required" : ""} value="${work.workCode }" readonly="readonly" />	
 	</c:otherwise>
   </c:choose>
   <span class="smaller"><span class="required">※</span>필수값(비공개 일감의 경우 간트차트에서 확인이 불가하고 일감 대상 관리자를 변경할 수 없습니다)</span>
   
 <button type=button class="btn dataSetting" onclick="data1()">설계</button>
 <button type=button  class="btn dataSetting" onclick="data2()" >구현</button>
 <form:form commandName="work"  id="workForm" method="post"   >

 <c:if  test="${command eq 'UPDATE' }">
	<!-- 수정 시 -->
		<input type="hidden" name="workCode" value="${work.workCode }" placeholder="일감번호"/>
	</c:if>
	<input type="hidden" name="memId" value="${authMember.memId}">
 			<input type="hidden" name="prjctNo"  value="${pCode}">

 <table class="table table-bordered ">
 <tr>
 	<th>제목&nbsp;<span class="required">※</span></th>
 	 	<td colspan="3"><input class="form-control " maxlength="150"  id="textWidth" type="text" name="workSj" value="${work.workSj }" placeholder="150자 이내"/>
 	 	 <form:errors path="workSj"  element="label" cssClass="error" id="workSj-error" for="workSj" />
 
 	 	</td>
 </tr>
 	 <tr>
 	 	<th>일감 카테고리&nbsp;<span class="required">※</span></th>
 	 	<td class="selTag">
 	 	<c:if test="${command eq 'INSERT' }">
		<select class="form-control" name="ctgryCode" >
			<option value>카테고리</option>
	 	<c:forEach items="${cartegoryList }" var="cartegory">
						<option value="${cartegory.ctgryCode }">
							${cartegory.ctgryNm }
						</option>
			</c:forEach> 
		</select>
		 <form:errors path="ctgryCode"  element="label" cssClass="error" id="ctgryCode-error" for="ctgryCode" />
 
		</c:if>
			<c:if  test="${command eq 'UPDATE' }">
			<select  class="form-control " disabled="disabled">
				<option selected="selected">${work.ctgryNm } </option>
			</select>
			<input type="hidden" name="ctgryCode" value="${work.ctgryCode }">
			<input type="hidden" name="ctgryNm" value="${work.ctgryNm }">
		</c:if>
		
 	 	</td>
 	 	<th>
 	 	 	비공개여부		
 	 	</th>
 	 	<td class="selTag">
 	 	<span id='blank'>
 	 	<c:choose>
	 	 	<c:when  test="${work.workOthbcAt eq '0' }">
	 	 			<input type="checkbox"  name="workOthbcAt" value="0"  class="form-check-input" id="closed" checked  > 비공개
	 	 	</c:when>
	 	 	<c:otherwise>
	 	 			<input type="checkbox"  name="workOthbcAt" value="0"  class="form-check-input" id="closed"  > 비공개
	 	 	</c:otherwise>
 	 	</c:choose>
 	 	</span>
				<input type="hidden" name="workOthbcAt" value='1' id="open" />
 	 	</td>
 	 </tr>
 		<tr>
 			<th>상태&nbsp;<span class="required">※</span></th>
 	 	<td class="selTag">
 	 		 <select name="workSttusCode" class="form-control  ">
 	 <!-- 업로드할 때는 신규만 가능하고 허가 승인 받은 상태에서는 진행으로 변경 가능 완료는 관리자의 완료가 될 경우 내가 처리해줘야함 -->
 	 		<option value>일감 상태</option>
 	 		
		 	<c:forEach items="${commonList }" var="status">
						<option value="${status.codeNo }">
							${status.codeNm }
						</option>
			</c:forEach>  
 	 </select>
			 <form:errors path="workSttusCode"  element="label" cssClass="error" id="workSttusCode-error" for="workSttusCode" />
 	 	</td>
 	 
 	 	<th>시작일시&nbsp;<span class="required">※</span></th>
 	 	<td class="selTag">
 	 	<input class="form-control " id="starting" type="date" name="workBgnde" value="${work.workBgnde }" />
		<form:errors path="workBgnde"  element="label" cssClass="error" id="workBgnde-error" for="workBgnde" />
		
 	 	</td>
 	 
 		
 		</tr>
 		<tr>
 			<th>일감 우선순위&nbsp;<span class="required">※</span></th>
 	 	<td class="selTag">
 	 <select name="workPriortCode" class="form-control ">
 	 		<option value>일감 우선순위</option>
 			<c:forEach items="${priortList }" var="priorty">
						<option value="${priorty.codeNo }">
							${priorty.codeNm }
						</option>
			</c:forEach>  
 	 </select>
 	 <form:errors path="workPriortCode"  element="label" cssClass="error" id="workPriortCode-error" for="workPriortCode" />
 	
 	 	</td>
 		<th>종료일시&nbsp;<span class="required">※</span></th>
 	 	<td class="selTag">
 	 	<input class="form-control "  id="ending" type="date" name=workEndde value="${work.workEndde }" />
		<form:errors path="workEndde"  element="label" cssClass="error" id="workEndde-error" for="workEndde" />
 	 	</td>
 		</tr>
 		<tr>
 		<th>상위일감</th>                    
 	 	<td class="selTag">
 	 	<div class="input-group">
 	 	<input id="upperSj" class="form-control " readonly="readonly" type="text"  value="${work.upperWorkSj }" placeholder="상위일감"/>
 	 	 <!-- type="hidden" -->
 	 <span class="input-group-btn">
 	<button type="button" id="search">🔍</button>
	<button type="button" id="reset" class="resetBtn btn"><img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button> 
	</span>
	</div>
	<input id="upperId" type="hidden" class="form-control" readonly="readonly"  name="upperWorkCode" value="${work.upperWorkCode }"/>
	<form:errors path="upperWorkCode"  element="label" cssClass="error" id="upperWorkCode-error" for="upperWorkCode" />
	
 	 	</td>
 		<th>진척도</th>
 	 	<td class="selTag">
 	 	<select class="form-control " id="degree" name="workPrgsDgreePoint">
			<option selected="selected" value="0" >0%</option>
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
		<form:errors  element="label" path="workPrgsDgreePoint" cssClass="error" id="workPrgsDgreePoint-error" for="workPrgsDgreePoint" />
	
 	 	</td>
 		</tr>
 	
 		 <tr>
 		<th>
 		첨부파일
 		</th>
 	 	<td>
 	 	 <div class="sizing">
	 			<table class=' template-upload fade image in'>
						<thead>
						 
						</thead>
						<tbody class='fileSet'> 
							 
						</tbody>
						</table>
			</div>
 	 	</td>
 	 	 <th>일감 대상 관리자
 	 	 </th>
 	 	 <td class="selTag">
 	 	 <div class="sizing form-check observers">
					 
					  <div class="col-sm-5">
					<input type="checkbox" class="form-check-input"  id="allCheck" >전체선택
					 
					   </div>
					 <br>
					<c:if test="${not empty observerList}">
					 
							<c:forEach items="${observerList}" var="observer">
						 		<c:if test="${not empty work.workObserverList}">
						  <div class="col-sm-5">
						 		<input type="checkbox" name="memIds" class="form-check-input myCheck memIds" value="${observer.memId}" 
								<c:forEach var="myobserver" items="${work.workObserverList}">
									${work.workObserverList}
									 <c:if test="${myobserver.observerId eq  observer.memId}">
										checked
										</c:if> 
								</c:forEach>
								>${observer.memName}
						 </div>
						 		</c:if>
						 		 <c:if test="${empty work.workObserverList}">
						 	  <div class="col-sm-5">
						 		 <p>
						 <input type="checkbox" name="memIds" class="form-check-input myCheck memIds" value="${observer.memId}" >${observer.memLnm} ${observer.memFnm} 
						 		 </p>
						 		 </div>
						 		 </c:if>
							</c:forEach>
							<form:errors  element="label"  path="memIds" cssClass="error" id="memIds-error" for="memIds" />
				 </c:if>	
				</div>
 	 	 </td>
 	 	 
 		</tr>
 			  <c:if  test="${command eq 'UPDATE' }">
 		 <tr>
 		<th>기존 첨부파일</th>
 		<td colspan="3">
 			 <div class="sizing">
			 			 	<c:forEach items="${work.workFileList }" var="workFile">
							<c:if test="${not empty workFile.workFileCode }">
									<p class='file'> 
										${workFile.workFileNm }<button type="button" data-delFileNo="${workFile.workFileCode }" class="btn btn-light del"><i class="fa fa-trash" aria-hidden="true"></i></button>
									</p>
							</c:if>
							</c:forEach>
						 
							</div>
 		</td>
 		 </tr>
			  	</c:if>
 		  <tr>
 		  <th colspan="4">
 		  	내용&nbsp;<span class="required">※</span>
 		  </th>
 		  </tr>
 		  <tr>
 		  <td colspan="4">
 		  <textarea required class="form-control" id="workCnArea" name="workCn" >${work.workCn }</textarea>
		<form:errors path="workCn" cssClass="error"  element="label" id="workCn-error" for="workCn" />
 		  </td>
 		  </tr>
 		  
 		
 </table>
 	
 
				</form:form >
	</div>	

<div>
 
<!-- <div class="white"> -->


 	<div class="btnArea   ">
 
	<div class="right buttonSize">
	<c:if  test="${command eq 'INSERT' }">
	<button type="button" id="sub" class="btn insertBtn">저장</button>
	</c:if>
	<c:if  test="${command eq 'UPDATE' }">
	<button type="button" id="sub" class="btn updateBtn">수정</button>
	</c:if>
	
	</div>
	
	<div class="uploadBtn right">
<form id="fileupload" enctype="multipart/form-data " >
 <span class="btn btn-success fileinput-button">
  	 <i class="glyphicon glyphicon-plus"></i>
     <span>파일 선택</span><!-- onchange="fileUploadFunction()" -->
	<input name="files" id="fileUploadBtn" type="file" multiple="multiple" />
	</span>
	<input type="hidden" value="WO" name="menuClCode">
</form> 
</div>

	<div class="right fixedBtn">
	<button class="btn gobackBtn" onclick="goback()">글 목록</button>
	</div>
</div> 
</div>
</div>
 
 

<script type="text/javascript">
let uploadForm = $("#fileupload")[0];
let fileSet = $(".fileSet");
let fileArea = $("#fileArea");  
let tbody = $(".fileSet");
let textWidth = $("#textWidth");
let workCnArea =	document.getElementById("workCnArea");


$("select[name='ctgryCode']").val("${work.ctgryCode }");
$("select[name='workSttusCode']").val("${work.workSttusCode }");
$("select[name='workPriortCode']").val("${work.workPriortCode }");

 if("${work.workPrgsDgreePoint }" || "${work.workPrgsDgreePoint }".length>0){
	$("select[name='workPrgsDgreePoint']").val("${work.workPrgsDgreePoint }");
} 
 
	 console.log( "진척도" +  "${work.workPrgsDgreePoint }".length);

	 document.getElementById('ending').value ="${work.workEndde}"
	 document.getElementById('starting').value ="${work.workBgnde}"
 
 
 function data1(){
	
	//카테고리 코드
/* 	$("select[name='ctgryCode']").val("${work.ctgryCode }"); */
	//상태
	$("select[name='workSttusCode']").val('W00101');
	//우선순위
	$("select[name='workPriortCode']").val("W00202");
	$("select[name='ctgryCode']").val("321");
	//시작일시
	document.getElementById('starting').value ="2021-10-01"
	//종료 일시
	document.getElementById('ending').value ="2021-10-23"
		 
	$("select[name='workPrgsDgreePoint']").val(20);	 
	$("input[name='workSj']").val('프로세스 구조도 구성');	
	CKEDITOR.instances.workCnArea.setData('프로세스 구조도를 구성한 후 첨부 파일로 완성본 업로드하겠습니다. '); 
 	
}
 
 function data2(){
	
	//카테고리 코드
	
	$("select[name='ctgryCode']").val("322");
	//상태
	$("select[name='workSttusCode']").val('W00102');
	//우선순위
	$("select[name='workPriortCode']").val("W00201");
	//시작일시
	document.getElementById('starting').value ="2021-10-01"
	//종료 일시
	document.getElementById('ending').value ="2021-10-12"
		 
	$("select[name='workPrgsDgreePoint']").val(80);	 
	$("input[name='workSj']").val('자유게시판 CRUD 구현');	
	CKEDITOR.instances.workCnArea.setData('자유 게시판 CRUD 기능 구현하여 커밋하겠습니다.'); 
 	
 
}
 
 
$(function(){
	var memIds = []
	
	 
	
})
 
 
const WORKFORM = $("#workForm")
//---------------------------------------------------------------------------------
let fileUploadBtn = $("#fileUploadBtn");

function fileButton(){
	fileUploadBtn.click();
}


function fileUpload(){
	$("#fileupload").fileupload({
 		url:  "${pageContext.request.contextPath }/project/${pCode}/file/fileUpload",
		autoUpload: true,//자동으로 파일 올리기
		sequentialUploads: true,//순서대로 파일 올리기 
		dataType: 'json',
		add: function(e, data){
			 var isValid = true;
			 var uploadFile = data.files;
		 
			  if (isValid) {
		          data.submit();
			}    
		 }, progressall: function(e,data) {
		        var progress = parseInt(data.loaded / data.total * 100, 10);
		        $('#progress .bar').css(
		          'width',
		          progress + '%'
		        );
		      }, done: function (e, data) {
		    	  trTags = [];
		    	 let fileList  = data.result.files[0];
		 			 $(fileList).each(function(index, file){
		 				trTags.push(makeFileBtn(file));
		 			 });
		 		  
		 			fileSet.append(trTags);//여기서 테이블에 넣어주고 있습니다
		 		  	 
		      }, fail: function(e, data){
		        alert('서버와 통신 중 문제가 발생했습니다');
		        foo = data;
		      }
		    });
 
 
	
}


$("#fileupload").fileupload({
		url:  "${pageContext.request.contextPath }/project/${pCode}/file/fileUpload",
	autoUpload: true,//자동으로 파일 올리기
	sequentialUploads: true,//순서대로 파일 올리기 
	dataType: 'json',
	add: function(e, data){
		 var isValid = true;
		 var uploadFile = data.files;
		// console.log(uploadFile[0].size)
		/*  let maxsize =  5 * 1024 * 1024; //임의로 지정해뒀습니다. 필요 없으실 경우 data.submit()만 해도 됩니다
		   if(uploadFile[0].size > maxsize){
				swal({
					title : "잘못된 요청입니다!",
					text : '각 파일 용량은 5메가를 초과할 수 없습니다.',
					icon : "error",
				});
			 
			 isValid = false;
		 }   */
		 
		  if (isValid) {
	          data.submit();
		}    
	 }, progressall: function(e,data) {
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        $('#progress .bar').css(
	          'width',
	          progress + '%'
	        );
	      }, done: function (e, data) {
	    	  trTags = [];
	    	 let fileList  = data.result.files[0];
	 			 $(fileList).each(function(index, file){
	 				trTags.push(makeFileBtn(file));
	 			 });
	 		  
	 			fileSet.append(trTags);//여기서 테이블에 넣어주고 있습니다
	 		  	 
	      }, fail: function(e, data){
	        alert('서버와 통신 중 문제가 발생했습니다');
	        foo = data;
	      }
	    });


$(fileUploadBtn).on('change'  ,function(event){
	 $("#fileupload").fileupload({
	 		url:  "${pageContext.request.contextPath }/project/${pCode}/file/fileUpload",
			autoUpload: true,//자동으로 파일 올리기
			sequentialUploads: true,//순서대로 파일 올리기 
			dataType: 'json',
			add: function(e, data){
				 var isValid = true;
				 var uploadFile = data.files;
				 
				 
				  if (isValid) {
			          data.submit();
				}    
			 }, progressall: function(e,data) {
			        var progress = parseInt(data.loaded / data.total * 100, 10);
			        $('#progress .bar').css(
			          'width',
			          progress + '%'
			        );
			      }, done: function (e, data) {
			    	  trTags = [];
			    	 let fileList  = data.result.files[0];
			 			 $(fileList).each(function(index, file){
			 				trTags.push(makeFileBtn(file));
			 			 });
			 		  
			 			fileSet.append(trTags);//여기서 테이블에 넣어주고 있습니다
			 		  	 
			      }, fail: function(e, data){
			        alert('서버와 통신 중 문제가 발생했습니다');
			        foo = data;
			      }
			    });
	 
	 
	 
})


//-------------------------------------------------------------------------

/* 
$("#degree").on("change" ,function(){
	if($("#closed").prop("checked")){
		Swal.fire({
			 title: "비공개일감",
			  text: "비공개일감의 경우 진척도를 변경할 수 없습니다",
			  icon: "error",
			  button: "OK",
			}) 
			
		$("#degree").val()	
	$("#degree option:eq(0)").prop("selected", true);

	}
	
}) */

<c:if test="${command eq 'UPDATE'}">
	///////파일 삭제 버튼 누르면 파일 숨김 처리되고 delete 파일에 들어감 
	
	$(".sizing").on("click" ,".del" , function(){
		let fileNo = $(this).data("delfileno")
		WORKFORM.append(
				$("<input>").attr({
					name : "delFileNo",
					type : "hidden",
					value :fileNo
				})					
			); 
		$(this).closest(".file").hide();
		//==============
		
	});
 
	
	
 
</c:if>
 $("#reset").on("click" , function(){
$("#upperSj").val("");
$("#upperWorkCode").val("");
 });
 
 
 
 
 function goback(){
 	  
 	var  preUrl = document.referrer 
  
 	  if(preUrl==null || preUrl.indexOf("create")!=-1 || preUrl.indexOf("modify")!=-1 ){
 		  location.href="${cPath}/project/${pCode}/workList"; 
 	 }else{
 		 history.go(-1); 
 	} 
 	 
 }

 
 
 
$("#search").on("click" , function(){
 
	 var popUrl ="${cPath}/project/${pCode}/work/create/workSearch";
/* 	window.open(popUrl, "상위 일감 검색 ",  "top="+popY+", left="+popX+",width="+popWidth+",height="+popHeight+", scrollbars=yes,resizable=yes");
		 */ 
/* 	 var popupX = (window.screen.width / 2) - ("800px" / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - ("1500px" / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
 */
 h = "800px"
 w = "1500px"

 LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
 TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
 settings = 'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+', resizable'
 window.open(popUrl, '상위 일감 등록', settings  );

 
 });
 
//
 
 
 
 $(".closeModal").on("click" , function(){
 
	 closeModal();
});
 
 
 function closeModal(){
	 $(".modal-body").empty(); 
	 $("#addModal").hide();
	 $("#upperId").val("")
	  $( '#background' ).removeClass( 'modal__background' );
	 
 }
 
 
 $(function(){
	 
	 let checkboxes   = $(".myCheck").length;
	 let checked = $(".myCheck:checked").length;
	 if(checkboxes!= checked){
			$('#allCheck').prop('checked',false);
		 }else if(checkboxes==checked){
			$('#allCheck').prop('checked',true);
		 }
	})
 
 
 
 $("#allCheck").on("click", function(){
 	if($('#allCheck').is(':checked')){
	 		  let checkboxes   = $(".myCheck").length
	 		  let allCheckLenght =checkboxes 
	 		  $('.myCheck').prop('checked',true);
 	    }else{
 	       $('.myCheck').prop('checked',false);
 	    }

 })

 
$(".observers").on("change" , ".myCheck" , function(){
	 let checkboxes   = $(".myCheck").length;
	 let checked = $(".myCheck:checked").length;
		 if(checkboxes!= checked){
			$('#allCheck').prop('checked',false);
		 }else if(checkboxes==checked){
			$('#allCheck').prop('checked',true);
		 }
})
 
$(".controlBtn").on('click', function(){
		let gopage = $(this).data("gopage");
		if(gopage){
			location.href = gopage
		}
})
	
	
	
	
//값 가져올 때 

	////////////////////

	
	
	
let  bgnde =$("#starting")
let  endde = $("#ending")

let workForm = $("#workForm")
 
$("#sub").on("click", function(){
	

	
  if(bgnde.val()!=null && endde.val()!=null){
		let startDate = bgnde.val();
		let endDate =endde.val();
		 
		let startDe = new Date(startDate);
		let endtDe = new Date(endDate);
	 	
		let start = startDe.getTime();
		let end = endtDe.getTime();
	 
		
		
		if(start>end){
			Swal.fire({
						 title: "날짜 설정 오류",
						  text: "종료날짜보다 시작날짜가 작아야합니다",
						  icon: "error",
						  button: "OK",
						}) 
			 return false;
			
			
			
		}else{
			
			
			mysubmit(event);
			 
			return false;
		}
	}else{
		mysubmit(event);
		
			//formSubmit();
		return false;
		//$(workForm).submit();
	}
	
})
 
 
	   
 
 
 
//=============================================================================================

function mysubmit(event){
	

		var editorContent =  CKEDITOR.instances.workCnArea.getData(); 
	    editorContent = editorContent.replace(/<br\/>/ig, "\n");  
	 	editorContent = editorContent.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
		editorContent = editorContent.replace(/(<([^>]+)>)/gi, "");
		  editorContent = editorContent.replace(/&nbsp;/gi,"");   
	/* 	CKEDITOR.instances.workCnArea.setData(editorContent);  */
		  $(workCnArea).val(editorContent)  
	var sendOk = false;	
	if(editorContent.trim() =='' ||editorContent.trim().length ==0){
	     
	    $(workCnArea).focus();
	    
	    Swal.fire({
			 title: "필수 항목 오류",
			  text: "내용이 비어있습니다",
			  icon: "error",
			  button: "OK",
			}) 
			
	}else {                              
		if($("#closed").prop("checked")){
			  document.getElementById("open").disabled = true;
			
			  
			  if(checked = $(".myCheck:checked").length >0){
					  			Swal.fire({
									 title: "비공개일감",
									  text: "비공개일감은 관람자를 설정할 수 없습니다",
									  icon: "error",
									  button: "OK",
									})
									 sendOk = false;	
				  		 }else{
				  			sendOk = true;
				  		 }
			  
			}else {
			  document.getElementById("closed").disabled = true;
			  sendOk = true;	
			}
			 
		 
	}

		
	
	if(sendOk == true){
	$(workForm).submit();	
	}
	
}
 
 
 
  
			
 	
 function makeFileBtn(file){
 /*
 생성될 경우 넘겨질 vo의 수를 증가 시켜줌
 */
 			  if( $("tr").hasClass("fileName")==true){
 				  
 				 let fileName = $(".fileName").last();
 				 
 				 let no =	parseInt($(fileName).data("no")) +1 ;
 /*
 workFileList는 workVO에 파일을 담기위해 추가한 workFile을 담기위한 List 입니다.
 workFileList 는 각자의 파일 명을 담는 VO의 파일 명 변수 를 입력하시면 됩니다  
 workFileList[" + no +"].workFileSavedNm" 
.workFileSavedNm 의 명은 각 파일 vo의 변수명을 의미합니다 저장명과 파일이름 파일 저장 일자 삭제 여부 그리고 테이블에는 없지만 TEMP 여부를 담을 변수명을추가해주세요h
 				 
 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileSavedNm").prop("value", file.fileSavedNm)
 */
 				return	$("<tr class='fileName'>").append(
 						$("<span >").html(file.fileNm + " &nbsp; &nbsp;")
 								   .append(
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileSavedNm").prop("value", file.fileSavedNm), 
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileNm").prop("value", file.fileNm),
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileRgsde").prop("value", file.fileRgsde),
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFiletempAt").prop("value",'0').prop("class" , "workFiletempAt"), //이대로 업데이트 시 템프파일 아님으로 업데이트 됨
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileDelAt").prop("value",'0').prop("class" , "workFileDelAt")
 								   ).append(
 										   $("<button type='button' >").prop("class","deleteBtn").append(  "<i class='glyphicon glyphicon-ban-circle'></i>")
 								   	)
 								).data("no" ,  no);
 			  
 			  }else{
 				 return	$("<tr class='fileName'>").append(
 						$("<span >").html(file.fileNm + " &nbsp; &nbsp;")
 								   .append(
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFileSavedNm").prop("value", file.fileSavedNm).prop("id" , file.fileSavedNm), 
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFileNm").prop("value", file.fileNm),
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFileRgsde").prop("value", file.fileRgsde),
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFiletempAt").prop("value",'0').prop("class" , "workFiletempAt"),
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFileDelAt").prop("value",'0').prop("class" , "workFileDelAt")
 								   ).append(
 										   $("<button type='button'>").prop("class","deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
 								   	)
 								).data("no" , "0")
 			 		}
 			  }
 			
 			  
  	$(tbody).on("click", ".deleteBtn" , function(){
  			console.log($(this).parents("tr")[0])
  		 let  value = $(this).parents("tr")[0]
  		 $(value).find(".workFiletempAt").val("1") //템프파일 여부 1 로 변경하여 템프 파일으로 설정함
  		 $(value).find(".workFileDelAt").val("1") // 파일 삭제 여부를 1로 변경하여 파일 삭제된 파일로 설정함
 		 $(value).attr('style', "display:none;");
  	});
 		  







CKEDITOR.replace('workCn', {
	
	//
	width :'1100px',	
    language : 'en',
    enterMode:'2',
 	/* filebrowserImageUploadUrl:"${cPath}/board/uploadImage.do?type=Images", */
	 toolbar: [ 
       {
         name: 'basicstyles',
         items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'Subscript', 'Superscript']
       },
       {
         name: 'links',
         items: ['Link', 'Unlink']
       },
       {
         name: 'paragraph',
         items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
       },
       {
         name: 'insert',
         items: ['Image', 'Table']
       },
       {
         name: 'editing',
         items: ['Scayt']
       },
       '/',
       {
         name: 'styles',
         items: ['Format', 'Font', 'FontSize']
       },
       {
         name: 'colors',
         items: ['TextColor', 'BGColor', 'CopyFormatting']
       },
       {
         name: 'align',
         items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
       },
       {
         name: 'document',
         items: ['PageBreak', 'Source']
       }
     ] 
			
	,bodyClass: 'document-editor'
     
			
			
});


</script>
</body>
</html>