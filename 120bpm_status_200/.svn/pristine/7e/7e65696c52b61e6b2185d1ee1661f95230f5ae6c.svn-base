<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${cPath }/resources/css/settings.css">
		<div class="x_panel"> 
			<div  class="x_title">
				<h2> 
					파일 설정<small>attatchments setting</small>
				</h2>
				<div class="clearfix"></div>
			</div> 
			<div id="inputDiv" class="x_content" style="display: block;">
				<div id="attatchSize">
					<label>첨부파일 최대크기</label>
					<input data-detailno="0" type="text" class="value1"> <span>KB</span>
				</div> 
				<div>
					<label>첨부파일<br>비허용 확장자</label> 
					<textarea data-detailno="0" rows="5" cols="50" class="value2">
					</textarea> <br> 
					<label></label>
					<h6>*구분자','를 이용해 여러 개의 값 입력 가능 
 							<br> ex : swf, ttf
					</h6>  
				</div>    
			</div>
		</div>
		<button id="save" type="button" class="btn insertBtn ">저장 </button>
		 
<form id="settingForm" action="${cPath }/admin/settings" method="post"> 
<input type="text" name="pagename" value="attatchments">   
<input type="text" name="setupCode" value=${setupCode }>
<input type="text" name="setupDetailList[0].setupCnNo" value="1">
<input type="text" name="setupDetailList[0].setupValue"  class="value1"> 
<input type="text" name="setupDetailList[0].setupDetailNo" value="0">
<br>
<input type="text" name="setupDetailList[1].setupCnNo" value="2">
<textarea name="setupDetailList[1].setupValue" style="display:inline-block;"  class="value2"  rows="10" cols="60"></textarea>
<input type="text" name="setupDetailList[1].setupDetailNo" value="0">
</form>
<script>
var setupValue = null;
<c:if test="${not empty setupDetailList }">
<c:forEach items="${setupDetailList }" var="setupDetail"> 
	setupValue = "${setupDetail.setupValue}";
	setupValue = setupValue.replaceAll("<br>","\n");
	$("#inputDiv .value${setupDetail.setupCnNo}").val(setupValue);
</c:forEach>     
</c:if>


$("#save").click(function(){ 
	$("#attatchSize small").remove();
	let val1 = $.trim($("#inputDiv input[class='value1']").val());
	let val2 = $.trim($("#inputDiv textarea[class='value2']").val()); 
	val2 = val2.replaceAll("\r", "").replaceAll("\n", "<br>"); 
	
	let reg = /^[0-9]+$/g;  
	if(val1!=""){  
		if(!reg.test(val1)){ 
			$("#attatchSize").append($(" <small>").text(" ※숫자만 입력 가능합니다.").css("color", "red"));
			return false;
		}else{ 
			$("#settingForm input[class='value1']").val(val1);
		}
	} 
	if(val2!="") $("#settingForm textarea[class='value2']").val(val2);
	 
	       
	$("#settingForm").submit(); 
});   
</script>