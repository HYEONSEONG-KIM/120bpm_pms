<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
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
<style>

.sizing{
overflow:auto;
height: 120px;
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

.minSelect{
width:20%!important;
}

.setLine{
height: 38px!important;
}
.cnArea{

clear: both;
}
 
.col-sm-5 , col-sm-2{
background-color: gray;
} 
.upperLabel{
width: 206px;
}
.smaller{
font-size: smaller;
}
 .test{
width: 80%;
padding: 1%;
}

th{
background-color: #F0F9FC;
width : 200px;
}

.right{
float: right;
}

input[type="checkbox"] {
  position: relative;
  top: 4px;
  
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
.required , .error{
color: red;
}
.form-check-input{
width:13px;
height:13px;
vertical-align:middle;
margin-top: 15px;
}
 form-check-label{vertical-align:-1px}
 
 .existFile{
 display: grid;
  grid-template-columns: 50% 50%;
  
 }
 
   .col-md-11{

background-color: white; 
 border-radius: 15px;
}
   
</style>
</head>
<body>
<security:authentication property="principal.adaptee" var="authMember" />
<security:authentication property="authorities" var="authMemRoles" />
<!-- 
	시연 ---
 -->
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
 <c:choose>
 	<c:when test="${command eq 'INSERT' }">
 		<h3 onclick="data1()">새 이슈 등록하기</h3>
 		<span><small>등록한 이슈 발생 일감은 수정이 불가합니다</small></span>			
 	</c:when>
 	<c:otherwise>
 		<h3>이슈 수정하기</h3>
 		<span><small>등록한 이슈 발생 일감은 수정이 불가합니다</small></span>			
 	</c:otherwise>
   </c:choose>
   <span class="smaller"><span class="required">※</span>필수값</span>
    
 <!--    <button type="button" ">이슈 등록</button> -->
    <form:form commandName="issue"  id="issueForm" method="post"   >

 <c:if  test="${command eq 'UPDATE' }">
		<input type="hidden" name="issueNo" value="${issue.issueNo }" placeholder="이슈번호"/>
	</c:if>
			<input type="hidden" name="memId" value="${authMember.memId}">
 			<input type="hidden" name="prjctNo"  value="${pCode}">
			
 <table class="table table-bordered test">
 <tr>
 	<th>제목&nbsp;<span class="required">※</span></th>
 	 	<td colspan="3"><input class="form-control " maxlength="150"  required id="textWidth" type="text" name="issueSj" value="${issue.issueSj }" placeholder="150자 이내"/>
 	 	 <form:errors path="issueSj"  element="label" cssClass="error" id="issueSj-error" for="issueSj" />
 	 	</td>
 </tr>
 	 <tr>
 	 
 	 	 	 	<th>
 	 	 	해결여부	<span class="required">※</span>	
 	 	</th>
 	 	<td colspan="3" class="selTag">
  
 		 	<div class="form-check">
					  <input class="form-check-input" type="radio" value='1' name="issueSolutAt" id="end" >
					  <label class="form-check-label" for="flexRadioDefault2">
					   해결
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="radio"  value='0' name="issueSolutAt" id="ing"  checked="checked">
					  <label class="form-check-label" for="flexRadioDefault2">
					  미해결
					  </label>
					</div> 
 
	 	 			
 	 	 
				<input type="hidden" name="workOthbcAt" value='1' id="open" />
 	 	</td>
 	 </tr>
 		 
 		<tr>
 			<th>이슈 우선순위&nbsp;<span class="required">※</span></th>
 	 	<td colspan="3" class="selTag">
 	 <select name="issuePriortCode" class="form-control " required >
 	 		<option value>이슈 우선순위</option>
 			<c:forEach items="${priortList }" var="priorty">
						<option value="${priorty.codeNo }">
							${priorty.codeNm }
						</option>
			</c:forEach>  
 	 </select>
 	 <form:errors path="issuePriortCode"  element="label" cssClass="error" id="issuePriortCode-error" for="issuePriortCode" />
 	 	</td>
 	  
 		</tr>
 		<tr>
 		<th>이슈 발생한 일감<span class="required">※</span></th>                    
 	 	<td class="selTag">
 	 	<div class="input-group">
 	 	<input id="workSjId" required class="form-control " readonly="readonly" value="${issue.workSj }" type="text" name="workSj" placeholder="이슈가 발생한 일감"/>
 	  
 	 <span class="input-group-btn">
  <c:choose>
 	<c:when test="${command eq 'INSERT' }">
 		 	<button type="button" id="search">🔍</button>
			<button type="button" id="reset" class="resetBtn btn"><img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button> 
 	</c:when>
 	<c:otherwise>
 		 <button type="button" id="search" disabled="disabled" >🔍</button>
 	</c:otherwise>
   </c:choose>
 	</span>
	</div>
	<input id="workCodeId" type="hidden" class="form-control" readonly="readonly"  name="workCode" value="${issue.workCode }"/>
	<form:errors path="workCode"  element="label" cssClass="error" id="workCode-error" for="workCode" />
	 	</td>
 		</tr>
 		
 		<tr>
 		<th>
 		해당 일감 카테고리 <span class="required">※</span>
 		</th>
 		<td>
 		<input  class="form-control" required value="${issue.ctgryNm }"  placeholder="일감 카테고리"  readonly="readonly" id="ctgryNmId" name="ctgryNm">
 		<input type="hidden" id="ctgryCodeId" name="ctgryCode"  value="${issue.ctgryCode }" >
		<form:errors path="ctgryCode"  element="label" cssClass="error" id="ctgryCode-error" for="ctgryCode" />
 	
 		</td>
 		
 		</tr>
 			
 		 <tr>
 		<th>
 		첨부파일
 		</th>
 	 	<td colspan="3">
 	 	 <div  class="sizing">
	 			<table class=' template-upload fade image in'>
						<thead>
						 
						</thead>
						<tbody class='fileSet'> 
							 
						</tbody>
						</table>
			</div>
 	 	</td>
 	 	 
 		</tr>
 			  <c:if  test="${command eq 'UPDATE' }">
 		 <tr>
 		<th>기존 첨부파일</th>
 		<td colspan="3">
 			 <div class="sizing existFile">
			 			 	<c:forEach items="${issue.issueFileList }" var="issueFile">
							<c:if test="${not empty issueFile.issueFileCode }">
									<p class='file'> 
										${issueFile.issueFileNm }<button type="button" data-delFileNo="${issueFile.issueFileCode }" class="btn btn-light del"><i class="fa fa-trash" aria-hidden="true"></i></button>
									</p>
							</c:if>
							</c:forEach>
						 
							</div>
 		</td>
 		 </tr>
			  	</c:if>
 		  <tr>
 		  <th colspan="4">
 		  	내용<span class="required">※</span>
 		  </th>
 		  </tr>
 		  <tr>
 		  <td colspan="4">
 		  <textarea required class="form-control" id="issueCnArea" name="issueCn" >${issue.issueCn }</textarea>
		<form:errors path="issueCn" cssClass="error"  element="label" id="issueCn-error" for="issueCn" />
 		  </td>
 		  </tr>
 		  
 		
 </table>
 	
 
				</form:form >

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
	<input type="hidden" value="IS" name="menuClCode">
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
let issueForm = $("#issueForm");
let issueCnArea =	document.getElementById("issueCnArea");
 
 function data1(){
	$("input[name='issueSj']").val("게시글 등록 과정에서 NullPointerException 	발생")	 
	 $("select[name='issuePriortCode']").val("I00101");
	CKEDITOR.instances.issueCnArea.setData('게시글 등록 과정에서 NullPointerException 발생했습니다. 에러의 이유를 알 수 없어서 회의가 필요할 것 같습니다. <br>해결을 위해 피드룸 생성하겠습니다.'); 
 	
 }
 
$(function(){
			 $("select[name='issuePriortCode']").val("${issue.issuePriortCode}");
			// $("checkbox[name='issueSolutAt'][value='']")
				//console.log();
			if("${issue.issueSolutAt}"==1){
				$("#end").prop('checked', true);  
			}else{
				$("#ing").prop('checked', true);  
				
			}
				

})
$("#sub").on("click", function(){
		mysubmit(event);
})
 

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
 
 
 function goback(){
	 		  location.href="${cPath}/project/${pCode}/issue/issueList"; 
	 }
 
 
 $("#search").on("click" , function(){
	 
	 /*
	  var popUrl ="${cPath}/project/${pCode}/work/create/workSearch";
     var popOption = "width=1300px, height=800px, resizable=no, location=no, top=300px, left=300px;"
        window.open(popUrl,"상위 일감 검색 ",popOption);  
	 */
	 
	 var popUrl ="${cPath}/project/${pCode}/issue/create/IssueSearch";
     var popOption = "width=1300px, height=800px, resizable=no, location=no, top=300px, left=300px;"
        window.open(popUrl,"이슈 일감 검색 ",popOption);    
		 
 });

 <c:if test="${command eq 'UPDATE'}">
 	///////파일 삭제 버튼 누르면 파일 숨김 처리되고 delete 파일에 들어감 
 	
 	$(".sizing").on("click" ,".del" , function(){
 		let fileNo = $(this).data("delfileno")
 		issueForm.append(
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
 		$("#workCodeId").val("");
 		$("#workSjId").val("");
 		 });
 		 
		
	 
  	
 	 function makeFileBtn(file){
 		 /*
 		 생성될 경우 넘겨질 vo의 수를 증가 시켜줌
 		 */
 	if( $("p").hasClass("fileName")==true){
 		 				  
 		 				 let fileName = $(".fileName").last();
 		 				 
 		 				 let no =	parseInt($(fileName).data("no")) +1 ;
 		 /*
 		 workFileList는 workVO에 파일을 담기위해 추가한 workFile을 담기위한 List 입니다.
 		 workFileList 는 각자의 파일 명을 담는 VO의 파일 명 변수 를 입력하시면 됩니다  
 		 workFileList[" + no +"].workFileSavedNm" 
 		.workFileSavedNm 의 명은 각 파일 vo의 변수명을 의미합니다 저장명과 파일이름 파일 저장 일자 삭제 여부 그리고 테이블에는 없지만 TEMP 여부를 담을 변수명을추가해주세요h
 		 				 
 		 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileSavedNm").prop("value", file.fileSavedNm)
 		 */
 		 				return	$("<p class='fileName'>").append(
 		 						$("<span >").html(file.fileNm+ " &nbsp; &nbsp;")
 		 								   .append(
 		 						$("<input type='hidden'>").prop("name","issueFileList[" + no +"].issueFileSavedNm").prop("value", file.fileSavedNm).prop("id" , file.fileSavedNm), 
 		 						 $("<input type='hidden'>").prop("name","issueFileList[" + no +"].issueFileRgsde").prop("value", file.fileRgsde),
 		 						 $("<input type='hidden'>").prop("name","issueFileList[" + no +"].issueFileNm").prop("value", file.fileNm),
 		 						 $("<input type='hidden'>").prop("name","issueFileList[" + no +"].issueFileDelAt").prop("value",'0').prop("class" , "attatchtDelAt"),
 		 						 $("<input type='hidden'>").prop("name","issueFileList[" + no +"].issueFiletempAt").prop("value",'0').prop("class" , "attatchtemptAt") //이대로 업데이트 시 템프파일 아님으로 업데이트 됨
 		 								   ).append(
 		 										   $("<button type='button' >").prop("class","deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
 		 								   	)
 		 								).data("no" ,  no);
 		 			  
 	}else{
 		 				 return	$("<p class='fileName'>").append(
 		 						$("<span >").html(file.fileNm+ " &nbsp; &nbsp;")
 		 								   .append(
 		 					     $("<input type='hidden'>").prop("name","issueFileList[0].issueFileSavedNm").prop("value", file.fileSavedNm).prop("id" , file.fileSavedNm), 
 		 						 $("<input type='hidden'>").prop("name","issueFileList[0].issueFileRgsde").prop("value", file.fileRgsde),
 		 						 $("<input type='hidden'>").prop("name","issueFileList[0].issueFileNm").prop("value", file.fileNm),
 		 						 $("<input type='hidden'>").prop("name","issueFileList[0].issueFileDelAt").prop("value",'0').prop("class" , "attatchtDelAt"),
 		 						 $("<input type='hidden'>").prop("name","issueFileList[0].issueFiletempAt").prop("value",'0').prop("class" , "attatchtemptAt")
 		 								   ).append(
 		 										   $("<button type='button'>").prop("class","deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
 		 								   	)
 		 								).data("no" , "0")
 		 			 		}
 		 
 		 
 		 
 	 			  }
 	 			
 	 			  
 	 
 	  
 	  	$(tbody).on("click", ".deleteBtn" , function(){
 	  			/* console.log($(this).parents("tr")[0]) */
 	  		 let  value = $(this).parents("p")[0]
 	  		 $(value).find(".attatchtemptAt").val("1") //템프파일 여부 1 로 변경하여 템프 파일으로 설정함
 	  		 $(value).find(".attatchtDelAt").val("1") // 파일 삭제 여부를 1로 변경하여 파일 삭제된 파일로 설정함
 	 		 $(value).attr('style', "display:none;");
 	  	});
 	 		  
 	  	

 	  	function mysubmit(event){
 	  		
 	  		var issueCnArea =	document.getElementById("issueCnArea");
 	  			var editorContent =  CKEDITOR.instances.issueCnArea.getData(); 
 	  			editorContent = editorContent.replace(/<br\/>/ig, "\n");
 	  			editorContent = editorContent.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");

 	  			editorContent = editorContent.replace(/(<([^>]+)>)/gi, "");
 	  			editorContent = editorContent.replace(/&nbsp;/gi,"");

 	  			$(issueCnArea).val(editorContent)
 	  		var sendOk = false;	
 	  		if(editorContent.trim() =='' ||editorContent.trim().length ==0){
 	  		     
 	  		    $(issueCnArea).focus();
 	  		    
 	  		    Swal.fire({
 	  				 title: "필수 항목 오류",
 	  				  text: "내용이 비어있습니다",
 	  				  icon: "error",
 	  				  button: "OK",
 	  				}) 
 	  				
 	  		}else {
 	  			
 	  			let code = $("#workCodeId").val();
 	  			if(code.trim() =='' ||code.trim().length ==0){
 	  			    Swal.fire({
 	 	  				 title: "필수 항목 오류",
 	 	  				  text: "이슈 발생 일감이 지정되지 않았습니다",
 	 	  				  icon: "error",
 	 	  				  button: "OK",
 	 	  				})
 	  			}else{
 	  				  sendOk = true;	
 	  			}
 	  		}
 	  			
 	  		if(sendOk == true){
 	  		$(issueForm).submit();	
 	  		}
 	  		
 	  	}
 	  	 

 	  	CKEDITOR.replace('issueCn', {
 	  		
 	  		//
 	  		width :'1100px',	
 	  	    language : 'en',
 	  	 	 filebrowserImageUploadUrl:"${cPath}/project/${pCode}/issue/create/uploadImage?type=Images",  
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