<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${cPath }/resources/css/settings.css">
		<div class="x_panel"> 
			<div class="x_title">
				<h2> 
					메일알림 설정<small>mailNotification setting</small>
				</h2> 
				<div class="clearfix"></div>
			</div> 
			<div  id="inputDiv" class="x_content" style="display: block;">
				<div>
					<label>발신 메일 주소</label>
					<input  data-detailno="0" type="text"  class="value1"> 
				</div>
				<div>
					<label>이메일<br>시작 메세지</label> 
					<textarea rows="5" cols="50" class="value2">
					</textarea> 
				</div>    
				<div> 
					<label>이메일<br>끝 메세지</label> 
					<textarea rows="5" cols="50" class="value3">
					</textarea> 
				</div>    
				<div> 
					<label>메일알림 필요 작업</label>
					<div class="d-inline-block border align-top">
						<p class="float-right checkall"> 
						 	<input type="checkbox" id="checkall">전체선택/해제
						</p> 
						<hr>      
					 	<div class="d-inline-block mr-5">
					 		<p><input type="checkbox" data-detailno="0" class="value4 checkBox">일감 등록 시 담당자에게 알림</p>
					 		<p><input type="checkbox" data-detailno="1" class="value5 checkBox">일감 수정 시 담당자에게 알림</p>
					 		<p><input type="checkbox" data-detailno="2" class="value6 checkBox">일감 완료승인 시 담당자에게 알림</p>
					 	</div>
					 	<div class="d-inline-block"> 	
					 		<p><input type="checkbox" data-detailno="3" class="value7 checkBox">뉴스 게시 시 담당자에게 알림</p>
					 		<p><input type="checkbox" data-detailno="4" class="value8 checkBox">이슈 게시 시 담당자에게 알림</p>
					 	</div> 
					</div>
				</div>   
			</div>  
		</div>
		<button id="save" type="button" class="btn insertBtn ">저장 </button>
		  
<form id="settingForm" action="${cPath }/admin/settings" method="post"> 
<input type="text" name="pagename" value="mailNotice">   
<input type="text" name="setupCode" value=${setupCode }>   
<input type="text" name="setupDetailList[0].setupCnNo" value="1">
<input type="text" name="setupDetailList[0].setupValue"  class="value1"> 
<input type="text" name="setupDetailList[0].setupDetailNo" value="0">
<br>
<input type="text" name="setupDetailList[1].setupCnNo" value="2">
<textarea name="setupDetailList[1].setupValue" style="display:inline-block;"  class="value2"  rows="10" cols="60"></textarea>
<input type="text" name="setupDetailList[1].setupDetailNo" value="0">
<br>  
<input type="text" name="setupDetailList[2].setupCnNo" value="3">
<textarea name="setupDetailList[2].setupValue" style="display:inline-block;"  class="value3"  rows="10" cols="60"></textarea>
<input type="text" name="setupDetailList[2].setupDetailNo" value="0"> 
<br>
<c:forEach begin="3" end="7" varStatus="st"> 
	<input type="text" name="setupDetailList[${st.index }].setupCnNo" value="4">
	<input type="text" name="setupDetailList[${st.index }].setupValue"  class="value${st.index + 1}"> 
	<input type="text" name="setupDetailList[${st.index }].setupDetailNo" value="${st.index - 3 }"> 
</c:forEach>
</form>   
<script>  
var setupValue = null;
<c:if test="${not empty setupDetailList }">
<c:forEach items="${setupDetailList }" var="setupDetail"> 
	setupValue = "${setupDetail.setupValue}";
	if("${setupDetail.setupCnNo}" < 4){
		setupValue = setupValue.replaceAll("<br>","\n");
		$("#inputDiv .value${setupDetail.setupCnNo}").val(setupValue);
	}else{
		if(setupValue=="1"){
			$("#inputDiv .value${setupDetail.setupDetailNo + 4}").prop("checked", true);
		}
	} 
</c:forEach>      
</c:if>
 
$(function(){
	let checkBoxSize = $(".checkBox").size();
	let checkedSize = $(".checkBox:checked").size();
	if(checkBoxSize > checkedSize){
		$("#checkall").prop("checked", false);
	}else{  
		$("#checkall").prop("checked", true);
	} 

	$("#checkall").click(function(){
		if($(this).is(":checked")){  
			$("input[type='checkbox']").prop("checked", true);
		}else{
			$("input[type='checkbox']").prop("checked", false);
		}
	});
	
	$(".checkBox").click(function(){
		let checkBoxSize = $(".checkBox").size(); 
		let checkedSize = $(".checkBox:checked").size();
		if(checkBoxSize > checkedSize){
			$("#checkall").prop("checked", false);
		}else{  
			$("#checkall").prop("checked", true);
		}
	});
	
	
	$("#save").click(function(){ 
		let val1 = $.trim($("#inputDiv input[class='value1']").val());
		let val2 = $.trim($("#inputDiv textarea[class='value2']").val());
		val2 = val2.replaceAll("\r", "").replaceAll("\n", "<br>"); 
		let val3 = $.trim($("#inputDiv textarea[class='value3']").val());
		val3 = val3.replaceAll("\r", "").replaceAll("\n", "<br>"); 
		 
		if(val1!="") $("#settingForm input[class='value1']").val(val1);
		if(val2!="") $("#settingForm textarea[class='value2']").val(val2);
		if(val3!="") $("#settingForm textarea[class='value3']").val(val3);
		
		let checks = $(".checkBox");
		$.each(checks, function(i, check){ 
			index = $(check).data("detailno");
			ckclass = "value" + (index + 4);  
			if($(check).is(':checked')){ 
				$("#settingForm input[class='"+ckclass+"']").val("1");
			}else{ 
				$("#settingForm input[class='"+ckclass+"']").val("0");
			}
		});	 
		  
		$("#settingForm").submit(); 
	});
})
	
	
	
</script>