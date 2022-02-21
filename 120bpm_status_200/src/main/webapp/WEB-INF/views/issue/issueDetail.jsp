<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.repArea{
height: 800px;
max-height:  800px;
min-height:  800px;
}

#repModifyForm{
display: none;
}

.comment-box{
overflow: auto;
height: 100px;
 
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
.section {
background-color: #F0F9FC;
}

.scroll{
overflow: auto; overflow-x:hidden;
height: 200px !important;
}

.minal{
width: 120px;
}
.wider{
width: 150px;
}

.insertBack{
display: none;
}
#issueCnArea{
min-height: 200px;
}

.notexist{
height: 148px;

}

</style>

</head>
<body>

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

<security:authentication property="principal.adaptee" var="authMember" />
<security:authentication property="authorities" var="authMemRoles" />
<script type="text/javascript" src="${cPath }/resources/js/common.js"></script>
<script type="text/javascript" src="${cPath }/resources/js/paging.js"></script>
<div class="container">
		<div class="row">
			 
			 
			 
				<table class="table test" id="details" >
				<tbody>
				 <tr>
			 			<th colspan="1"  class="code section" >프로젝트명</th>
						<th colspan="4" class="projectNm  tol"><span id="pName">${issue.prjctNm }</span></th>
						<td colspan="4"  class="btnArea">
						<button class="btn gobackBtn" onclick="goback()">이전으로</button>
						<c:choose>
					<c:when test="${authMember.memId eq issue.memId||authVO.author eq 'ROLE_PM' }">
							<button id="solute" class="btn btbtn">해결</button>
							<button id="issueUpdate" class="btn updateBtn controlBtn" data-gopage="${cPath }/project/${pCode}/issue/modify/${issue.issueNo}">수정</button>
							<button id="del" class="btn deleteBtn">삭제</button>
					</c:when>
					<c:otherwise>
					</c:otherwise>
			 </c:choose>
						
						</td>
			 	</tr>
				
		 
				
				<tr>
						<th colspan="1"  class="code section" >제목</th>
						<th colspan="9" class="sj"><span id="issueSj" class="tol">${issue.issueSj }</span></th>
				</tr>
			 	<tr>
						<th  class="section minal">해결 여부</th>
						<td  colspan="" class="category wider">${issue.soluteNm }&nbsp; &nbsp;</td>
						
						<th  class="section minal">작성자</th>
						<td  class="wider">${issue.memName  }</td>
						 
						<th  class="section minal">작성일</th>
						<td class="dates wider" >${issue.issueRgsde }</td>
						<c:url var="workPage" value="/project/${pCode}/workDetail/${issue.workCode}"></c:url>
						<th  class="section minal">일감 링크</th>
						<td class="link">
							<button class='btn btn-default border controlBtn' data-gopage="${workPage}"><i class="fa fa-link" aria-hidden="true"></i></button>
						</td>
						
						
					</tr>
					<tr >
					 	<th class="section upline" >내용</th>
						<td colspan="9">
						<div id="issueCnArea" class="contents"> 
						${issue.issueCn }
						</div>
						</td>
					</tr>
					<tr >
					 <th class="line section minal" colspan="1">첨부파일</th>
					 <td colspan="4">
					 <div class="scroll">
							  <c:forEach items="${issue.issueFileList }" var="issueFile">
							<c:if test="${not empty issueFile.issueFileCode }">
								<c:url value="/project/${pCode}/file/down/${issueFile.issueFileCode}" var="downloadURL">
										 </c:url>
									<p class='file'> 
										${issueFile.issueFileNm }<button type="button" data-downCode="${downloadURL }" class="btn btn-light fileDown"><i class="fa fa-download" aria-hidden="true"></i></button>
									</p>
							</c:if>
							</c:forEach>
									  
							 </div>
						 </td>
						  <th colspan="1"  class="section">일감 대상<br>관리자</th>
						<td colspan="5" class="add">
					 <c:set var="observerList" value="${issue.workObserverList }" />
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
													 </span>  ${observer.observerName}
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
			 </tbody>
			 
			 </table>
			 </div>
			 </div>
	<!-- 답글달 때 append clone  -->
<%-- <div class="replyRepInsertArea">
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
			<textarea class="form-control" name="issueRepCn" id="exampleFormControlTextarea1" rows="3"></textarea>
			<span class="right">
			<button type="button"  class="btn btn-dark mt-3 insertBtn ">등록</button>
		
			</span>
		    </li>
		</ul>
	</div>
</div>
				 <input type="hidden" name="memId" value="${authMember.memId}">
 				 <input type="hidden" name="prjctNo"  value="${pCode}">
 				 <input type="hidden" name="ctgryCode"  value="${issue.ctgryCode}">
 				 <input type="hidden" name="workCode"  value="${issue.workCode}">
 				 <input type="hidden" name="issueNo"  value="${issue.issueNo}">
 			
				  
				 </form>
	</div>	
	 --%>
	 
	<div class ="repArea">				
<div class="replyInsertArea">
	<form method="post" action="${pageContext.request.contextPath}/project/${pCode}/issue/reply/create"  class="replyInsertForm" >
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
			<textarea class="form-control" name="issueRepCn" id="exampleFormControlTextarea1" rows="3"></textarea>
			<span class="right">
			<button type="button" class="btn btn-dark mt-3 insertBtn ">저장</button>
			<button type="button"  class="btn btn-dark mt-3 gack insertBack ">취소</button>
			</span>
		    </li>
		</ul>
	</div>
</div>
				 <input type="hidden" name="memId" value="${authMember.memId}">
 				 <input type="hidden" name="prjctNo"  value="${pCode}">
 				 <input type="hidden" name="ctgryCode"  value="${issue.ctgryCode}">
 				 <input type="hidden" name="workCode"  value="${issue.workCode}">
 				 <input type="hidden" name="issueNo"  value="${issue.issueNo}">
 				 <input type="hidden" name="issueRepParent" >
 				<!--  <input type="hidden" name="issueRepParent" > -->
				  
				 </form>
	</div>	
	
			 
<div id="repModifyForm">
<form method="post" action="${pageContext.request.contextPath}/project/${pCode}/issue/reply/modify"  id="replyModifyForm" >
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
			<textarea class="form-control" name="issueRepCn" id="modifyRepCn" rows="3"></textarea>
			<span class="right">
			<button type="button" id="updateRep" class="btn btn-dark mt-3 updateBtn ">저장</button>
			<button type="button" id="updateBack" class="btn btn-dark mt-3 gack ">취소</button>
			</span>
		    </li>
		</ul>
	</div>
</div>
				 
 				  	<input type="hidden" name="issueRepNo" />
 				  	<input type="hidden" name="memId" value="${authMember.memId}"/>
				 </form>
				 
				 
			</div>
			
		<table id="replyTable" class="table ">
			 <thead class="repHead">
				<tr>	
					<!-- <th  class="text-center fixed">번호</th>
					<th colspan="3" class="text-center feedback">피드백</th>
					<th colspan="2" class="text-center fixedReply">작성자</th>
					<th colspan="2" class="text-center fixedReply">작성일자</th>
					<th  colspan="3" class="text-center fixedBtn">&nbsp;</th> -->
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
	
	
<form id="deleteForm" method="post" action="${cPath }/project/${pCode }/issue/remove">
 	<input type="hidden" id="deleteIsuees" name="issueNos" value="${issue.issueNo}">
 </form>
 
 <form id="soluteForm" method="post" action="${cPath }/project/${pCode}/issue/modify/result/solut">
 	<input type="hidden" id="soluteIssue" name="issueNos" value="${issue.issueNo}">
 </form>	
	
	
	<form id="issueRepDeleteForm" action="${cPath }/project/${pCode}/issue/reply/remove" method="post">
				<input type="hidden" name="issueRepNo" />
				<input type="hidden" name="memId" value="${authMember.memId}"/>
	</form>

 	   <form id="searchForm" action="${cPath }/project/${pCode }/issue/reply/${issue.issueNo}" method="get">
			<input type="hidden" name="page" />
  		</form> 
  		
 
	 <script type="text/javascript">

	 $(".controlBtn").on('click', function(){
	 		let gopage = $(this).data("gopage");
	 		if(gopage){
	 			location.href = gopage
	 		}
	 })
 
		 
	 
	  
	 function goback(){
	 	  
	 	var  preUrl = document.referrer 
	 	//Detail
	 	  if(preUrl==null || preUrl.indexOf("create")!=-1 || preUrl.indexOf("modify")!=-1 ||preUrl.indexOf("down")!=-1||preUrl.indexOf("Detail")!=-1){
	 		 location.href="${cPath}/project/${pCode}/issue/issueList"; 
	 	 }else{
	 		 history.go(-1); 
	 	} 
	 	 
	 }		 
		 

 ///==========================
	
	 $("#del").on("click" , function(){
		/*  let sendWorkId = [];#${issue.issueNo}"") */
		  $("#deleteForm").submit();
 
	 })
	 
	 
$("#solute").on("click" , function(){
	 
		  $("#soluteForm").submit();
})



 $("#soluteForm").ajaxForm({
	 dataType : "text",
	 success :function(resp){
		 if(resp == "OK"){
			 Swal.fire({
				  icon: "success",
				  title: "해결 처리 성공",
				  text: "해결 처리가 성공적으로 완료되었습니다.",
				  button :"확인",
				}).then(function(){
					 location.reload();
			    });
			 
		 }else {
				Swal.fire({
					  icon: "error",
					  title: "해결 처리 실패",
					  text:  "해결 처리에 문제가 생겼습니다.",
					  button :"확인",
					}).then(function(){
						 location.reload();
				    });
		 }
		 
	 }
	 
	 
 })

$("#deleteForm").ajaxForm({
		dataType : "text",
	 success :function(resp){
		 if(resp == "OK"){
			 Swal.fire({
				  icon: "success",
				  title: "삭제 성공",
				  text: "삭제가 성공적으로 완료되었습니다.",
				  button :"확인",
				}).then(function(){
					 location.href="${cPath}/project/${pCode}/issue/issueList"
			    });
			 
		 }else {
				Swal.fire({
					  icon: "error",
					  title: "삭제 실패",
					  text:  "삭제에 문제가 생겼습니다.",
					  button :"확인",
					}).then(function(){
						 location.reload();
				    });
		 }
		 
	 }
})

//파일 다운로드  
$("tbody").on("click" ,".fileDown"   , function(){
	 let target = $(this)[0];
	 var url = $(target).attr("data-downCode");
	 location.href= url;
}) 

	 
	 
	 
//=============댓글처리====================
	
let listBody = $("#listBody");
let pagingArea = $("#pagingArea");

$("#listBody").on("click" , ".insertBack" , function(){
  var form=$(this).closest('.replyInsertArea')
	var contents =  $(this).closest('td')//.closest('.comment-box')
	var reply = contents.find('.reply')
	$(reply).prop("disabled", false);
	$(form).remove(); 
	 
})

$("#listBody").on("click" , ".reply" , function(){
	$(this).prop("disabled", true);
	var contents =  $(this).closest('td')//.closest('.comment-box')
	var id =  $(this).closest('tr')//.closest('.comment-box')
	var parents = $(id).attr('id');
	var repClone = $( '.replyInsertArea' ).clone();
	var back = repClone.find('.insertBack')
	var setVal = repClone.find('[name="issueRepParent"]')
	$(setVal).val(parents)
	//(repClone.find('[name="issueRepParent"'])).val();
	repClone.appendTo(contents);
	$(back).show();
});
 
	
	$("#searchForm").paging().ajaxForm({
		dataType :"json",
		success :function(pagingVO){
			listBody.empty();
			pagingArea.empty();
			let repList = pagingVO.dataList;
			let trTags = [];
			if(repList && repList.length>0){
				$(repList).each(function(idx , rep){
					trTags.push(makeTrTag(rep));
				});	
				
				if(trTags.length<5){
					for(var i = 0 ;i<=7-(trTags.length); i++){
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
								$("<td>").attr("colspan" , "11").prop("class" , "text-center, notexist").html("현재 등록된 피드백이 없습니다")	
							)  
					) 

					for(var i = 0 ;i<4; i++){
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

	 		
	function makeTrTag(resp){
		
		 if("${authMember.memId}"==resp.repWriterId){
			 if(resp.issueRepDeleteAt==null){
							let btn = [] 
							let trTags = [] ;
							btn.push(
								$("<div >").append(
									$("<span class='text-left'>").html(resp.memName+"&nbsp;&nbsp;"),
									resp.issueRepRgsde + "&nbsp;&nbsp;",
									$("<span class='text-right'>").append(
											$("<button>").prop("class" , "btn  btn-default reply").html('<i class="fa fa-comments-o" aria-hidden="true"></i>'),
											$("<button>").prop("class", "btn  deleteBtn delete").html('<i class="fa fa-trash-o" aria-hidden="true"></i>'),
											$("<button>").prop("class", "btn  updateBtn modify").html('<i class="fa fa-pencil-square-o" aria-hidden="true"></i>')
												)	
									)	
								);
							
						return	$("<tr>").append(
							$("<td>").prop("colspan" , '11')
									 .append(btn,
											 $('<div class="comment-box">').append(
														$("<span>").html(resp.issueRepCn)	
												)
											 
									 )
							).prop("id" , resp.issueRepNo).prop("class" , 'repContents');
			 }else{
							let trTags = [] ;
						return	$("<tr>").append(
							$("<td>").prop("colspan" , '11')
									 .append( 
											 $('<div class="comment-box">').append(
														$("<span>").html(resp.issueRepCn)	
												)
											 
									 )
							).prop("id" , resp.issueRepNo).prop("class" , 'repContents');
			 }
		 }else{
			 if(resp.issueRepDeleteAt==null){
				 
			
			 let btn = [] 
			 btn.push(
						$("<div >").append(
							$("<span class='text-left'>").html(resp.memName+"&nbsp;&nbsp;"),
							resp.issueRepRgsde + "&nbsp;&nbsp;",
							$("<span class='text-right'>").append(
									$("<button>").prop("class" , "btn  btn-default reply").html('<i class="fa fa-comments-o" aria-hidden="true"></i>')
										)	
							)	
						);
			 return	$("<tr>").append(
						$("<td>").prop("colspan" , '11')
								 .append(btn,
										 $('<div class="comment-box">').append(
													$("<span>").html(resp.issueRepCn)	
											)
										 
								 )
						).prop("id" , resp.issueRepNo).prop("class" , 'repContents');
			 }else{
				 
					 return	$("<tr>").append(
								$("<td>").prop("colspan" , '11')
										 .append( 
												 $('<div class="comment-box">').append(
															$("<span>").html(resp.issueRepCn)	
													)
												 
										 )
								).prop("id" , resp.issueRepNo).prop("class" , 'repContents');
			 }	
			 
			 
		 }
		 
		 ///==========================================
			 
		 
		
	}			
				

$(".repArea").on("click" , '.insertBtn', function(){
	//var repForm = 	$(this).closest('form')
	var repForm = 	$(this).closest('.replyInsertForm')
	console.log(repForm)
	/* $(repForm).submit(); */
	$.ajax({
		url : "${pageContext.request.contextPath}/project/${pCode}/issue/reply/create",
		type :"post",
		data :$(repForm).serialize(),
		 success :function(resp){
			 if(resp=="OK"){
					Swal.fire({
						 title: "피드백 추가",
						  text:  "피드백 추가에 성공했습니다",
						  icon: "success",
						  button: "OK",
					}).then(function(){
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
		
	})
})

 
//댓글 수정========================================================
let repModifyForm =  $("#repModifyForm")
				
 $("#updateRep").on('click' , function(){
	 $("#replyModifyForm").submit();
	 
 })
 
$("#listBody").on("click" , ".modify", function(){

	 $(".replyInsertArea").hide();
	 repModifyForm.show();
	 var trId = $(this).closest("tr")
	 $(repModifyForm).find("[name='issueRepNo']").val(trId.prop("id"));
	 
	 trSpan= $(trId).find(".comment-box").find("span")
	 
	 var trCn  = trSpan.text();
	
	  $("#modifyRepCn").val(trCn)
	  document.getElementById('modifyRepCn').focus();
 })

	//===============================================
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
					 repModifyForm.hide();
					$(".replyInsertArea").show();
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
		 
		 
//================================================================
	
		//취소 버튼 클릭시  		 
$("#updateBack").on("click", function(){
	 
	 $("#repModifyForm").hide();
	 $("#modifyRepCn").val()
	 $(".replyInsertArea").show()
})
 
 ///댓글 삭제==============================================================
  $("#listBody").on("click" , ".delete", function(){
	    var trId = $(this).closest("tr");
 		$("#issueRepDeleteForm").find("[name='issueRepNo']").val(trId.prop("id"));
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
            	 $("#issueRepDeleteForm").submit();
             }
         })
    
 
 })
 ///=======================================================
	  	
$("#issueRepDeleteForm").ajaxForm({
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


 
	</script>
	 
</body>
</html>