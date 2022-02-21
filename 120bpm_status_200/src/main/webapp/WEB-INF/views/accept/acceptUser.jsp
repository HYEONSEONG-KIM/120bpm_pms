<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
table {
	text-align: center;
}
.searchUIBtn {
  
    margin-top: -20px;
}

#searchBtn {
	margin-left: 3px;
	margin-top: -20px;
}
#searchWord, #searchType {
	height: 38px;
}

h3 {
	text-align: center;
	margin-bottom: 25px;
}

.insertBtn {
	margin-right: 10px;
}

.holderArea {
	border-radius: 10px;
	width: 80%;
	font-size: large;
	border: 2px solid lightgrey;
	margin: 3px 0;
}
.popOuterBox_refuse{
 display:flex; 
  flex-direction : column; 
  flex-wrap: wrap; 
  align-content: flex-end; 
  position:absolute;  
  top:28%;    
  left:35%;  
  width:800px;  
  height:600px;
  margin:-125px 0 0 -200px;
}
.popInnerBox_refuse{
	  display:flex;
  justify-content:space-between;
  flex-direction:column;
  position:absolute;
  top:28%;  
  left:35%;
  width:800px;
  height:600px;
  margin:-125px 0 0 -200px;
  text-align:center;
  background:#fff;
  border-radius:12px; 
}
</style>
<link rel = "stylesheet" href = "${cPath}/resources/css/memView.css"/>

<title>acceptUser</title>


	<h3>미승인 회원 리스트</h3>
	<div id="searchUI" class="row">
		<div>
			<div class="searchUIInput">
					<select name = "searchType" id = "searchType">
					<option value>검색항목</option>
					<option value="name">이름</option>
					<option value="id">아이디</option>
					<option value="mail">이메일</option>
				</select> 
				<input type="text" name = "searchWord" id = "searchWord" />
			</div> 
			<div class="searchUIBtn">
				<button type="button" id="searchBtn" class="btnTags btn searchBtn">검색</button>
				<input type = "button" value = "일괄승인"  data-type='modify' class = "insertBtn totalAccept" style="width: 90px; height : 37px; font-size: 16px"/>
				
			</div>
		</div>
	</div>
	
	<form id = "totalAcc" action = "${cPath}/admin/mem/allAccept">
		<table class = 'table' id = "memInfo">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>처리</th>
					<th>선택승인
						<input type = "checkbox" id = "allCheck">
					</th>
				</tr>
			</thead>
			
			<tbody>
			</tbody>
			
			<tfoot>
			<tr>
				<td colspan="5">
					<div id = "pagingArea">
					
					</div>
				</td>
			</tr>
			</tfoot>
		</table>
	</form>

	<form id = "searchForm">
		<input type="hidden" name = "searchType"> 
		<input type="hidden" name = "searchWord">
		<input type="hidden" name = "page">
	</form>

<!-- 승인시 비밀번호 입력 -->
<form id="passCheckForm_accept" action="${cPath}/mypage/accountCheck" method="post"> 
	<div id="popUp_modify" class="popCmmn">
	  <div class="popBg" data-num="11"></div> 
		<div class="popOuterBox">         
		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >✖</button>
		  <div class="popInnerBox">  
		    <div class="popHead">회원 승인</div>  
		    <div class="popBody">  
		    	<span>계속하려면 먼저 본인임을 인증하세요.</span><br> 
		    	<input  type="password" name="memberPass" class="holderInput inputPass" placeholder="비밀번호 입력" required>
		    	<div><input class ="showPass" type="checkbox" >비밀번호 표시</div>
		    </div>   
		    <div class="popFoot">    
		      <input type = "submit" id="submitBtn"  class="checkBtn btn btbtn" value = "확인">    
		    </div>  
		  </div>     
	  </div>
	</div>  
</form>   

<!-- 일괄승인시 비번 입력 -->
<form id="passCheckForm_allAccept" action="${cPath}/mypage/accountCheck" method="post"> 
	<div id="popUp_allAccept" class="popCmmn">
	  <div class="popBg" data-num="11"></div> 
		<div class="popOuterBox">         
		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >✖</button>
		  <div class="popInnerBox">  
		    <div class="popHead">회원 승인</div>  
		    <div class="popBody">  
		    	<span>계속하려면 먼저 본인임을 인증하세요.</span><br> 
		    	<input  type="password" name="memberPass" class="holderInput inputPass" placeholder="비밀번호 입력" required>
		    	<div><input class ="showPass" type="checkbox" >비밀번호 표시</div>
		    </div>   
		    <div class="popFoot">    
		      <input type = "submit" id="submitBtn"  class="checkBtn btn btbtn" value = "확인">    
		    </div>  
		  </div>     
	  </div>
	</div>  
</form>  

	
<!-- 반려시 비밀번호 및 메세지 입력 -->	
<form id="passCheckForm_refuse" action="${cPath}/admin/mem/refuse" method="post"> 
	<div id="popUp_refuse" class="popCmmn">
	  <div class="popBg" data-num="11"></div> 
		<div class="popOuterBox_refuse">         
		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >✖</button>
		  <div class="popInnerBox_refuse">  
		    <div class="popHead" id = "refuseCN">반려 사유</div>  
		    <div class="popBody">  
		    <input type = "hidden" id = "hiddenMemId" name = "memId">
		    	<h5 style="text-align: center;">반려사유와 비밀번호를 입력하세요</h5>
		    	<div>
		    		<span>발신자</span><br> 
		    		<input type = "text" name = "memEmail"  class="holderInput" id = "hiddenMemEmail" readonly>
		    	</div>
		    	<div>
		    		<sapn>내용</sapn><br>
		    		<textarea rows="10" cols="30" class="holderArea" name = "content"  id = "refuseVNval">사용불가 항목이 발견되었습니다</textarea>
		    	</div>
		    	<input id="inputPass" type="password" name="memberPass" class="holderInput inputPass" placeholder="비밀번호 입력" required>
		    	<div><input class="showPass" type="checkbox" >비밀번호 표시</div>
		    </div>   
		    <div class="popFoot">    
		      <input type = "submit"  class="checkBtn btn btbtn" value = "확인">    
		    </div>  
		  </div>     
	  </div>
	</div>  
</form>  


	
<!-- 회원 상세정보 modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="staticBackdropLabel"></h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      </div>
      
      <div class="modal-footer">
        <button type="button" class="gobackBtn btn-lg" data-bs-dismiss="modal" id = "closeModal">Close</button>
      </div>
    </div>
  </div>
</div>


	
	<script type="text/javascript">
$(function(){
		
		$(document).ajaxComplete(function(event, xhr, options){
			searchForm.find("[name='page']").val("");
		}).ajaxError(function(event, xhr, options, error){
			console.log(event);
			console.log(xhr);
			console.log(options);
			console.log(error);
		});
	
	

	let tbody = $('table>tbody');
	let pagingArea = $('#pagingArea');
	
	function makeTrs(idx,mem){
		let memNm = mem.memLnm + mem.memFnm
		let trs = [];
		let loginDe;
		if(mem.memLastLoginDe == null){
			loginDe = '-';
		}else{
			loginDe = mem.memLastLoginDe;
		}
		
		return $("<tr>").attr('id',mem.memId).append(
					$('<td>').html(idx + 1),
					$('<td>').html(mem.memId).css('color','red'),
					$('<td>').html(mem.memName),
					$('<td>').html(mem.memHp),
					$('<td>').html(mem.memEmail),
					$('<td>').append("<input type = 'button' class = 'insertBtn aceept popOpenBtnCmmn' value = '승인' data-type = 'modify' data-memid = '" + mem.memId+"'/>")
						.append("<input type = 'button' class = 'deleteBtn refuse popOpenBtnCmmn' value = '반려' data-type = 'refuse' data-mail = '" + mem.memEmail +"' data-memid = '" + mem.memId+"'/>"),
					$('<td class="checkBox">').append("<input type = 'checkbox' class = 'checkbox' name = 'memId'  value = '"+ mem.memId +"'/>")	
						
			);
		
		
	}

	$("#memInfo").on("click",".checkBox",function(e){
		e.stopPropagation();
		
	});
	
	
 	let searchForm = $('#searchForm').paging().ajaxForm({
		
		dataType : 'json',
		success : function(paging){
			tbody.empty();
			pagingArea.empty();
			
			let memList = paging.dataList;
			let trs = [];
			
			$(memList).each(function(idx,mem){
				if(mem.memJoinConfmAt == '0')
				trs.push(makeTrs(idx, mem));
			});
			
			tbody.html(trs);
			pagingArea.html(paging.pagingHTMLBS);
		}
		
 	}).submit(); 
 	
 	
 	
	$('#allCheck').on('change',function(){
		let checkBox = $(".checkbox");
		if($(this).is(":checked") == true){
			checkBox.prop("checked",true);
		}else{
			checkBox.prop("checked",false);
			
		}
	})
 	
	let staticBackdrop = $('#staticBackdrop').modal({
			show:false	
		}).on('show.bs.modal',function(event){
			let trTag = event.relatedTarget;
			console.log(trTag);
			if(!trTag) return false;
			let memId = trTag.id;
			
			let url = "${cPath}/admin/mem/detail/" + memId;
	 		$.ajax({
				url : url,
				dataType : "html",
				success : function(resp) {
					staticBackdrop.find(".modal-body").html(resp);
				},
				error : function(errorResp) {

				}
			});
	 		
		}).on('hidden.bs.modal', function(){
			staticBackdrop.find(".modal-body").empty();
	});
	

	$('table').on('click','tr[id]',function(){
		staticBackdrop.modal('show', this); 		
	})
	
	$('#closeModal').on('click',function(){
		staticBackdrop.modal('hide'); 
	})
 	
	$('table').on('click','.checkbox',function(e){
		e.stopPropagation();
	})

 	//비밀번호 표시
	$(".showPass").click(function(){
		if($(this).is(':checked')){
			$(".inputPass").attr('type', 'text');
		}else{ 
			$(".inputPass").attr('type', 'password');
		}
	});
	
	$('.totalAccept').on('click',function(){
		let cnt = 0;
		let inputs = $('#memInfo').find(":input[type='checkbox']");
		$(inputs).each(function(idx,val){
			if(val.checked){
				cnt++;
			}
		})
		console.log(cnt)
		if(cnt <= 0){
			Swal.fire({
		    	   title: '한명이상 체크하세요',
		    	   icon: 'error',
		    	   confirmButtonText: '확인'
		    	 })
		}else{
			 $('#popUp_allAccept').fadeIn(200);
			
			
		}
	
	})
	
	$('#passCheckForm_allAccept').ajaxForm({
		dataType : 'text', 
		success : function(result){
			if(result=='OK'){
				$('#totalAcc').ajaxForm({
					dataType : 'json',
					success : function(res){
						if(res == 'OK'){
							Swal.fire({
						    	   title: '일괄 승인이 완료되었습니다',
						    	   icon: 'success',
						    	   confirmButtonText: '확인'
						    	 }).then(function(){
							    	 location.href = "${cPath}/admin/mem/notaccept";
						    	 })
						}else{
							Swal.fire({
						    	   title: '실패...',
						    	   icon: 'error',
						    	   confirmButtonText: '확인'
						    	 })
						}
					}
					
				}).submit();
			}else{
				Swal.fire({
			    	   title: '비밀번호 오류',
			    	   icon: 'error',
			    	   confirmButtonText: '확인'
			    	 })
			}
		}
	})
	
	
	//비동기 본인확인
	$("#passCheckForm_accept").ajaxForm({
		dataType : 'text', 
		success : function(result){ 
			if(result=='OK'){   
				let memId = $('#hiddenMemId').val();
				let url = "${cPath}/admin/mem/accept/" + memId;
				$.ajax({
					url : url,
					dataType : "json",
					success : function(resp) {
						if(resp == 'OK'){
							 Swal.fire({
						    	   title: '승인이 완료되었습니다',
						    	   icon: 'success',
						    	   confirmButtonText: '확인'
						    	 }).then(function(){
							    	 location.href = "${cPath}/admin/mem/notaccept";
						    	 })
						}else{
							Swal.fire({
						    	   title: '승인에 실패하였습니다..잠시후 다시 시도해 주세요',
						    	   icon: 'error',
						    	   confirmButtonText: '확인'
						    	 })
							
						}
					},
					error : function(errorResp) {
						 
					}

				});
			}else if(result=='FAIL'){
				 Swal.fire({
			    	   title: '비밀번호 오류',
			    	   icon: 'error',
			    	   confirmButtonText: '확인'
			    	 })
			}    
		}     
	}); 
	
	$('#refuseCN').on('click',function(){
		$('#refuseCNval').val('사원 정보 미등록 사용자');
	})
	
	$("#passCheckForm_refuse").ajaxForm({
		dataType : 'json', 
		success : function(res){ 
			console.log(res)
			if(res == 'OK'){
				Swal.fire({
			    	   title: '반려처리가 완료되었습니다',
			    	   icon: 'success',
			    	   confirmButtonText: '확인'
			    	 }).then(function(){
				    	 location.href = "${cPath}/admin/mem/notaccept";
			    	 })
				
			}else if(res == 'INVALIDPASSWORD'){
				Swal.fire({
			    	   title: '비밀번호 오류',
			    	   icon: 'error',
			    	   confirmButtonText: '확인'
			    	 })
			}else{
				Swal.fire({
			    	   title: '실패...잠시후 다시 시도하세요',
			    	   icon: 'error',
			    	   confirmButtonText: '확인'
			    	 })	
			}
		}     
	}); 
 	
 		setPop();
})
//팝업 세팅
function setPop() {
	var popOpenBtn = $('.popOpenBtnCmmn');

	//팝업 열기
	$('table').on('click','.popOpenBtnCmmn' ,function(e) {
		e.stopPropagation();
		 let memId = $(this).data('memid');
		 let memEmail = $(this).data('mail');
		 var btnType = $(this).data('type');
		 $('.popBg, .popCloseBtnCmmn').attr('data-type',btnType);
		 $('#hiddenMemId').val(memId);
		 $('#hiddenMemEmail').val(memEmail);
		 $('#popUp_' + btnType ).fadeIn(200);
	})

	//팝업 닫기   
	$('.popBg, .popCloseBtnCmmn').on('click', function() {
		$(".inputPass").val("");  
		console.log($(this))
		 var type = $(this).attr('data-type');
		 $('#popUp_'+type).fadeOut(200);
	})
}
	</script>
