<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" src="${cPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/additional-methods.min.js"></script>
<style type="text/css">
	.insertBtn{
		float: right;
		font-size: 20px;
	}
	#par{
		width: 97%;
		background: #fcfcfc;
		margin: 2%;
		text-align: center;
		padding: 20px;
		border-radius: 15px;
	}
		table th {
		background: #F0F9FC;
	}
	
	#title{
		font-weight: bold;
		text-align: center;
	}
</style>

	<h1 id = "title">기본 정보 수정</h1>
	<hr>
<div id = "par">
	<form method="post" id = "projectForm">	
		<table class = 'table'>
			<tr>
				<th>※프로젝트 명</th>
				<td colspan="3">
					<input type = "text" class="form-control" name = "prjctNm" required value = "${project.prjctNm }"/>
				</td>
			</tr>
			
			<tr>
				<th>프로젝트 내용</th>
				<td colspan="3">
					<textarea class="form-control" id = "sumry" name="sumry" >${project.sumry}</textarea>
				</td>
			</tr>
			<tr>
				<th>※시작일자</th>
				<td>
					<input type = "date" class="form-control" id = "startDate" name = "prjctBeginde" value = "${project.prjctBeginde }"  required>
				</td>
				<th>※종료일자</th>
				<td>
					<input type = "date" class="form-control" id = "endDate" name = "prjctEndde" value = "${project.prjctEndde }" required>
				</td>
			</tr>
			
			<tr>
				<th>상위 프로젝트</th>
				<td colspan="3">
					<select class="form-select" name = "upperPrjctNo" style="width: 100%;">
						<option value>없음</option>
						<c:forEach items="${prtList}" var="prt">
							<c:choose>
								<c:when test="${prt.prjctNo eq project.upperPrjctNo}">
									<option value = "${prt.prjctNo}" selected>${prt.prjctNm}</option>
								</c:when>
								<c:otherwise>
									<option value = "${prt.prjctNo}">${prt.prjctNm}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
					</select>
				</td>
				
				
			</tr>
			
			<tr>
				<th>발주처</th>
				<td>
					<input type = "text" class="form-control" name = "prjctOrnt" value = "${project.prjctOrnt }"/>
				</td>
				<th>사업 규모</th>
				<td>
					<input type = "text" class="form-control" name = "bsnssclae" value = "${project.bsnssclae }"/>
				</td>
			</tr>
			
		</table>	
		
		<input type = "button" value = "저장" id = "saveBtn" class = "insertBtn" >
	
	</form>
</div>

<script>

$(function(){
	
		let start =  $('#startDate');
		let end = $('#endDate');
	
		function equalsDate(){
			var startDate = new Date(start.val());
			var endDate = new Date(end.val());
			var now = new Date();
			
			if(startDate < now){
				start.attr("readonly",true);
			}
			
			if(endDate < now){
				end.attr("readonly",true);
			}
		
		}
		
		end.on('change',function(){
			let inputEndDe = $(this).val();
			let inputBeginDe = start.val();
			
			let endDate = new Date(inputEndDe);
			let beginDate = new Date(inputBeginDe);
			let now = new Date();
			
			if(inputBeginDe == null || inputBeginDe.length == 0){
				$(this).val(null)
				Swal.fire({
					title : '시작일을 먼저 입력하여 주세요',
					icon : 'info'
				}).then(function() {
					return false;
				});
			}else if(beginDate >= endDate){
				$(this).val(null);
				Swal.fire({
					title : '종료일이 시작일 보다 앞선 날짜이어야 합니다',
					icon : 'info'
				}).then(function() {
					return false;
				});
			}else if(endDate <= now){
				$(this).val(null);
				Swal.fire({
					title : '종료일이 현재날짜보다 앞선 날짜일수 없습니다',
					icon : 'info'
				}).then(function() {
					return false;
				});
			}
		})
		
		start.on('change',function(){
			let inputBeginDe = $(this).val();
			let inputEndDe = end.val();
			
			let beginDate = new Date(inputBeginDe);
			let endDate = new Date(inputEndDe);
			let now = new Date();
			
			if(beginDate >= endDate){
				$(this).val(null);
				Swal.fire({
					title : '시작일이 종료일 보다 앞선 날짜이어야 합니다',
					icon : 'info'
				}).then(function() {
					return false;
				});
			}
			
		})
		
	
		 equalsDate();
	
		let validateOptions = {};
				
			validateOptions.messages={
				prjctNm :{
					required :"프로젝트명은 필수 입력값 입니다"
				},
				prjctBeginde :{
					required :"시작일은 필수 입력값 입니다"
				},
				prjctEndde : {
					required :"종료일은 필수 입력값 입니다"
				}
			} 
		 
		let projectForm = $('#projectForm');
		let validatePrt = projectForm.validate(validateOptions);
		let prtId = '${pCode}';
		let url = "${cPath}/project/" + prtId + "/main";
		
		
		let sendSumry = $('#sumry')
		
	
		$("#saveBtn").on('click',function(){
			let sumryData = CKEDITOR.instances.sumry.getData();
			sendSumry.empty();
			sendSumry.val(sumryData);
			projectForm.submit();
		})
		
		projectForm.ajaxForm({
			dataType : 'json',
			success : function(res){
				console.log($('#sumry').val())
				if(res == 'OK'){
					Swal.fire({
						title: 'success!',
			    		icon: 'success'
					}).then(function(){
						location.href = url;								
					});
				}else if(res == 'FAIL'){
					Swal.fire({
						title: 'FAIL...',
			    		icon: 'error'
					})
				}
			}
			
		})

})

CKEDITOR.replace('sumry', {
    language : 'en',
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
         items: ['Table']
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
