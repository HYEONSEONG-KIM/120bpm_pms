<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<link rel="stylesheet" href="${cPath }/resources/css/settings.css">
  
<jsp:useBean id="now" class="java.util.Date" /> 
<fmt:formatDate value="${now }" pattern="YYYY-MM-dd" var="today1"/>
<fmt:formatDate value="${now }" pattern="YYYY/MM/dd" var="today2"/>
<fmt:formatDate value="${now }" pattern="yyyy.MM.dd" var="today3"/>
<fmt:formatDate value="${now }" pattern="MM/dd/yyyy" var="today4"/>
<fmt:formatDate value="${now }" pattern="yyyyMMdd" var="today5"/>
<fmt:formatDate value="${now }" type="time" pattern="HH:mm" var="now1"/>
<fmt:formatDate value="${now }" type="time" pattern="HH:mm:ss" var="now2"/>
<fmt:formatDate value="${now }" type="time" timeStyle="short" var="now3"/>
<security:authentication property="principal.adaptee" var="authMember"/>
<div class="outer">
		<div class="x_panel col-md-6">      
			<div class="x_title mb-5">  
				<h2>  
					표시방식 설정<small>display setting</small> 
				</h2>
				<div class="clearfix"></div> 
			</div> 
			<div id="inputDiv" class="x_content ml-3 mr-3"  style="display: block;">
				<div>
					<label>날짜 표시 형식</label> 
					<select name="1" data-detailno="0"  class="value1">  
						<option value="yyyy-MM-dd">${today1 }</option> 
						<option value="yyyy/MM/dd">${today2 }</option>
						<option value="yyyy.MM.dd">${today3 }</option>
						<option value="MM/dd/yyyy">${today4 }</option>  
						<option value='yyyyMMdd'>${today5 }</option>
					</select>	  
				</div> 
				 
				<div> 
					<label>시간 표시 형식</label> 
					<select name="2" data-detailno="0"  class="value2">  
						<option value="HH24:MI">${now1 }</option>
						<option value="HH24:MI:SS">${now2 }</option>
						<option value="AM HH:MI">${now3 }</option> 
					</select>		   
				</div>   
				<div> 
					<label>사용자 표시 형식</label>
					<select name="3" data-detailno="0"  class="value3">    
						<option value="firstname_lastname">${authMember.memFnm} ${authMember.memLnm}</option>
						<option value="firstname">${authMember.memFnm}</option> 
						<option value="lastname_firstname">${authMember.memLnm} ${authMember.memFnm}</option>
						<option value="lastnamefirstname">${authMember.memLnm}${authMember.memFnm}</option>
						<option value="username">${authMember.memId}</option>
					</select>	
				</div>
			</div> 
  		 	<button  id="save" type="button" class="btn insertBtn float-right">저장 </button>
		</div>
</div>
<form id="settingForm" action="${cPath }/admin/settings" method="post">  
<input type="text" name="pagename" value="display">     
<input type="text" name="setupCode" value=${setupCode }>   
<input type="text" name="setupDetailList[0].setupCnNo" value="1">
<input type="text" name="setupDetailList[0].setupValue"  class="value1"> 
<input type="text" name="setupDetailList[0].setupDetailNo" value="0">
<br>
<input type="text" name="setupDetailList[1].setupCnNo" value="2"> 
<input type="text" name="setupDetailList[1].setupValue"  class="value2">  
<input type="text" name="setupDetailList[1].setupDetailNo" value="0">  
<br>  
<input type="text" name="setupDetailList[2].setupCnNo" value="3"> 
<input type="text" name="setupDetailList[2].setupValue"  class="value3">  
<input type="text" name="setupDetailList[2].setupDetailNo" value="0">  
</form> 
<script>
<c:if test="${not empty setupDetailList }">
<c:forEach items="${setupDetailList }" var="setupDetail"> 
	options = $("#inputDiv").find(".value${setupDetail.setupCnNo} option");
	$.each(options,function(i, option){ 
		if($(option).val()=='${setupDetail.setupValue}'){
			$(option).prop("selected", true);
		}
	});
</c:forEach>
</c:if>

$("#save").click(function(){ 
	let val1 = $("#inputDiv select[class='value1']").val();
	let val2 = $("#inputDiv select[class='value2']").val();
	let val3 = $("#inputDiv select[class='value3']").val();
	  
	$("#settingForm input[class='value1']").val(val1);
	$("#settingForm input[class='value2']").val(val2); 
	$("#settingForm input[class='value3']").val(val3);
	    
	$("#settingForm").submit(); 
	
});   
</script>