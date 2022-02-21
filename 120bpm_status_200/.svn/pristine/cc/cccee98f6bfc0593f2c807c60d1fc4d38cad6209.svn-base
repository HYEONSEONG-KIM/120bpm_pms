<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
h1{
	text-align: center;
}

input:focus 
{
	outline: 2px solid blue;
}
#content h3, .copyAuth h3{
	font-weight: bold;
	margin-bottom: 30px;
	margin-top: 30px;
}
#roleAuth h3{
	font-weight: bold;
	margin: 30px;
}

#content{
	padding-bottom: 40px;
	padding-left: 50px;
}
.mb-3{
	margin-bottom: 10px;
}

.form-control{
   border: 2px solid gray;
   padding: .375rem .75rem;
   font-size: 1rem;  
   line-height: 1.5; 
   border-radius: .25rem;
   transition: color .15s ease-in-out, background-color .15s ease-in-out,
      border-color .15s ease-in-out, box-shadow .15s ease-in-out;
      height: 45px;
   } 
	.parent {
		width: 98%;
		background: #fcfcfc;
		display: grid;
		grid-template-columns : 1fr 1fr;
		margin: 2%;
		padding-top: 20px;
		border-radius: 5px;
	}
	.roleLabel{
		font-size: 20px;
		font-weight: bold;
	}
	table{
		width: 100%;
		background: #fcfcfc;
	}
	table td {
		font-size : 15px;
	}
	#roleAuth{
	text-align : center;
		width: 98%;
		background: #fcfcfc;
		margin: 2%;
		padding-top: 5px;
		border-radius: 5px;
/* 		padding-left: 40px; */
	}
	.authlabel{
		margin-left: 10px;
	}
	.form-check-input {
    position: absolute;
    margin-top: .1rem;
    margin-left: -1.6rem;
        margin-top: 0.7rem;
}
.form-check {
    position: relative;
    display: block;
    padding-left: 1.25rem;
}
h4{
	font-weight: bold;
}
.authselect{
	font-size: 1.4em;
	text-align: center;
}
#roleName-error{
	font-size: 20px;
	color: red;
}
#saveRole{
	margin-right: 3%;
	margin-bottom: 20px;
	font-size: 27px;
	
}

</style>

<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/additional-methods.min.js"></script>
<title>makeRole</title>
</head>
<body>
<c:if test="${not empty message }">
	<script type="text/javascript">
		alert(message);
	</script>
</c:if>
<h1>역할 생성</h1>
<form action="${cPath}/admin/role/makeRole" method="post" id = "roleForm">
	<div class = "parent">
		
		<div id = "content">
		 <div class="mb-3">
				<h3>역할 정보</h3>
				<div class="mb-3 row">
					<label for="roleName" class="col-sm-2 col-form-label roleLabel">역할 이름</label>
					<div class="col-sm-7">
						<input type="text"  class="form-control" id="roleName" name = "authorNm" id = "authorNm" required>
					</div>
				</div>
				<div class="mb-3 row">
					<label for="roleDs" class="col-sm-2 col-form-label roleLabel">역할 내용</label>
					<div class="col-sm-7">
						<input type="test" class="form-control" id="roleDs" name = "authorDc">
					</div>
				</div>
			</div>
		</div>
		<div class = "copyAuth">
			<h3>업무 흐름 복사</h3>
			<div class="mb-3 row">
					<label for="roleName" class="col-sm-2 col-form-label roleLabel">역할 선택</label>
				<select class="form-select authselect col-sm-5" id = "copyAuthSelect" aria-label="Default select example">
					<option selected>역할을 선택하세요</option>
					<c:forEach items="${roleList}" var="role">
						<option value="${role.author }">${role.authorNm} : ${role.authorDc }</option>
					</c:forEach>
				</select>
				</div>
			</div>
	</div>
	<div id = "roleAuth">
		<h3>권한</h3>
	   	<table class = "table" id = "authTable">
				<c:forEach items="${resourceList }" var="resource" varStatus="vs">
						
							<c:if test="${resource.level le 2 }">
							<c:if test="${not vs.first}">
								</tr>
							</c:if>
							<tr>
							<th>
								<c:if test="${vs.count ge 2 }"></div></c:if>
								<div class="row m-3">
								<h4 class="ok">${resource.resrceDc }</h4>
							</th>
							</c:if>
						
						
								<c:if test="${resource.level ge 3 }">
								<td>
							<div class="form-check col">
							<sapn class = "modalSpan">
								<label class="form-check-label authlabel" title="${resource.resrcePttrn }" data-bs-toggle="tooltip" data-bs-placement="top">
									<input name="resrceCode" id="${resource.resrceCode }" class="form-check-input" type="checkbox" style="width:20px;height:20px;" value="${resource.resrceCode }" >
							    	${resource.resrceDc }
							  </label>
							  </sapn>
								</div>
							</td>
								  </c:if>
						<c:if test="${ vs.last }"></tr></c:if>
					
				</c:forEach>
				</table>
	</div>
	<input type = "submit" class = "insertBtn btn-lg float-right" value = "저장" id = "saveRole"/>
</form>
</body>
<script type="text/javascript">
	
	let roleForm = $('#roleForm');
	let validateOptions = {};
	validateOptions.rules={
			authorNm:{
				remote : "${cPath}/admin/role/makeRole/duplcheck"
			}
		}
		validateOptions.messages={
			authorNm:{
				remote:"이미 존재하는 이름입니다",
				required : "필수 입력 값 입니다"
			}
		}
	
	roleForm.validate(validateOptions);

	
	let authTable = $('#authTable')

	$('#copyAuthSelect').on('change',function(){
		let author = $(this).val();
		console.log(author);
		$.ajax({
			url : "${cPath}/admin/role/makeRole/" + author,
			dataType : "json",
			success : function(resp) {
				authTable.empty();
				let trs;
				
				$(resp).each(function(idx,resource){
					
					
					if(resource.level <= 2){
						if(idx != 1){
							trs += "</tr>";
						}
						trs += "<tr> <th>";
						if(idx >= 2){
							trs += "</div>"
						}
						trs += "<div class='row m-3'> <h4 class='ok'>" + resource.resrceDc +"</h4> </th>"
					}
					if(resource.level >= 3 ){
						trs += "	<td> <div class='form-check col'> <sapn class = 'modalSpan'> " +
						" <label class='form-check-label authlabel' title=' " +resource.resrcePttrn + "' data-bs-toggle='tooltip' data-bs-placement='top'> " +
						" <input name='resrceCode' id='" + resource.resrceCode + "' class='form-check-input' type='checkbox' style='width:20px;height:20px;' " +
						"value='" + resource.resrceCode + "'"; 
						
						let flag = false;
						
						$(resource.authorities).each(function(id, value){
							if(value.author != null && value.author == author){
								flag = true;
								return false;
							}else{
								flag = false;
							}
						})
						
						if(flag){
							trs +=" checked > " + resource.resrceDc +" </label> </sapn> </div> </td>";
						}else{
							trs +=">" + resource.resrceDc  + "</label> </sapn> </div> </td>";
						}
					
					}
				});
				authTable.append(trs);
			},
			error : function(errorResp) {

			}

		});
	})
</script>
</html>