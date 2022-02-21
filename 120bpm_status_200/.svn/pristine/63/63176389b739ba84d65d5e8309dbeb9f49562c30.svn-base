<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
</style>	
<script src="${cPath }/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${cPath }/resources/css/settings.css">
<div class="outer">
		<div class="x_panel col-md-8">    
			<div class="x_title mb-5">
				<h2>  
					일반 설정<small>setting</small>  
				</h2>
				<div class="clearfix"></div>
			</div>   
			<div id="inputDiv"  class="x_content ml-3 mr-3" style="display: block;">
				<div> 
					<label>사이트 제목</label>
					<input data-detailno="0" type="text"  class="value1">  
				</div>
				<div>
					<div class="d-inline-block ">
						<label>웰컴 메세지</label> 
					</div> 
					<div id="taDiv" class="d-inline-block align-top">
						<textarea id="welcomeMsg" rows="10" cols="60"  class="value2">
						</textarea>    
					</div>
				</div>   
				<div>
					<label>작업내역 표시 기간</label>
					<select name="3" data-detailno="0" class="value3">  
						<option value="10">10</option>
						<option value="30">30</option> 
						<option value="50">50</option>
					</select><span> 일</span>		 
				</div>
				  
			</div>
		<button id="save" type="button" class="btn insertBtn float-right">저장 </button>
		</div> 
</div>		  
<form id="settingForm" action="${cPath }/admin/settings" method="post"> 
<input type="text" name="pagename" value="defaultSetting">   
<input type="text" name="setupCode" value=${setupCode }>   
<input type="text" name="setupDetailList[0].setupCnNo" value="1">
<!-- <input type="text" name="setupDetailList[0].setupCn" value="사이트 제목"> -->
<input type="text" name="setupDetailList[0].setupValue"  class="value1"> 
<input type="text" name="setupDetailList[0].setupDetailNo" value="0">
<br>
<input type="text" name="setupDetailList[1].setupCnNo" value="2">
<textarea name="setupDetailList[1].setupValue" style="display:inline-block;"  class="value2"  rows="10" cols="60"></textarea>
<input type="text" name="setupDetailList[1].setupDetailNo" value="0">
<br>  
<input type="text" name="setupDetailList[2].setupCnNo" value="3">
<input type="text" name="setupDetailList[2].setupValue"  class="value3">  
<input type="text" name="setupDetailList[2].setupDetailNo" value="0">  
</form> 
<script>
var setupValue = null;
<c:if test="${not empty setupDetailList }">
<c:forEach items="${setupDetailList }" var="setupDetail"> 
	if("${setupDetail.setupCnNo}"=="1"){
		$("#inputDiv .value${setupDetail.setupCnNo}").val('${setupDetail.setupValue}');
	}  
	if("${setupDetail.setupCnNo}"=="2"){ 
		setupValue = '${setupDetail.setupValue}'; 
		setupValue = setupValue.replaceAll("<br>","\n"); 
		$("#inputDiv .value${setupDetail.setupCnNo}").val(setupValue);
	} 
	if("${setupDetail.setupCnNo}"=="3"){
		options = $("#inputDiv").find(".value${setupDetail.setupCnNo} option");
		$.each(options,function(i, option){
			if($(option).val()=='${setupDetail.setupValue}'){
				$(option).prop("selected", true);
			}
		}); 
	}
</c:forEach>     
</c:if>


//비동기로 폼데이터 보내기 - 응답 결과 체크박스 checked하기
$("#save").click(function(){ 
// 	$("#timeSelect option:selected").addClass("picked");
	let val1 = $.trim($("#inputDiv input[class='value1']").val());
	let val2 = editor.getData();
// 	val2 = val2.replace(/<br\/>/ig, "\n");  
// 	val2 = val2.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
// 	val2 = val2.replace(/(<([^>]+)>)/gi, "");  
// 	val2 = val2.replace(/&nbsp;/gi,""); 
	val2 = $.trim(val2);
	val2 = val2.replaceAll("\r", "").replaceAll("\n", "<br>"); 
	let val3 = $("#inputDiv select[class='value3']").val();
	
	if(val1!="") $("#settingForm input[class='value1']").val(val1);
	if(val2!="") $("#settingForm textarea[class='value2']").val(val2);
	$("#settingForm input[class='value3']").val(val3);
	  
	$("#settingForm").submit(); 
});   
    

//ck에디터
var editor = CKEDITOR.replace("welcomeMsg", {
    language : 'en',  
    width : '100%',  
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