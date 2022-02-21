<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${cPath }/resources/js/jquery-validation-1.19.3/jquery.validate.js"></script>
<script src="${cPath }/resources/js/kakaomap.js"></script>
<link href="${cPath }/resources/css/myAccount.css" rel="stylesheet" type="text/css"> 
 
<form id="memInfoUpdateForm" action="${cPath }/mypage/myAccount" method="post">
<div class="x_panel">  
	<div class="x_title"> 
		<h2>  
			<span>개인정보수정</span>
		</h2> 
		<div class="clearfix"></div>
	</div>  
	<div id="inputDiv"  class="x_content" style="display: block;">
	<div>
		<div>  
		<hr>
		<table id="table1" class="table float-left">     
			<tr>
				<th>회원ID</th> 
				<td><input id="idInput" type="text" name="memId" value="${mem.memId}"  readonly/>
				<label id="memId-error" class="error" for="memId">${errors["memId"]}</label></td>
			</tr>
			<tr> 
				<th>비밀번호</th>   
				<td>***** <button type="button" class="btn insertBtn popOpenBtnCmmn float-right" data-num="12">비밀번호 변경</button></td>
			</tr>  
			<tr> 
				<th rowspan="2">성명</th>  
				<td><label class="waku">성</label><input id="memLnm" class="w1" type="text" name="memLnm" value="${mem.memLnm}" />
				<label id="memLnm-error" class="error" for="memLnm">${errors["memLnm"]}</label>
				</td>  
			</tr>     
			<tr> 
				<td><label class="waku">이름</label><input id="memFnm"  class="w3" type="text" name="memFnm" value="${mem.memFnm}" />
				<label id="memFnm-error" class="error" for="memFnm">${errors["memFnm"]}</label></td>  
			</tr> 
			<tr> 
				<th>이메일</th>   
				<td><input  class="w5" type="text" id="memEmail" name="memEmail" value="${mem.memEmail}" />
				<label id="memEmail-error" class="error" for="memEmail">${errors["memEmail"]}</label></td>
			</tr>
		</table> 
		<table id="table1_1" class="table float-right">   
			<tr>       
				<th>연락처</th> 
				<td><input id="memHp" class="w5" type="text" name="memHp" value="${mem.memHp}" /> 
				<label id="memHp-error" class="error" for="memHp">${errors["memHp"]}</label></td> 
			</tr> 
			<tr> 
				<th>우편번호</th> 
				<td><input id="sample6_postcode" class="w3" type="text" name="memZip" value="${mem.memZip}" />  
				<button type="button" onclick="sample6_execDaumPostcode()" class="btn btbtn">검색</button>
				<label id="memZip-error" class="error" for="memZip">${errors["memZip"]}</label></td>
			</tr> 
			<tr>   
				<th>주소</th>    
				<td><input id="sample6_address" class="w9" type="text" name="memAddr1" value="${mem.memAddr1}" />
				<label id="memAddr1-error" class="error" for="memAddr1">${errors["memAddr1"]}</label></td>
			</tr>   
			<tr>
				<th>상세주소</th> 
				<td><input id="sample6_detailAddress" type="text" name="memAddr2" value="${mem.memAddr2}" /> 
				<label id="memAddr2-error" class="error" for="memAddr2">${errors["memAddr2"]}</label></td>
			</tr>
		</table>
		</div> 
		
	</div>
</div>   
</div>
</form>  
<button id="save" type="button" class="btn btbtn float-right">개인정보저장</button> 

<form id="passUpdateForm" action="${cPath}/mypage/mypassword" method="post"> 
	<div id="popUp_12" class="popCmmn">
	  <div class="popBg" data-num="12"></div> 
		<div class="popOuterBox">         
			<button  class="popCloseBtnCmmn btn" data-num="12" type="button" >✖</button>
		  <div class="popInnerBox">  
		    <div class="popHead">비밀번호 변경</div>  
		    <div class="popBody">     
		    	<show>
		    		<span>계속하려면 먼저 본인임을 인증하세요.</span><br>  
			    	<input id="originPass" type="password" name="originPass" class="holderInput" placeholder="기존 비밀번호 입력" required>
					<div id="retry"  class="msg"></div>
			    	<br> <br> 
		    	</show>
			    <hide> 
			    	<span>비밀번호 안전성 : 영문자, 숫자, 특수문자를 포함한 8~16자리</span><br> 
			    	<input id="newPass" type="password" name="memPass" class="holderInput" placeholder="신규 비밀번호 입력" required>
			    	<div id="noreg"  class="msg"></div> 
			    	<input id="checkPass" type="password" class="holderInput" placeholder="신규 비밀번호 확인"  required>
			    	<div id="nomatch" class="msg"></div> <br> 
			    </hide>  
		    	<div><input id="textPass" type="checkbox" >비밀번호 표시</div>
		    </div> 
		    <div class="popFoot">     
		      <button id="changePasswordSubmitBtn"  class="checkBtn btn btbtn" >변경</button>     
		    </div>   
		  </div>      
	  </div>  
	</div>   
</form>    
<form id="oripassCheckForm" action="${cPath}/mypage/accountCheck" method="post"> 
<input type="hidden" name="memberPass" > 
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




	let dates = $('.setDate');
	$.each(dates, function(i, date){
		$(this).html(date.html);
	});
	
$(function(){
	//본인확인 팝업 
	showPopup();  
	$("#popBG").css("pointer-events", "none"); 
	
	<c:if test="${not empty updateResultMsg}">
	if ("${updateResultMsg}" == "OK") {
		Swal.fire({
			title : "SUCCESS",
			text : "${mem.memId} 님의 정보가 수정되었습니다.",
			icon : 'success',  
			confirmButtonText : '확인'
		})
	} else if("${failUpdateMsg}" == "FAIL"){ 
		Swal.fire({
			title : "SERVER ERROR",
			text : "다시 시도해주세요.",
			icon : 'error',
			confirmButtonText : '확인'
		})
	}else{ 
		Swal.fire({  
			title : "입력 오류",
			text : "입력값이 유효하지 않습니다.",
			icon : 'error',
			confirmButtonText : '확인'
		})
	}
	$('#popUp_11').fadeOut(200);
</c:if>
<c:remove var="updateResultMsg"/>
<c:if test="${not empty changeResultMsg}"> 
	if ("${changeResultMsg}" == "OK") {
		Swal.fire({ 
			title : "SUCCESS",
			text : "${mem.memId} 님의 비밀번호가 변경되었습니다.",
			icon : 'success',  
			confirmButtonText : '확인'
		})
// 		.then((result) => { 
// 	        if (result.isConfirmed) {
// 	            location.href = "${cPath}/mypage";
// 	        }   
// 	    })
	} else if("${changeResultMsg}" == "FAIL"){ 
		Swal.fire({
			title : "SERVER ERROR",
			text : "다시 시도해주세요.",
			icon : 'error',
			confirmButtonText : '확인'
		})
	}else{  
		Swal.fire({  
			title : "비밀번호 입력 오류",
			text : "입력값이 유효하지 않습니다.",
			icon : 'error',
			confirmButtonText : '확인'
		})
	}
	$('#popUp_11').fadeOut(200);
</c:if>  
<c:remove var="changeResultMsg"/>

	 //레이어팝업 세팅함수 호출
	  setPop();     
	  
	  $("#save").on("click", function(){ 
		  $("#memInfoUpdateForm").submit();
	  }); 
	  //개인정보 정규식 - $.validate 사용할때 key값은 input태그의 name값과 일치해야한다. 
	  $.validator.addMethod("regx", function(value, element, regexpr){
		 return regexpr.test(value); 
	  }); 
	  
	  $("#memInfoUpdateForm").validate({
			onkeyup : function(element){
			 $(element).valid();
		 } , 
		     
		 rules : { 
			 memEmail : {
				 required : true,
				email : true
			 },
			 memFnm : { 
				 required : true,
				 minlength : 1,
				 regx : /^[가-힣]*$/  
			},  
			memLnm : { 
				required : true,
				minlength : 1,
				regx : /^[가-힣]*$/  
			},
			memHp : { 
				required : true,
				regx:/^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/
			}
		 },
		 
		 messages : {
		    memEmail: {  
		    	required : "이메일은 필수 입력사항입니다.",
				email : "이메일 형식을 지켜주세요."  
			},     
			memFnm:{
				required:"이름은 필수 입력사항입니다.",
				minlength: $.validator.format( "1글자 이상 입력해주세요" ), 
				regx:"이름은 한글로만 작성 가능합니다."
			},   
			memLnm:{   
				required:"성은 필수 입력사항입니다.", 
				minlength: $.validator.format( "1글자 이상 입력해주세요" ),
				regx:"성은 한글로만 작성 가능합니다."
			}, 
			memHp:{  
				required : "연락처는 필수 입력사항입니다.",  
				regx: "형식에 맞게 입력해주세요 ex)010-1234-1234"
			} 
		 }, 
		  
// 		 errorElement : 'span',
// 		 errorClass : 'error', 
// 		 validClass : 'valid',   
// 		 errorPlacement: function (){ //validator는 기본적으로 validation 실패시 메세지를 우측에 표시하게 되어있다 원치않으면 입력해놓을것 ★안쓰면 에러표시됨★
// 				console.log("errorPlacement")
// 			}, 
		 submitHandler: function(form) { //모든 항목이 통과되면 호출됨 ★showError 와 함께 쓰면 실행하지않는다★
				form.submit();
			}, 
			invalidHandler: function(form, validator){ //입력값이 잘못된 상태에서 submit 할때 호출
				var errors = validator.numberOfInvalids();
				if (errors) { 
					Swal.fire({
						text : validator.errorList[0].message,
						icon : 'warning',
						confirmButtonText : '확인'
					})   
					validator.errorList[0].element.focus(); 
				} 
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
// 	var popupOpenBtn = $('.popOpenBtnCmmn');
 
// 	//팝업 열기
// 	popupOpenBtn.on('click', function() {
	 var dataNum = $('#popBG').attr('data-num');
		      
	 $('#popUp_'+ dataNum).fadeIn(200);
// 	})
  
	//팝업 닫기    
	$('#popBG, .popCloseBtnCmmn').on('click', function() {
		 $("#inputPass").val("");  
		 var clickNum = $(this).attr('data-num');
		 $('#popUp_'+clickNum).fadeOut(200);
	})
  
}   	 

	 
//비밀번호 표시
$("#textPass").click(function(){
	if($(this).is(':checked')){
		$("#originPass").attr('type', 'text');
		$("#newPass").attr('type', 'text');
		$("#checkPass").attr('type', 'text');
	}else{ 
		$("#originPass").attr('type', 'password');
		$("#newPass").attr('type', 'password');
		$("#checkPass").attr('type', 'password');
	}
});

$(".holderInput").on("keyup", function(){ 
	let inputval = $.trim($(this).val());
	if(inputval=="" || inputval==null) 
		$(this).val("");
});    
$("#originPass").on("keyup", function(){ 
	if($(this).val()=="" || $(this).val()==null) return false;
	$("#oripassCheckForm input").val($(this).val()); 
	$("#oripassCheckForm").submit(); 
});   
$("#oripassCheckForm").ajaxForm({
	dataType : 'text',  
	success : function(result){   
		if(result=='OK'){     
			$("hide").show();     
			$("#updateSubmitBtn").show();   
			$("show").hide();  
		}else if(result=='FAIL'){ 
			$("#originPass").css("border-color", "red");
			$("#retry").html($("<span>").html("틀린 비밀번호입니다."));
		}    
	}     
});   

$("#newPass").on("keyup",function(){ 
	let reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
	if($(this).val()=="" || $(this).val()==null) {
		$(this).css("border-color", "red"); 
		$("#noreg").html($("<span>").html("비밀번호를 입력해주세요."));
	}else if(!reg.test($(this).val())){
		$(this).css("border-color", "red");
		$("#noreg").html($("<span>").html("비밀번호 안전성에 부합하지 않습니다."));
	}else{    
		$(this).css("border-color", "lime");
		$("#noreg").empty();   
	}  
	$('#checkPass').val("");   
	$("#checkPass").css("border-color", "lightgrey");
	$("#nomatch").empty();  
});
 
$('#checkPass').on('keyup', function(){ 
	let val = $.trim($(this).val());
	if(val=="" || val==null) {
		$(this).css("border-color", "red"); 
		$("#nomatch").html($("<span>").html("비밀번호를 입력해주세요."));
	}else if(val!="" && val!=$("#newPass").val()){  
		$(this).css("border-color", "red");
		$("#nomatch").html($("<span>").html("비밀번호가 일치하지 않습니다."));
	}else if(val!="" && val==$("#newPass").val()){ 
		$(this).css("border-color", "lime");
		$("#nomatch").empty();    
	}
});

$("#changePasswordSubmitBtn").on("click", function(e){
	 e.preventDefault();
	 let returnfalse = false; 
	 let inputs = $("hide .holderInput");
	 $.each(inputs, function(i, input){  
		 if(input.value=="" || input.value==null) returnfalse = true;
		 $(input).css('border-color', function(i, color){
			if(color != 'rgb(0, 255, 0)') {
				returnfalse = true;
			}       
		 });       
	 });  
	 if(!returnfalse){
		 $("#passUpdateForm").submit();
	 }
});
 

function setPop() { 
  var popOpenBtn = $('.popOpenBtnCmmn');
     
  popOpenBtn.on('click',function(){ 
	  var clickNum = $(this).attr('data-num');
	  $('#popUp_'+clickNum).fadeIn(200);
  })
   
  $('#popbg, .popCloseBtnCmmn').on('click',function(){
	  $("hide").hide();    
	  $("#updateSubmitBtn").hide(); 
	  $("show").show();   
	  $(".msg").empty();    
	  $("#submitBtn").prop("disabled", true);   
	  $(".holderInput").css("border-color", "lightgrey").val("");
	  var clickNum = $(this).attr('data-num');
	  $('#popUp_'+clickNum).fadeOut(200);
  })
}


</script>