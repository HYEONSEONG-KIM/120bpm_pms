<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script src="${pageContext.request.contextPath }/resources/js/paging.js" ></script>

<style>
.searchBtn{
	background: #69c7f0;
	border-color:#69c7f0;
	color : white;
}

.resetBtn{
	background: #fff;
	padding : 0; 
}  

.resetImg{
	width : 23px;
}

.newImg{
	width : 20px; 
}   

.newBtn{ 
	background: white;
	border-color: #aba9a9;
}

.table{
	padding : 0 3px;
	cursor: pointer;
	font-size: 1.1rem;
}

.table tr{
	background: white;
}  

.table th {  
	padding: 0 10px;
	vertical-align: middle; 
	text-align: center;  
	line-height: 3.0;
}    
   
.table td{ 
	padding: 0 10px;
	vertical-align: middle; 
	text-align: center;  
	line-height: 2.7;
}  

.table tfoot tr{
	background: transparent;
} 

.table tfoot td{
	padding : 30px 0;
} 

.pagingArea{
	display : flex;
	justify-content: center;
}

#searchUI{
	width:100%;
	display: flex;
	justify-content: flex-end;
	line-height: normal;
	flex-direction: column;
} 

#searchUI input, #searchUI select{ 
	font-size: 1.1rem; 
	font-weight: 300;
	border: 1px solid #aba9a9;
} 

#searchUI label{ 
	padding-left: 20px;
	font-size: 1.0rem;
}

.searchUIInput{
	display:inline-block;   
}   

.searchUIBtn, .newWriteBtn{ 
	display: inline-flex;
	flex-wrap: wrap; 
	justify-content: flex-end;  
	float: right;
	padding-bottom: 10px;
	vertical-align: top; 
	margin-top: auto;
}

.reset{
	display:inline-block;    
}

</style>

<security:authentication property="principal.adaptee" var="authMember" />
<security:authentication property="authorities" var="authMemRoles" />
                                              

	<div id="searchUI" class="row">
		<div class="newWriteBtn">
			<button type="button" class="newBtn btn">
				<img class="newImg" src="${cPath}/resources/imgs/img/new.png">
				글쓰기
			</button>
		</div>
		<br>
		<div>
			<div class="searchUIInput">
				<label>검색</label> 
				<select name="searchType" id = "searchType"> 
					<option value>전체</option>
					<option value="title">제목</option>
					<option value="memId">작성자</option>
				</select>
				<input type="text" name="searchWord" class="testTags" />
			</div>
			<div class="searchUIBtn">
				<button type="button" id="searchBtn" class="btnTags btn searchBtn">검색</button>
				<button type="button" class="btnTags resetBtn btn">초기화<img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button> 
			</div>
		</div>
	</div> 
	
	
	<table id="wikiList" class="table">
		
		<thead class="listHeader">
			<tr>
				<th data-item="rownum">정렬 번호</th>
				<th data-item="boSj" colspan="3">제목</th>
				<th data-item="memId">작성자</th>
				<th data-item="boRgsde">등록일</th>
				<th data-item="likeCnt">좋아요수</th>
			</tr>
		</thead>
		
		<tbody id="listBody">
		
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="8">
					<div id="pagingArea" class="d-flex justify-content-center">
					
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<form id="searchForm" method="post"	action="${cPath }/project/5/wikiListJson">
		<input type="hidden" name="searchType">
		<input type="hidden" name="searchWord">
	</form>
	
<script src="${cPath }/resources/js/paging.js"></script>		
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
		
		$("[name='searchType']").val("${pagingVO.simpleSearch.searchType}");
		$("[name='searchWord']").val("${pagingVO.simpleSearch.searchWord}");
		
		let tbody = $("#listBody");
		let pagingArea = $("#pagingArea"); 
		
		function makeTrTag(board){
			return $("<tr>").append(
				$("<td>").html(board.rnum),		
				$("<td colspan='3'>").html(board.boSj),		
				$("<td>").html(board.memId),		
				$("<td>").html(board.boRgsde),		
				$("<td>").html(board.likeCnt)
			).prop("id", board.boNo);
		}
		

		$("#searchForm").paging()
						.ajaxForm({
							
							dataType:"json",
							success:function(pagingVO){
								tbody.empty();
								pagingArea.empty();
								
								let boardList = pagingVO.dataList;
								let trTags = [];
								
								if(boardList && boardList.length > 0){
									
									$(boardList).each(function(idx, board){
										trTags.push( makeTrTag(board) );
									});
									
									pagingArea.html(pagingVO.pagingHTMLBS);
									
								}else{
									
									trTags.push(
										$("<tr>").html(
											$("<td>").attr("colspan", "8").html("조건에 맞는 결과가 없음.")	
										)			
									);
									
								}
								tbody.append(trTags);
							}
						}).submit(); 

	});

</script>































