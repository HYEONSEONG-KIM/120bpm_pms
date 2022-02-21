<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="spring"%>
<link href="${cPath }/resources/css/myAccount.css" rel="stylesheet" type="text/css">
<style>
#settingForm{   
	margin-left: 15%; 
} 
.x_title {
	border-bottom: 3px solid #42B4E6;
}

.x_panel {
	width: 70%; 
} 

.x_content {
	font-size: large;
}

.x_content>div {
	margin-bottom: 30px;
}   

textarea {
	width: 100%;
	height: 80%;
	resize: none;
}

.contD {
	height: 300px;
}

#preImg {
	display: block; 
	max-width: 200px;   
	max-height: 500px;  
/* 	-ms-interpolation-mode: bicubic;  */
}   

#preview {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#preDiv {
	display: block;
	overflow: hidden;
	height: 200px;
	width: 200px;
} 
</style>    
<spring:eval expression="@appInfo.memberImagesUrl" var="memberImagesUrl"/> 
<form id="settingForm"  method="post" enctype="multipart/form-data"> 
	<div class="x_panel">
 		<div class="x_title mb-5"> 
			<h2>프로필 설정</h2>  
			<div class="clearfix"></div> 
		</div> 
		<div class="x_content mb-5" style="display: block;">
			<div class="row">   
				<div class="x_panel col-md-6 contD">   
					<div class="x_title mb-3">
					자기소개    
					</div>   
					<textarea class="value1"></textarea>   
				</div>     
				<div class="col-md-1 "></div>
				<div class="x_panel col-md-5 contD">      
					<div class="x_title mb-3">
					프로필 사진    
					</div>    	
					 <div id="preview">   
					 	<div id="preDiv">
							<img id="preImg" alt="프로필 이미지" src="${cPath }/resources/imgs/member/${mem.proflImgNm }"> 
					 	</div>
						<input type="file" name="profileImg" accept="image/*" onchange="readURL(this)" >
					</div>
				</div>
			</div>
			<div>
				<input type="checkbox" class="checkBox value2">메일 주소 숨기기 
				<small> *숨김처리 하는 경우 자신 외에 관리자만 볼 수 있음</small>
				
			</div>
			<div>
				<input type="checkbox" class="checkBox value3">휴대전화번호 숨기기
				<small> *숨김처리 하는 경우 자신 외에 관리자만 볼 수 있음</small>
			</div> 
		</div>
		<button id="save" type="button" class="btn btbtn float-right">저장 </button>  
	</div>  
	<input type="hidden" name="memSetList[0].setupCnNo" value="1">
	<textarea name="memSetList[0].setupValue" class="value1"  rows="20" cols="100"></textarea>
	<input type="hidden" name="memSetList[0].setupDetailNo" value="0">
	<br>  
	<input type="hidden" name="memSetList[1].setupCnNo" value="2">  
	<input type="hidden" name="memSetList[1].setupValue" class="value2">
	<input type="hidden" name="memSetList[1].setupDetailNo" value="0">
	<br>   
	<input type="hidden" name="memSetList[2].setupCnNo" value="3"> 
	<input type="hidden" name="memSetList[2].setupValue" class="value3">
	<input type="hidden" name="memSetList[2].setupDetailNo" value="0">
	<br>  
</form>
<script>

<c:if test="${not empty profileUpdateMessage}">
if ("${profileUpdateMessage}" == "OK") {
	Swal.fire({ 
		title : "SUCCESS",
		text : "${mem.memId} 님의 정보가 수정되었습니다.",
		icon : 'success',   
		confirmButtonText : '확인'
	})
} else if("${profileUpdateMessage}" == "FAIL"){ 
	Swal.fire({
		title : "SERVER ERROR",
		text : "다시 시도해주세요.", 
		icon : 'error',
		confirmButtonText : '확인'
	})
}
</c:if>
$(function(){
	//기존 프로필 설정
	<c:if test="${not empty memSetList }">
		<c:forEach items="${memSetList }" var="set">  
			if("${set.setupCnNo}"=="1"){
				setupValue = '${set.setupValue}'; 
				if(setupValue=="1") setupValue = "";
				setupValue = setupValue.replaceAll("<br>","\n"); 
				$(".value${set.setupCnNo}").val(setupValue);
			}else{
				if('${set.setupValue}'==1){
					$(".value${set.setupCnNo}").prop("checked", true);
				}else{
					$(".value${set.setupCnNo}").prop("checked", false);
				}
			}
			
		</c:forEach>     
	</c:if>

	
	$("#settingForm > .value1").hide();
	//프로필설정 폼에 입력
	$("#save").click(function(){ 
		var val1 = $.trim($(".x_content .value1").val());
		if(val1!=null || val1!=""){
			val1 = val1.replaceAll("\r", "").replaceAll("\n", "<br>"); 
			$("#settingForm > .value1").val(val1); 
		} 
		
		var val2 = $(".x_content .value2");
		if($(val2).is(':checked')){ 
			$("#settingForm > .value2").val("1");
		}else{  
			$("#settingForm > .value2").val("0");
		} 
		
		var val3 = $(".x_content .value3");
		if($(val3).is(':checked')){ 
			$("#settingForm > .value3").val("1");
		}else{  
			$("#settingForm > .value3").val("0");
		} 
		
		$("#settingForm").submit(); 
	});
});


//프로필 이미지 프리뷰  
function readURL(input){
	if(input.files && input.files[0]){
		const reader = new FileReader(); 
		reader.onload = function(e){
			$("#preImg").attr('src',e.target.result);
		} 
		reader.readAsDataURL(input.files[0]);
	}else{ 
		$("#preImg").attr('src', "");
	} 
}
</script>