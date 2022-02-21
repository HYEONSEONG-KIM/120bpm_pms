<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table{
		text-align: center;
	}
	#searchBtn{
		margin-left: 3px;
		margin-top: -20px;
	}
	#searchWord,#searchType{
		height: 38px;
	}
	h3{
		text-align: center;
		margin-bottom: 25px;
	}
</style>
<link rel = "stylesheet" href = "${cPath}/resources/css/memView.css"/>
	<h3>120BPM 회원리스트</h3>
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
			</div>
		</div>
	</div>
	
	<table class = 'table'>
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>최종 로그인 날짜</th>
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

	<form id = "searchForm">
		<input type="hidden" name = "searchType"> 
		<input type="hidden" name = "searchWord">
		<input type="hidden" name = "page">
	</form>
	
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
		
		if(mem.memJoinConfmAt == '0'){
			return $("<tr>").attr('id',mem.memId).append(
					$('<td>').html(idx + 1),
					$('<td>').html(mem.memId).css('color','red'),
					$('<td>').html(mem.memName),
					$('<td>').html(mem.memHp),
					$('<td>').html(mem.memEmail),
					$('<td>').html(loginDe)
			);
		}else{
			return $("<tr>").attr('id',mem.memId).append(
					$('<td>').html(idx + 1),
					$('<td>').html(mem.memId).css('color','blue'),
					$('<td>').html(mem.memName),
					$('<td>').html(mem.memHp),
					$('<td>').html(mem.memEmail),
					$('<td>').html(loginDe)
			);
		}
		
	}
	
 	let searchForm = $('#searchForm').paging().ajaxForm({
		
		dataType : 'json',
		success : function(paging){
			tbody.empty();
			pagingArea.empty();
			
			let memList = paging.dataList;
			let trs = [];
			
			$(memList).each(function(idx,mem){
				trs.push(makeTrs(idx,mem));
				
			});
			
			tbody.html(trs);
			pagingArea.html(paging.pagingHTMLBS);
		}
		
	}).submit(); 
 	
 	let staticBackdrop = $('#staticBackdrop').modal({
 			show:false	
 		}).on('show.bs.modal',function(event){
 			let trTag = event.relatedTarget;
 			console.log(trTag)
 			if(!trTag) return false;
  			let memId = trTag.id;
  			console.log(memId)
 			
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
 	
 	
 	
	})
	
</script>
