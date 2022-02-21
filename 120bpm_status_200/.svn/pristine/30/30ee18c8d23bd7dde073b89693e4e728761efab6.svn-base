<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<script type="text/javascript" src="${cPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/additional-methods.min.js"></script>
<style>
	#memPar{
		width: 97%;
		background: #fcfcfc;
		display: grid;
		grid-template-columns : 1fr 1fr 1fr 1fr;
		margin: 2%;
		text-align: center;
		padding-top: 5px;
		border-radius: 15px;
	}
	.memInfo{
		width: 80%;
		font-size: 20px;
		font-weight : bold;
		text-align: left;
		margin: 20px;
	}
	#modalMemPar{
		width: 97%;
		display: grid;
		grid-template-columns : 1fr 1.3fr;
		margin: 2%;
		text-align: center;
		padding-top: 5px;
	}
	#memDetailInfo{
		border : 2px solid lightgray;
		overflow: auto;
		margin: 2%;
		height: 600px;
	}
	#memArea{
		display: grid;
		grid-template-rows : 2fr 0.3fr 0.5fr
	}
	#searchUI{
		justify-content: flex-start;
		margin: 2%;
	}
	.insertBtn{
		float: right;
		font-size: 20px;
	}
	#detailWord{
		height: 38px;
	}
	#searchBtn{
		margin-left: 5px;
	}
	table th {
		background: #F0F9FC;
	}
	#selectMem{
		width: 55px;
		border-color: lightGray;
		background: lightGray;
	}
		#topPar{
		display: grid;
		grid-template-columns : 0.5fr 0.1fr 1fr;
		margin: 2%;
		text-align: center;
		width: 95%;
		background: #ffffff;
	}
	#memImg{
		width: 150px;
		height: 150px;
		margin-top: 20px;
	}
	#basicInfo th{
		width: 100px;
		font-size: 15px;
		text-align: left;
		height: 30px;
	}

	#basicInfo td{
		text-align: left;
		font-size: 15px;
	}
	#selectMem{
		float: right;
		width: 60px;
		margin: 3%;
	}
	
	#projectInfo{
		margin-top: 6%; 
	}
	.searchUIBtnMemSelect{
	 margin-top: -20px;
	}
	#title{
		text-align: center;
		font-weight: bold;
	}
	
</style>

<h1 id = "title"><span id = "title01">프로</span><span id = "title02">젝트</span> <span id = "title03"> 생</span><span id = title04>성</span></h1>
<hr>
<form method="post" id = "projectForm">
	<table class = 'table'>
		<tr>
			<th>※프로젝트 명</th>
			<td colspan="3">
				<input type = "text" class="form-control" name = "prjctNm" id = "prjctNm" required/>
			</td>
		</tr>
		
		<tr>
			<th>프로젝트 내용</th>
			<td colspan="3">
				<textarea class="form-control"  name="sumry" id="sumry"> </textarea>
			</td>
		</tr>
		<tr>
			<th>※시작일자</th>
			<td>
				<input type = "date" class="form-control" name = "prjctBeginde" id = "beginDe" required>
			</td>
			<th>※종료일자</th>
			<td>
				<input type = "date" class="form-control" name = "prjctEndde" id = "endDe" required>
			</td>
		</tr>
		<tr>
			<th>상위 프로젝트</th>
			<td colspan="2">
				<select class="form-select" name = "upperPrjctNo" style="width: 100%;" id = "upperPrt">
					<option value>없음</option>
					<c:forEach items="${prtList}" var="prt">
						<option value = "${prt.prjctNo}">${prt.prjctNm}</option>
					</c:forEach>
					
				</select>
			</td>
			<td>
				<input type = "checkbox" name = "upperPrtMem" id = "upperPrtMem" disabled>
				<span>상위 프로젝트 구성원 상속</span>
			</td>
			
		</tr>
		
		<tr>
			<th>발주처</th>
			<td>
				<input type = "text" class="form-control" name = "prjctOrnt"  id = "prjctOrnt"/>
			</td>
			<th>사업 규모</th>
			<td>
				<input type = "text" class="form-control" name = "bsnssclae" id = "bsnssclae"/>
			</td>
		</tr>
		
		<tr>
			<th>담당PM</th>
			<td colspan="2">
				<input type = "text" class="form-control" name = "memId" id = "selectPm" readonly/>
			</td>
			<td>
				<input type = "button" class = "searchBtn" id = "searchMem" value = "검색">
			</td>
		</tr>
		
	</table>	
	
	<input type = "button" id = "createPrt" value = "생성" class = "insertBtn" >

</form>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="staticBackdropLabel"></h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      
      	<h3 style="text-align: center;">프로젝트 PM 설정</h3>
      	
	   
      	
      	<div id = "modalMemPar">
      	<div id = "memArea">
		      	<div id = "memPar">
		      		<c:set value="${paging.dataList}" var="prtMemList"/>
		      		<c:forEach items="${prtMemList}" var="prtMem">
						<span class = "memInfo" id = "member" data-id = '${prtMem.memId}' data-name = '${prtMem.memName}'>${prtMem.memName}</span>
		      		</c:forEach>
		      	</div>
		      	
		      <div id="searchUI" class="row">
				<div>
					<div class="searchUIInput">
						<input type="text" name = "detailWord" id = "detailWord" placeholder="이름,ID,Email로 검색"/>
					</div> 
				</div>
				<div class="searchUIBtn searchUIBtnMemSelect">
						<button type="button" id="searchBtn" class="btnTags btn searchBtn">검색</button>
				</div>
			</div>
	      	
	      	<div id = "pagingArea">
	      		${paging.pagingHTMLBS }
	      	</div>
      	</div>
      	
	      	<div id = "memDetailInfo">
	      		<div id = "topPar">
		<div class = "topChild">
			<img id = "memImg" src="${cPath}/resources/imgs/member/noimg.jpg">
		</div>
		
		<div></div>
		
		<div class = "topChild">
			
			<hr>
			<table id = "basicInfo">
				<tr>
					<th>이름</th>
					<td></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td></td>
				</tr>
				
				<tr>
					<th>소속</th>
					<td></td>
				</tr>
			</table>
			<hr>
		</div>
	</div>
	
	<div id = "bottomPar">
		<h4>경력사항</h4>
		<table class = 'table' id = "careerInfo">
		<tr>
			<th>참여사업명</th>
			<th>근무처명</th>
			<th>직위</th>
			<th>발주처명</th>
		</tr>
				
				
			<tr>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
			</tr>
		
		</table>
	</div>
	<hr>
	<div id = "projectInfo">
		<h4>프로젝트 정보</h4>
		<table class = 'table'>
			<tr>
				<th>프로젝트명</th>
				<th>시작일자</th>
				<th>종료일자</th>
				<th>역할</th>
			</tr>
		
			<tr>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
			</tr>
		
		</table>
	</div>
	      	
	      	
	      	</div>
      	</div>
	      	<input type = 'button' id = "selectMem" class = "insertBtn" value = "선택"   disabled>
      	
      
      	
      	<form id = "searchForm">
      		<input type = "hidden" name = "page"/>
      		<input type = "hidden" name = "detailWord"/>
      	</form>
      	
      	
      	
      </div>
      
      <div class="modal-footer">
        <button type="button" class="gobackBtn btn-lg" data-bs-dismiss="modal" id = "closeModal">Close</button>
      </div>
    </div>
  </div>
</div>


<script>
	$(function(){
	
		$(document).ajaxComplete(function(event, xhr, options){
			searchForm.find("[name='page']").val("");
		}).ajaxError(function(event, xhr, options, error){
			console.log(event);
			console.log(xhr);
			console.log(options);
			console.log(error);
		});
	})
	
	let staticBackdrop = $('#staticBackdrop');
	let memDetailInfo = $('#memDetailInfo');
	let projectForm = $('#projectForm');
	
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
			},
			memId : {
				required :"프로젝트 PM을 선택하세요"
			}
			
			
		}
	
	projectForm.validate(validateOptions);
	
	$('#searchMem').on('click',function(){
		staticBackdrop.modal('show');
	})
	
	$('#closeModal').on('click',function(){
		staticBackdrop.modal('hide');
	})
	
	let clickMem;
	
	$('#memPar').on('click','.memInfo',function(){
		if(clickMem != null){
			clickMem.css('color', 'black');
			clickMem = null;
		}
		clickMem = $(this);
		clickMem.css('color', 'blue');
		
		
		let memId = $(this).data('id');
		$('#selectMem').attr({
			'data-id': memId,
			'disabled' : false
			}).css({
			'background': '#69C7F0',
			'border-color' : '#69C7F0'})
		
 		let url = "${cPath}/admin/mem/detail/prtForm/" + memId;
	 		$.ajax({
				url : url,
				dataType : "html",
				success : function(resp) {
					memDetailInfo.empty();
					memDetailInfo.html(resp)
					
				},
				error : function(errorResp) {

				}
			});
	}).css('cursor', 'pointer');
	
	$('#selectMem').on('click', function(){
		
		let selectId = $(this).data('id');
		let selectName = $(this).data('name');
		$('#selectPm').val(selectId);
		staticBackdrop.modal('hide');
	})

	

	
	let memList = $('#memPar');
	let pagingArea = $('#pagingArea');
	
	let searchForm = $('#searchForm').paging().ajaxForm({
		dataType : 'json',
		success : function(res){
			memList.empty();
			pagingArea.empty();
			
			let dataList = res.dataList;
			
			let span = [];
			
			$(dataList).each(function(idx,value){
				let memNm = value.memLnm + value.memFnm;
				span.push($('<sapn>').attr({
					'class' : 'memInfo', 'data-id' : value.memId,
					'data-name' : memNm
				}).text(memNm))
			})
			
			memList.html(span);
			pagingArea.html(res.pagingHTMLBS);
		}
	})

	let upperPrtMem = $('#upperPrtMem');
	
	$('#createPrt').on('click',function(){
		let selectPm = $('#selectPm').val();
		if(upperPrtMem.is(":checked") == false && (selectPm == null || selectPm.length == 0)){
			Swal.fire({
				title : '프로젝트 pm을 설정하여 주세요',
				icon : 'info'
			}).then(function() {
				return false;
			});
		}else{
			projectForm.submit();
		}
	})
	
	
	$('#upperPrt').on('change',function(){
		let upperVal = $(this).val();
		if(upperVal == null || upperVal.length == 0){
			upperPrtMem.prop("checked", false);
			upperPrtMem.attr('disabled',true);
			$('#searchMem').attr('disabled',false);
		}else{
			upperPrtMem.attr('disabled',false);
		}
		
	})
	
	upperPrtMem.on('change',function(){
		if(upperPrtMem.prop("checked")){
			$('#searchMem').attr('disabled',true);
			$('#selectPm').val('');
		}else{
			$('#searchMem').attr('disabled',false);
		}
	})
	
	$('#endDe').on('change',function(){
		let inputEndDe = $(this).val();
		let inputBeginDe = $('#beginDe').val();
		
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
	
	$('#beginDe').on('change',function(){
		let inputBeginDe = $(this).val();
		let inputEndDe = $('#endDe').val();
		
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
	
	$('#title01').on('click',function(){
		$('#prjctNm').val('대덕인재개발원 학생 관리 프로그램');
		$('#endDe').val('2021-11-15');
		$('#beginDe').val('2021-10-01');
		$('#prjctOrnt').val('대덕인재개발원');
		$('#bsnssclae').val('10,000,000');
		CKEDITOR.instances.sumry.setData('<p>대덕인재개발원 학생 관리 프로그램 구축</p>')
	})
	
	$('#title02').on('click',function(){
		$('#prjctNm').val('대덕인개발원 교직원 그룹웨어');
		$('#endDe').val('2021-12-20');
		$('#beginDe').val('2021-10-10');
		$('#prjctOrnt').val('대덕인재개발원');
		$('#bsnssclae').val('100,000,000');
		CKEDITOR.instances.sumry.setData('<p>대덕인개발원 교직원 그룹웨어 프로그램 구축</p>')
	})
	
	$('#title03').on('click',function(){
		$('#prjctNm').val('푸쉬알림 기능 구현');
		$('#endDe').val('2021-10-02');
		$('#beginDe').val('2021-10-30');
		$('#prjctOrnt').val('대덕인재개발원');
		$('#bsnssclae').val('10,000,000');
		CKEDITOR.instances.sumry.setData('<p>푸쉬알림 기능 구현 프로그램 구축</p>')
		$('#selectPm').val('ddit2102KHS');
	})
	
	$('#title04').on('click',function(){
		$('#prjctNm').val('푸쉬알림 설정 구현');
		$('#endDe').val('2021-11-20');
		$('#beginDe').val('2021-11-30');
		$('#prjctOrnt').val('대덕인재개발원');
		$('#bsnssclae').val('100,00,000');
		CKEDITOR.instances.sumry.setData('<p>푸쉬알림 기능 구현 프로그램 구축</p>')
		$('#selectPm').val('ddit2102KHS');
	})
	

	CKEDITOR.replace('sumry', {
		language : 'en',
		toolbar : [
				{
					name : 'basicstyles',
					items : [ 'Bold', 'Italic', 'Underline', 'Strike',
							'RemoveFormat', 'Subscript', 'Superscript' ]
				},
				{
					name : 'links',
					items : [ 'Link', 'Unlink' ]
				},
				{
					name : 'paragraph',
					items : [ 'NumberedList', 'BulletedList', '-', 'Outdent',
							'Indent', '-', 'Blockquote' ]
				},
				{
					name : 'insert',
					items : [ 'Table' ]
				},
				{
					name : 'editing',
					items : [ 'Scayt' ]
				},
				'/',
				{
					name : 'styles',
					items : [ 'Format', 'Font', 'FontSize' ]
				},
				{
					name : 'colors',
					items : [ 'TextColor', 'BGColor', 'CopyFormatting' ]
				},
				{
					name : 'align',
					items : [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight',
							'JustifyBlock' ]
				}, {
					name : 'document',
					items : [ 'PageBreak', 'Source' ]
				} ]

		,
		bodyClass : 'document-editor'

	});
</script>