<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${cPath }/resources/css/myAccount.css" rel="stylesheet" type="text/css">

<style>
#par{
		display: grid;
		grid-template-columns : 3fr 0.1fr 1.5fr;
		margin: 2%;
}
.x_title {
	border-bottom : 3px solid #42B4E6;
}
.x_panel{
	height: 550px;
}
.x_content{
	font-size: large;
}
.x_content > div{
	margin-bottom: 10px;
} 
.pushNo, .pushDel{
	width: 100px;
}
td{
	height: 50px;
}
.deleteBtn{
	float: right;
	margin-bottom: 10px;
	margin-right: 5px;
	font-size: 14px;
	border-radius: 5px;
}
.deletePush{
	color: #e667a4;
}
.deleteBtn:hover,.deletePush:hover{
	text-shadow: 2px 2px 2px gray;
}
</style>
<div id = "par">
	<div class="x_panel">
		<div class="x_title mb-5">
			<h2>나의 푸시 알림</h2> 
			<div class="clearfix"></div>
		</div> 
		<div class="x_content mb-5" style="display: block;">
		<input type = "button" class = "deleteBtn" id = "allDelete" value = "전체삭제">
			<table class = 'table' id = "pushList">
				<thead>
					<tr>
						<th class = "pushNo">번호</th>
						<th>내용</th>
						<th>수신일자</th>
						<th class = pushDel>삭제</th>
					</tr>					
				</thead>
				
				<tbody></tbody>
				
				<tfoot>
					
				</tfoot>
			</table>
			<div id = "pagingArea">
							
			</div>
		</div> 
	</div>
	
	<div></div>
	
	<div class="x_panel">
		<div class="x_title mb-5">
			<h2>푸시 알림 설정</h2> 
			<div class="clearfix"></div>
		</div>    
		<div id="push" class=" x_content mb-5" style="display: block;">
			<div class="text-right">   
				<input id="checkall" type="checkbox"> 전체선택/해제
			</div>
			<div> 
				<input type="checkbox" class="value1 check"> 프로젝트 초대 알림 수신
			</div>
			<div>  
				<input type="checkbox" class="value2 check"> 프로젝트 제외 알림 수신
			</div>
			<div> 
				<input type="checkbox" class="value3 check"> 프로젝트 역할 변경 알림 수신
			</div>
			<br>
			<div> 
				<input type="checkbox" class="value4 check"> 일감 승인 및 반려 알림 수신
			</div>
			<div>
				<input type="checkbox" class="value5 check"> 나의 관람일감 알림 수신
			</div>
			<div>
				<input type="checkbox" class="value6 check"> 나의 관람일감 이슈 알림 수신
			</div>
		</div>  
		<button id="save" type="button" class="btn btbtn float-right">저장 </button> 
	</div>
</div>

<form id="settingForm"  method="post"> 
<c:forEach begin="0" end="5" varStatus="st">   
	<br> 
	<input type="hidden" name="memSetList[${st.index }].setupCnNo" value="${st.index+1}">  
	<input type="hidden" name="memSetList[${st.index }].setupValue" class="value${st.index+1}">
	<input type="hidden" name="memSetList[${st.index }].setupDetailNo" value="0">
</c:forEach>
</form>

<form id = "pushPagingForm">
	<input type="hidden" name="page" >
</form>
<script> 

let tbody = $('table > tbody');
let pagingArea = $('#pagingArea');



function makeTrs(idx,push){
	let deleteBtn = "<i class='fa fa-minus-circle deletePush' data-code = '" + push.pushCode + "' ></i>"
	
	return $("<tr>").append(
		$('<td>').html(idx + 1),
		$('<td>').html(push.pushMessage),
		$('<td>').html(push.createde),
		$('<td>').html(deleteBtn).css('text-align', 'center')
	);
	
	
}
function makeBlackTrs(index){
	return $("<tr>").append(
			$('<td>').html(''),
			$('<td>').html(''),
			$('<td>').html(''),
			$('<td>').html('')
		);
}


$('#pushPagingForm').paging().ajaxForm({
	url : "${cPath}/mypage/notification/pushList",
	dataType : "json",
	success : function(paging){
		
		tbody.empty();
		pagingArea.empty;
		
		let pushList = paging.dataList;
		console.log(pushList.length)
		if(pushList.length == 0){
			$('#allDelete').css('display','none');
		}
		
		let trs = [];
		
		let index = 0;
		$(pushList).each(function(idx, push){
			trs.push(makeTrs(idx,push));
			index = idx;
		})
		if(index < 4){
			for(i = index; i < 4; i++){
				trs.push(makeBlackTrs(i));
			}
		}
		
		tbody.html(trs);
		pagingArea.html(paging.pagingHTMLBS);
	}
}).submit();

// 메세지 모두 삭제
$('#allDelete').on('click',function(){
	
	 Swal.fire({
		  title: '모든 메세지를 삭제하시겠습니까?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제',
			cancelButtonText: '취소'
		}).then((result) => {
			 if (result.isConfirmed) {
			$.ajax({
				url : "${cPath}/mypage/notification/allDelPush",
				dataType : "json",
				success : function(resp) {
					if(resp == 'OK'){
						Swal.fire({
								title: '삭제완료',
					    		icon: 'success'
						}).then(function(){
							$('#pushPagingForm').submit();							
						});
					}else if(resp == 'FAIL'){
						Swal.fire({
								title: '삭제 실패',
					    		icon: 'error'
						});
					}
				}
			});
		  }
	})
})

// 메세지 한 건씩 삭제
$('#pushList').on('click','.deletePush',function(){
	
	let code = $(this).data('code');
	
	$.ajax({
		url : "${cPath}/mypage/notification/oneDelPush/" + code,
		dataType : "json",
		success : function(resp) {
			if(resp == 'OK'){
				Swal.fire({
						title: '삭제완료',
			    		icon: 'success'
				}).then(function(){
					$('#pushPagingForm').submit();							
				});
			}else if(resp == 'FAIL'){
				Swal.fire({
						title: '삭제 실패',
			    		icon: 'error'
				});
			}
		}
	});
})


<c:if test="${not empty pushUpdateMessage}">
if ("${pushUpdateMessage}" == "OK") { 
	Swal.fire({ 
		title : "SUCCESS",
		text : "${mem.memId} 님의 정보가 수정되었습니다.",
		icon : 'success',   
		confirmButtonText : '확인'
	})
} else if("${pushUpdateMessage}" == "FAIL"){ 
	Swal.fire({
		title : "SERVER ERROR",
		text : "다시 시도해주세요.", 
		icon : 'error',
		confirmButtonText : '확인'
	})
}
</c:if>


<c:if test="${not empty memSetList }">
<c:forEach items="${memSetList }" var="set">  
	if('${set.setupValue}'==1){ 
		$(".value${set.setupCnNo}").prop("checked", true);
	}else{
		$(".value${set.setupCnNo}").prop("checked", false);
	} 
</c:forEach>     
</c:if>


$("#checkall").click(function(){
	if($(this).is(":checked")){   
		$("#push input:checkbox").prop("checked", true);
	}else{ 
		$("#push input:checkbox").prop("checked", false);
	}
});

var checkboxs = $("#push .check");
var isTrue = true;
$(checkboxs).each(function(i,box){
	if($(box).prop("checked")==false){   
		isTrue = false;
	} 
});
if(isTrue==true){ 
	$("#checkall").prop("checked", true);
}

$("#push").on('click', 'input:checkbox:not(#checkall)', function(){
	
	let checkBoxSize = $("#push input:checkbox:not(#checkall)").length;
	let checkedSize =$("#push input:checkbox:not(#checkall):checked").length;
	if(checkBoxSize > checkedSize){  
		$("#checkall").prop("checked", false);
	}else{   
		$("#checkall").prop("checked", true);
	} 
}); 


$("#save").click(function(){ 
	
	for(var i=1; i<=6; i++){
		var val = $(".x_content .value"+ i);
		if($(val).is(':checked')){ 
			$("#settingForm > .value"+i).val("1");
		}else{   
			$("#settingForm > .value"+i).val("0");
		} 
	}
	
	$("#settingForm").submit(); 
});
</script>