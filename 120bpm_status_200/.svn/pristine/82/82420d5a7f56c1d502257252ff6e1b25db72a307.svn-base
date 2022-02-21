<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script src="${cPath }/resources/js/jquery-validation-1.19.3/jquery.validate.js"></script>
<link href="${cPath }/resources/css/myAccount.css" rel="stylesheet" type="text/css">

<security:authentication property="principal.adaptee"
			var="authMember" />
<button id="updateCareer" type="button" class="btn updateBtn float-right" data-career="${careerList }">경력수정</button>  
<div class="x_panel">  
	<div class="x_title"> 
		<h2>  
			<span>경력사항 관리</span>
		</h2> 
		<div class="clearfix"></div>   
	</div>  
	<div id="inputDiv"  class="x_content" style="display: block;">
	<div>
		<div id="scrollDiv" >  
		<hr>
		<table id="table2" class="table">   
			<c:if test="${not empty careerList }"> 
				<c:forEach items="${careerList }" var="career"  varStatus="stat">
					 <tr>         
				      <th rowspan="5" class="text-center">${stat.index + 1 }</th> 
				    </tr>   
				    <tr>
				      <th class="ths">참여사업명 </th>
					      <td colspan="3">${career.partcptnBiz } </td> 
					    </tr>  
					    <tr>
					      <th >참여시작일자 </th>
					      <td class="right-border setDate">${career.beginde }      
					      </td>  
					      <th >참여종료일자 </th>
					      <td class="setDate">${career.endde }   
					      </td> 
					    </tr> 
					     <tr> 
					      <th  class="ths">발주처 </th>
					      <td  class="right-border">${career.orntNm }
					      </td>
					      <th  class="ths">근무처 </th>
					      <td >${career.wrkplcNm }
					      </td>
					    </tr >
					    <tr>
					      <th  class="ths">직위 </th>
					      <td  class="right-border">${career.ofcpsNm }
					      </td>
					      <th  class="ths">수행업무 </th>
					      <td>${career.atnddu } 
					      </td> 
					    </tr> 
				</c:forEach>			
			</c:if>
		</table>
		</div>
	</div>
</div>   
</div>

  

<!-- The Modal --> 
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">경력사항 수정</h5>
	      	<div class="btnFixDiv">
		      <button id="careerPlusBtn" type="button" 
		      class="btn insertBtn float-right  ">경력 추가</button>
	      	</div>  
      </div>  
	      <div class="modal-body" >     
			  <form id="updateCareerForm">
	  
		      </form>
	      </div> 
      <div class="modal-footer">  
      	<button type="reset" class="resetBtn btn" >
			<img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"> 
		</button>    
        <button id="deleteCareerBtn" type="button" class="btn deleteBtn">삭제</button>
        <button id="updateCareerBtn" type="button" class="btn btbtn">저장</button>
        <button type="button" class="btn gobackBtn btn-close" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>   
  </div> 
</div>

<form id="deleteCareerForm" action= "${cPath }/mypage/myCareer" method="post">
 
</form>

<form id="passCheckForm" action="${cPath}/mypage/accountCheck" method="post"> 
	<div id="popUp_11" class="popCmmn">
	  <div id="popBG" class="popBg" data-num="11"></div> 
		<div class="popOuterBox">         
<!-- 		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >✖</button> -->
		  <div class="popInnerBox">   
		    <div class="popHead">본인 확인</div>  
		    <div class="popBody">  
		    	<span>계속하려면 먼저 본인임을 인증하세요.</span><br> 
		    	<input id="inputPass" type="password" name="memberPass" class="holderInput" placeholder="비밀번호 입력" required>
		    	<div><input id="showPass" type="checkbox" >비밀번호 표시</div>
		    </div>   
		    <div class="popFoot">    
		      <button id="submitBtn"  class="checkBtn btn btbtn" >확인</button>     
		    </div>  
		  </div>     
	  </div>
	</div>  
</form>    
<script>
	$(function(){
		//본인확인 팝업 
	<c:if test="${empty check }">
		showPopup();  
		$("#popBG").css("pointer-events", "none");
	</c:if>
	<c:if test="${not empty deleteResultMsg }">
		if ("${deleteResultMsg}" == "OK") {
			Swal.fire({
				title : "SUCCESS",
				text : '${authMember.memId} 님의 경력사항이 삭제되었습니다.',
				icon : 'success',
				confirmButtonText : '확인'
			})
		}else{
			Swal.fire({
				title : "SERVER ERROR", 
				text : "다시 시도해주세요.", 
				icon : 'error',
				confirmButtonText : '확인'
			})
		}
	</c:if>
		//경력사항 저장 
		var myCareer = {};
		var newCareer = {};
		var myCareerListArray = [];
		var newCareerListArray = [];
		var params = {};
		$("#updateCareerBtn").click(function(){
			$(this).data('clicked', true);
			let exchecked = $(".already input[type=checkbox]:checked");
			let newchecked = $(".new input[type=checkbox]:checked");
			let checkedLen = exchecked.length + newchecked.length;
			if(checkedLen == 0){  
				Swal.fire({    
					title : "PLEASE CHECK",
					text : "저장할 경력사항을 선택해주세요",
					icon : 'info',    
					confirmButtonText : '확인'
				})
				return false;
			}
		 
	 		if(exchecked.length > 0){ 
	 			$.each(exchecked, function(i, ex){
	 				let alreadyInput = $(ex).parents(".already").find("input:not(:checkbox)");
	 				myCareer = {};
	 				$.each(alreadyInput, function(j, input){
	 					myCareer[$(input).attr("name")] = $(input).val();
	 				});  
	 				myCareerListArray.push(myCareer);
	 			});   
	 		}else{ 
	 			$(".already").find("input").attr("name", "");
	 		}
	 		if(newchecked.length > 0){ 
	 			$.each(newchecked, function(i, newChk){
	 				let newInput = $(newChk).parents(".new").find("input:not(:checkbox)");
	 				newCareer = {};
	 				$.each(newInput, function(j, input){ 
	 					newCareer[$(input).attr("name")] = $(input).val();
	 				});  
	 				newCareerListArray.push(newCareer);  
	 			});   
	 		}else{
	 			$(".new").find("input").attr("name", "");
	 		}
			console.log("myCareer :"+myCareer); 
			console.log("newCareerListArray :"+newCareerListArray); 
			if(myCareerListArray.length > 0){
				params["myCareerList"] = myCareerListArray;
			}
			if(newCareerListArray.length > 0){
				params["newCareerList"] = newCareerListArray;
			}
			console.log("params :"+params);
			console.log(JSON.stringify(params)); 
			 
			$.ajax({     
				url : "${cPath }/mypage/myCareer",
				dataType : "json",    
			 	method : "post",       
			 	contentType:'application/json; charset=utf-8',
			    data : JSON.stringify(params),     
			 	success : function(message) {   
			 		console.log(message);  
			 		myCareer = {};  
			 		newCareer = {}; 
			 		myCareerListArray = [];
			 		newCareerListArray = [];
			 		params = {}; 
			 		if (message == "OK") {
			 			Swal.fire({ 
			 				title : "SUCCESS",
			 				text : "${authMember.memId} 님의 경력사항 정보가 업데이트 되었습니다.",
			 				icon : 'success',  
			 				confirmButtonText : '확인',
			 				closeOnClickOutside : false
			 			}).then(function(){ 
			 				location.reload();
			 			});
			 		} else if(message == "FAIL"){ 
			 			Swal.fire({
			 				title : "SERVER ERROR",
			 				text : "다시 시도해주세요.",
			 				icon : 'error',
			 				confirmButtonText : '확인'
			 			})
			 		}else{  
			 			Swal.fire({  
			 				title : "필수정보 미입력",
			 				text : "입력값이 유효하지 않습니다.",
			 				icon : 'error',
			 				confirmButtonText : '확인'
			 			})
			 		}
			 	} ,
			 	error : function(xhr){
			 		console.log("실패 : " + xhr);
			 	}
			}); 
		});
		
		//경력사항 추가 테이블 생성
		$("#careerPlusBtn").click(function(){
			careerClone = $(".already").last().clone();
			$(careerClone).removeClass("already"); 
			$(careerClone).addClass("new"); 
// 			var cInputs = $(careerClone).find("input"); 
			var cInputs = $(careerClone).find("input[type=text]"); 
			var dates =$(careerClone).find("input[type=date]"); 
			var ths = $(".ths");     
			console.log(cInputs) 
			console.log(ths.length)
			$.each(cInputs, function(i, input){
				$(input).val("");  
				if($(input).attr("type")=="text"){  
					$(input).val("추가된 " + $(ths[i]).html()); 
				} 
				$(input).attr("value", "");
			}); 
			$.each(dates, function(i, date){
				$(date).val("");  
				$(date).attr("value", "");
			}); 
			$(careerClone).find(".selecting").find(":checkbox").prop("checked", false); 
			$("#updateCareerForm").append(careerClone); 
			$(careerClone).append($("<input>").attr({'type':'hidden', 'name':'memId', 'value' : '${mem.memId}'}));
			$(careerClone).append($("<input>").attr({'type':'hidden', 'name':'careerMatterNo', 'value' : '0'}));
			$(careerClone).find(".selecting").after($("<button type='button' class='btn deleteBtn minusBtn'>").html("ㅡ"));
		});   
		
		//경력사항 추가 테이블 삭제
		$("#updateCareerForm").on('click', '.minusBtn', function(){
			$(this).parents(".new").remove();  
		});
		//경력사항 폼 초기화
		$(".resetBtn").click(function(){  
			$("#updateCareerForm")[0].reset(); 
		});   
		   
		//경력사항 수정 모달 띄우기
		$("#updateCareer").click(function(){  
			exampleModal.modal('show',$(this).data("career"));
		}); 
		//경력사항 수정 모달 닫기
		$(".btn-close").click(function(){
			exampleModal.modal('hide');
		});   
		
		//경력사항 수정 모달창
		let exampleModal = $("#exampleModal").modal({
			show:false
		}).on('show.bs.modal', function(event){
			$.ajax({    
				url : "${cPath}/mypage/myCareer",
			 	dataType : "json",  
			 	success : function(careerList) {
			 		$.each(careerList, function(i, career){ 
			 			trTags = [];  
			 			trTags.push($("<tr class='hrtr'>").append(
			 					$("<th>").html("※참여사업명"), 
			 					$("<td colspan='3'>").append(makeInput(career.partcptnBiz,'partcptnBiz','text'), 
			 							makeInput(career.careerMatterNo,'careerMatterNo', 'hidden'),        
			 							makeInput(career.memId,'memId', 'hidden'),         
			 							$("<button>").attr({'type':'button', 'class' : 'selecting btn gobackBtn'}).html("선택 ").css('float', 'right')))); 
			 			trTags.push($("<tr>").append(       
			 					$("<th>").html("참여시작일자"),   
			 					$("<td>").append(makeInput(career.beginde,'beginde', 'date')),    
			 					$("<th>").html("참여종료일자"),     
			 					$("<td>").append(makeInput(career.endde,'endde', 'date'))));
			 			trTags.push($("<tr>").append(  
			 					$("<th>").html("※발주처"),   
			 					$("<td>").append(makeInput(career.orntNm,'orntNm', 'text')), 
			 					$("<th>").html("※근무처"),    
			 					$("<td>").append(makeInput(career.wrkplcNm, 'wrkplcNm','text'))));
			 			trTags.push($("<tr>").append( 
			 					$("<th>").html("※직위"),     
			 					$("<td>").append(makeInput(career.ofcpsNm,'ofcpsNm', 'text')),
			 					$("<th>").html("수행업무"),  
			 					$("<td>").append(makeInput(career.atnddu,'atnddu', 'text'))));  
			 			exampleModal.find("#updateCareerForm").append($("<table class='table already careerTable' >").html(trTags)); 
			 		});  
			 		$(".selecting").append($("<input>").attr('type', 'checkbox'));
			 		      
			 		  
			 	},     
			 	error : function(errorResp) {
			 	alert(errorResp.status) 
			 	} 
			});   
		}).on('hidden.bs.modal', function(){ 
			exampleModal.find(".careerTable").remove();
		});   
		    
		function makeInput(value, name, type){
			if(type=='checkbox'){ 
				name = "";
			}
			return $("<input>").attr({    
				'type':type, 'name' : name, 'value': value 
			});
		} 
		 
		  //경력사항 모달창 validate
		  $("#updateCareerForm").validate({
				onkeyup : function(element){
				 $(element).valid();
			 } , 
			       
			 rules : { 
				 partcptnBiz : {
					 required : true
				 },
				 orntNm : { 
					 required : true
				},  
				wrkplcNm : { 
					required : true
				},
				ofcpsNm : { 
					required : true 
				}
			 },
			 
			 messages : {
				 partcptnBiz: { 
			    	required : "참여사업명은 필수 입력입니다."
				},  
				orntNm:{
					required:"발주처는 필수 입력사항입니다."  
				},   
				wrkplcNm:{   
					required:"근무처는 필수 입력사항입니다."
				}, 
				ofcpsNm:{  
					required : "직위는 필수 입력사항입니다."
				} 
			 }, 
			 
//	 		invalidHandler: function(validator){ //입력값이 잘못된 상태에서 submit 할때 호출
//	 			var errors = validator.numberOfInvalids();
//	 			if (errors) {  
//	 				Swal.fire({   
//	 					text : validator.errorList[0].message,
//	 					icon : 'warning',
//	 					confirmButtonText : '확인'
//	 				})   
//	 				validator.errorList[0].element.focus(); 
//	 			} 
//	 		}
		  });
		  
		  
		  //경력사항 삭제 
		  $("#deleteCareerBtn").on("click",function(){
			  let exchecked = $(".already input[type=checkbox]:checked");
			  let newchecked = $(".new input[type=checkbox]:checked");
			  let checkedLen = exchecked.length + newchecked.length;
			  if(checkedLen == 0){  
					Swal.fire({    
						title : "PLEASE CHECK",
						text : "삭제할 경력사항을 선택해주세요",
						icon : 'info',     
						confirmButtonText : '확인'
					})
					return false;
				}
			  if(exchecked.length > 0){
				  $(exchecked).each(function(i, ex){
					 careerNos = $(ex).parent().siblings("input[name='careerMatterNo']").val();
					 $("#deleteCareerForm").append($("<input type='hidden' name='careerNos' value='"+careerNos+"'>"));
				  });  
				  $("#deleteCareerForm").append($("<input type='hidden' name='memId' value='${authMember.memId}'>"));
				  $("#deleteCareerForm").submit();   
			  }else{   
				  $(newchecked).each(function(i, ne){
					  $(ne).parents(".new").remove();
				  });  
			  } 
		  });
		  
		  
		  
		  
			//비밀번호 표시
				$("#showPass").click(function(){
					if($(this).is(':checked')){
						$("#inputPass").attr('type', 'text');
					}else{ 
						$("#inputPass").attr('type', 'password');
					}
				});
				
				//비밀번호 정규식(한글 X)  
				$("#inputPass").on("blur keyup", function() {
					$(this).val($(this).val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ''));
				}); 
				 
				//비밀번호 공백 제거
				$("#submitBtn").click(function(e){
					let pass = $.trim($("#inputPass").val());
					$("#inputPass").val(pass);  
				}); 
				
				//비동기 본인확인
				$("#passCheckForm").ajaxForm({
					dataType : 'text', 
					success : function(result){ 
						if(result=='OK'){    
							$('#popUp_11').fadeOut(200);
							<c:if test="${empty check }">
								<c:set var="check" value="ok" scope="session"/> 
							</c:if>
						}else if(result=='FAIL'){
							Swal.fire({
								title : '본인확인실패',
								text : '비밀번호가 일치하지 않습니다.',
								icon : 'error',
								confirmButtonText : '확인'
							}).then((result)=> {
								 location.href = "${cPath}/mypage";
							});  
						}    
					}     
				}); 
				
			  
		});//$function끝
			 
		//팝업 세팅
		function showPopup() {
		 
//		 	//팝업 열기
			 var dataNum = $('#popBG').attr('data-num');
				      
			 $('#popUp_'+ dataNum).fadeIn(200);
		 
			//팝업 닫기    
			$('#popBG, .popCloseBtnCmmn').on('click', function() {
				 $("#inputPass").val("");  
				 var clickNum = $(this).attr('data-num');
				 $('#popUp_'+clickNum).fadeOut(200);
			})
		  
		}   	  
</script>