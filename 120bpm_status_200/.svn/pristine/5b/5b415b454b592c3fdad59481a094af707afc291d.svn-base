<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>경력사항추가</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!--   <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.19.3/jquery.validate.min.js"></script> -->
<%--   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script> --%>
<%--   <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-validation-1.19.3/additional-methods.min.js"></script> --%>
  <script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript"
		src="${cPath }/resources/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet"
		href="${cPath }/resources/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet"
		href="${cPath }/resources/css/joinForm.css" />
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  

</head>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수 

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();

	}
</script>
<body>
<div class="member_join_step">
    <ul>
        <li class="step01 on">
            <div class="step01_bg">
                <img src="${cPath}/resources/imgs/img/member_join_chapter01_off.png"><br>
                <span class="step_level">STEP 1</span></br>
                <span class="step_title">가입 여부 및 본인 인증</span>
            </div>
        </li> 
        <li class="step02">
            <div class="step02_bg">
                <img src="${cPath}/resources/imgs/img/member_join_chapter02_off.png"><br>
                <span class="step_level">STEP 2</span><br>
                <span class="step_title">약관 동의</span>
            </div>
        </li> 
        <li class="step03">
            <div class="step03_bg">
                <img src="${cPath}/resources/imgs/img/member_join_chapter03.png"><br>
                <span class="step_level">STEP 3</span><br>
                <span class="step_title">회원 정보 입력</span>
            </div>
        </li>
        <li class="step04">
            <div class="step04_bg">
                <img src="${cPath}/resources/imgs/img/member_join_chapter04_off.png"><br>
                <span class="step_level">STEP 4</span><br>
                <span class="step_title">가입 완료</span>
            </div>
        </li>
    </ul>
</div> 

	<form:form commandName="member" id="memberForm" method="post" action="${cPath}/submitCareer" >
	<c:set var="list" value="${member.careerList }"/>
	<div class="container form-horizontal">
		<h1><span class="logotext">120BPM</span></h1> <br>
			<div class="form-group">  
				<label class="control-label col-sm-4" ></label>
				<span>≫영소문자로 시작하는 영소문자+숫자 5~12자리 </span><br> 
				<label class="control-label col-sm-4" for="id">※아이디</label>
				<div class="col-sm-4">
					<form:input path="memId" cssClass="form-control" id="memId" />
					<form:errors path="memId" cssClass="error" element="label" id="memId-error" for="memId"/>
				</div>
				<button class="btn" id="idck" type="button">중복확인</button>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" ></label>
				<span>≫영문자+숫자+특수문자 8~12자리 </span><br> 
				<label class="control-label col-sm-4" for="password">※비밀번호</label>
				<form:errors path="memPass" cssClass="error" element="label" id="memPass-error" for="memPass"/>				
				<div class="col-sm-4">
					<input type="password" class="form-control" id="password" name="memPass">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="pass">※비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="checkpass">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="name">※이름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="Fname" name="memFnm" placeholder="성">
					<form:errors path="memFnm" cssClass="error" element="label" id="memFnm-error" for="memFnm"/>	
					<input type="text" class="form-control" id="Nname" name="memLnm" placeholder="이름">
					<form:errors path="memLnm" cssClass="error" element="label" id="memLnm-error" for="memLnm"/>	
				
				</div>

			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="hp">※휴대전화번호</label>
				 <div class="form-group">
	                    <label for="pne">연락처</label>
	                    <input type="text" class="form-control" name="memHp" id="memHp" placeholder="010-1004-1004">
            			<form:errors path="memHp" cssClass="error" element="label" id="memHp-error" for="memHp"/>	
	              
	              </div>
			</div> 

			<div class="form-group" id="v">
				<label class="control-label col-sm-4" for="email">※메일주소</label>
				<div class="col-sm-3">
					<input type="email" class="form-control" id="memEmail"
						name="memEmail">
				<form:errors path="memEmail" cssClass="error" element="label" id="memEmail-error" for="memEmail"/>						
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-4" for="zip">우편번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="sample6_postcode"
						name="memZip" readonly="readonly"> 
				</div>
				<div class="col-sm-5">
					<input class="btn " type="button"
						onclick="sample6_execDaumPostcode()" value="검색"><br>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="zip">주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sample6_address"
						name="memAddr1" readonly="readonly">
				</div>
			</div>

			<span id="guide" style="color: #999; display: none"></span>

			<div class="form-group">
				<label class="control-label col-sm-4" for="zip">상세주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sample6_detailAddress"
						name="memAddr2">
				</div>
				
			</div>
			<div>경력사항</div>
			 <button type="button" class="addCareerBtn" value="경력사항보이기" >추가</button>
			  <button type="button" class="subCareerBtn" value ="경력사항지우기" >삭제</button>
			
				
		 <br>	
		<br><br>
	</div>
	
<br><br>

<div class="container form-horizontal" id="careerTable" >
 
  <h2>경력사항</h2>
  <button type="button" class="plus" >+</button>
  <button type="button" class="del">-</button>
  <p>경력사항을 입력하고 등록버튼을 눌러 주세요</p>
		  <input type ="button" value="등록하기" id="careerInsert" name="careerInsert">
		  <input type ="button" value ="취소" onclick="location.href='joinForm.jsp">
		  <br><br>
<%-- <c:forEach items="${list }" var="career"> --%>
  <table class="table table-bordered career" id="epi0" >
    <thead>
    </thead>
    <tbody >
    <tr >
      <th class="table-active" rowspan="10" colspan="4">프로젝트</th>
    </tr>
    <tr>
      <th rowspan="1" colspan="2">참여사업명 </th>
      <td colspan="4"><input type="text" name="partcptnBiz" class="pCareer" id="partcptnBiz">
      <form:errors path="careerInfo.partcptnBiz" cssClass="error" element="label" id="partcptnBiz-error" for="partcptnBiz"/>
      </td>
    </tr>
    <tr>
      <th  colspan="2" >참여시작일 </th>
      <td><input type="date" name="beginde" class="pCareer" >      
      </td>

      <th  colspan="2">참여종료일 </th>
      <td><input type="date" name="endde" class="pCareer"></td>
    </tr>
    <tr>
      <th  colspan="2">발주처 </th>
      <td ><input type="text" name="orntNm" class="pCareer">
      <form:errors path="careerInfo.orntNm" cssClass="error" element="label" id="orntNm-error" for="orntNm"/>
      
      </td>
      <th  colspan="2">근무처 </th>
      <td colspan="4"><input type="text" name ="wrkplcNm" class="pCareer">
      <form:errors path="careerInfo.wrkplcNm" cssClass="error" element="label" id="wrkplcNm-error" for="wrkplcNm"/>
      
      </td>
  
    </tr>
    <tr>
      <th colspan="2">직위 </th>
      <td ><input type="text" name="ofcpsNm" class="pCareer">
      <form:errors path="careerInfo.ofcpsNm" cssClass="error" element="label" id="ofcpsNm-error" for="ofcpsNm"/>
      </td>
      <th  colspan="2">수행업무 </th>
      <td colspan="4"><input type="text" name="atndDu" class="pCareer">
      <form:errors path="careerInfo.atndDu" cssClass="error" element="label" id="atndDu-error" for="atndDu"/>
      </td>
  
    </tr>
    </tbody>
  </table>
<%--  </c:forEach> --%>
</div>

<br><br>

	<div class="flex-justify-center">
			<button type="button" class="btn submit" id="insert" >가입</button>
		</div> 
</form:form>




<script>
$(function(){
	$(".pCareer").prop("disabled",true);
	
	$("#careerTable").hide();
})

$(".subCareerBtn").on("click",function(){
	$("#careerTable").hide();
	$(".pCareer").attr("disabled", true);
});


$(".addCareerBtn").on("click",function(){
	$("#careerTable").show();
	$(".pCareer").attr("disabled", false); //활성화
});

$("#insert").on("click",function(){
	addCareer();
});
$("#careerInsert").on("click",function(){
	addCareer();
});


// // 회원가입 유효성검사(정규식 등)
// $(function(){
	
// 	let validateOptions = {};
// 	<c:if test="${command eq 'INSERT'}">
// 		validateOptions.rules={
// 			memId:{
// 				remote:"${pageContext.request.contextPath }/member/idCheck"
// 			}
// 		}
// 		validateOptions.messages={
// 			memId:{
// 				remote:"아이디 중복"
// 			}
// 		}
// 	</c:if>
// 	$("#memberForm").validate(validateOptions);
// });




	var cnt = 0;
	
	$(".plus").on("click",function(){ 
		cnt++;
	  newTable = $(".career").last().clone();
		console.log("newTable : " + newTable);
	  $("#careerTable").append(newTable);
	  newTable = $(".career").last();
	  newTable.attr('id' , "epi" + cnt)
	  
	 tabid = newTable.attr("id");
	  $('.pCareer', newTable).val("");
	  $(newTable).filter('.pCareer').val("");
	});
	
	$(".del").on("click",function(){
		idvalue = $(".career").last().attr("id");
		if(idvalue != "epi0"){
			$(".career").last().remove();
		}
	});
	
	
	function addCareer() {
		var add =0;
		$(".career").each(function(index){
			++add;
			console.log(add);
		}); 
 		if($("#careerTable").is(":hidden")){
 			add = 0;
 		}
		if(add > 0){
			$(".career").each(function(index) {
				console.log(add);
			$(this).find("input[name=partcptnBiz]").attr("name","careerList[" + index + "].partcptnBiz");
			$(this).find("input[name=beginde]").attr("name","careerList[" + index + "].beginde");
			$(this).find("input[name=endde]").attr("name","careerList[" + index + "].endde");
			$(this).find("input[name=orntNm]").attr("name","careerList[" + index + "].orntNm");
			$(this).find("input[name=wrkplcNm]").attr("name","careerList[" + index + "].wrkplcNm");
			$(this).find("input[name=atndDu]").attr("name","careerList[" + index + "].atndDu");
			$(this).find("input[name=ofcpsNm]").attr("name","careerList[" + index + "].ofcpsNm");
			
			});
			
		}
		
		$("#memberForm").submit();
		
	}
</script>

</body>
</html> 
