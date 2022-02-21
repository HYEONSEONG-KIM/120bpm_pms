<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/additional-methods.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" 
integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
	#editorList{
		width: 95%;
		background: #fcfcfc;
		display: grid;
		grid-template-columns : 1fr 1fr 1fr;
		margin: 2%;
		text-align: center;
		
	}
	.editor, .editorAdd{
		width: 80%;
		margin: 20px;
		float: left;
		box-shadow: 1px 2px 3px 1px #d5d7db;
		padding: 0 10px;
		border-radius: 20px;
		height: 220px;
		background: #ffffff;
	}
	.editorAdd img{
		width : 55px;
	 	border-radius: 50%;
		margin-top: 4.5rem;
		box-shadow: 3px 2px 2px grey;
	}
	.editor:hover, .editorAdd:hover{
		cursor: pointer;
		box-shadow: 3px 2px 2px grey;
	}
	#rule{
		margin-right : 3%;
		margin-bottom : 2%;
		font-size: 15px;
		font-weight: bold;
		float: right;
	}
	#wholeArea{
		margin-top: 4%;
	}
	.deleteEdit{
		float: right;
		margin-right : 10px;
		margin-bottom : 10px;
		font-size: 25px;
		color: #e667a4;
		
	}
</style>
<security:authentication property="principal.adaptee" var="authMember"/>

	<h1 style = "font-weight: bold;"><i class="fas fa-hands-helping"></i>피드룸 리스트</h1>
	<hr>
<div id = "wholeArea">
	<span id = "rule">※한 프로젝트에 1인당 3개까지 피드룸을 생성할 수 있습니다</span>
	<div id = "editorList">
		<c:if test="${not empty editList}">
			<c:forEach items="${editList }" var="edit">
				<div class = "editor" data-id = '${edit.editorCode}'>
					<hr>
					<h3 class = "goEditor"  title = '${edit.editorNm}'>
						${fn:length(edit.editorNm) > 12 ? fn:substring(edit.editorNm,0,12) += '...' : edit.editorNm}
					</h3>
					<hr>
					<p>생성자 : ${edit.memName}</p>
					<p>생성일자 : ${edit.createde}</p>
					<hr>
					<c:if test="${edit.memId eq authMember.memId }">
					<i  class = "fas fa-minus-circle deleteEdit" data-id = "${edit.editorCode}" ></i>
					</c:if>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${editCnt lt 3}">
			<div  class = 'editorAdd' id = "addEdit">
					<img alt="추가" src="${cPath }/resources/imgs/img/plusbutton.png">
			</div>
		</c:if>
	</div>
</div>
<!-- 코드에디터 추가 popup -->
<form id="addCodeEditor" > 
	<div id="popUp" class="popCmmn">
	  <div class="popBg" data-num="11"></div> 
		<div class="popOuterBox">         
		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >✖</button>
		  <div class="popInnerBox">  
		    <div class="popHead">코드에디터 피드룸 제목 설정</div>  
		    <div class="popBody">  
		    	<span>제목을 입력하세요(중복불가)</span><br> 
		    	<input  type="text" name="editorNm" class="holderInput inputPass" placeholder="피드룸 제목" id = "feddRoomCN" required>
		    </div>   
		    <div class="popFoot">    
		      <input type = "button" id="submitBtn"  class="checkBtn btn btbtn" value = "확인"> 
		    </div>  
		  </div>     
	  </div>
	</div>  
</form>



<script>
	$('.editor').on('click',function(){
			let editId = $(this).data('id');
 			location.href = "${cPath}/project/${pCode}/webIDE/editor/entrance/" + editId;
		
	})
	
	let addCodeEditorForm = $('#addCodeEditor');
	
	
	let validateOptions = {};
	
	validateOptions.rules={
			editorNm:{
 				remote : "${cPath}/project/${pCode}/webIDE/editor/duplCheck"
			}
		}
		validateOptions.messages={
			editorNm:{
				remote:"이미 존재하는 제목입니다",
				required : "필수 입력 값 입니다"
			}
		}
	
	let validated = addCodeEditorForm.validate(validateOptions);
	
	$('#submitBtn').on('click',function(){
		addCodeEditorForm.submit();
		
	})
	
	addCodeEditorForm.ajaxForm({
		url : '${cPath}/project/${pCode}/webIDE/editor/create',
		dataType : 'json',
		success : function(res){
			if(res == 'OK'){
				Swal.fire({
					title: '등록 완료 되었습니다',
			    	icon: 'success'
				}).then(function(){
						location.href = "${cPath}/project/${pCode}/webIDE/editor/List";								
				});
			}else if(res == 'FAIL'){
				Swal.fire({
					title: '실패...',
			    	icon: 'error'
				})
			}else if(res == 'PARAMOMISSION'){
				Swal.fire({
					title: '제목을 입력하여 주세요',
			    	icon: 'info'
				})
			}
		}
	})
	
	$('.deleteEdit').on('click',function(e){
		e.stopPropagation();
		
		let editCode = $(this).data('id');
		let url = "${cPath}/project/${pCode}/webIDE/editor/delete/" + editCode;
		
		 Swal.fire({
			  title: '해당 피드룸을 삭제하시겠습니까?',
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
				cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
				   $.ajax({
						url : url,
						dataType : "json",
						success : function(resp) {
							console.log(resp)
							if(resp == 'OK'){
								Swal.fire({
   									title: '삭제완료',
   						    		icon: 'success'
								}).then(function(){
									location.href = "${cPath}/project/${pCode}/webIDE/editor/List";								
								});
							}else if(resp == 'FAIL'){
								Swal.fire({
   									title: '삭제 실패',
   						    		icon: 'error'
								});
							}
				    			  
						},
						error : function(errorResp) {

						}

					}); 
			  }
			})
	})
	
	function setPop() {
		var popOpenBtn = $('.popOpenBtnCmmn');

		//팝업 열기
		$('#addEdit').on('click',function(event) {
			$('#feddRoomCN').val('')
			 $('#popUp').fadeIn(200);
		});

		//팝업 닫기   
		$('.popBg, .popCloseBtnCmmn').on('click', function() {
			 $('#popUp').fadeOut(200);
		});
	}
	setPop();
</script>