<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<link rel="stylesheet" href="${cPath }/resources/css/commons.css">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/js/DataTables/datatables.min.css">
<script
	src="${pageContext.request.contextPath }/resources/js/DataTables/datatables.min.js"></script> --%>
<script type="text/javascript"
	src="${cPath }/resources/js/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
 <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
 
 
 

i {
	cursor: pointer;
}

.noAceess {
	text-align: center;
}

.link:hover {
	cursor: pointer;
}

tr[id]:hover {
	background: rgb(240, 249, 252, 0.6)!important;
}

.table{ 
width : 100%;
table-layout: fixed;
 min-height : 550px!important;
max-height:550px!important;
height: 550px!important;
/* background-color: #FFFFFF; */
margin-bottom: 0;
}

#listBody{
min-height : 482px!important;
max-height: 482px!important;
height: 482px!important;
}

 tfoot{
min-height : 500px!important;
max-height : 500px!important;

}  
 .links {
text-align: left;
font-size: 1.2em;
}

.progress{
width: 100px!important;
  background-color: #EEE6D5;
  -webkit-box-shadow: none;
  box-shadow: none;
  display: inherit;
}
 
 td{
 text-align: center;
 }
 
 
 .sj {
 width:100px;
 white-space:nowrap; 
 overflow:hidden; 
 text-overflow: ellipsis;
 height: 20px;
 text-align: left;
 }
 
.tooltip {
  position: relative;
  display: block;
 
}
 
  .tooltip-text {
 
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  position: absolute;
  z-index: 1;
	
  
}

.tooltip:hover:after .tooltip-text {
 
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}  


 
.backcolor{
background-color: #F3F3F3;
 
}


.right{
float: right;

}
 
#searchingArea{
  background-color: #FFFFFF;  
} 
.table tfoot td{
padding-top: 0;
padding-bottom: 0;
} 
.SOON {
	background-color: rgba( 255, 184, 184, 0.6)!important;
}

.PASSED{
	background-color: rgb(177, 177, 177 , 0.1)!important;
}

 
.border{
 border: 1px gray solid;
}

.left{
float: left;
}

.color{
 float: left;
width: 20px;
height: 20px;
 margin: 1px 1px 0px 0px;
 border: 1px gray solid !important;
}  


 
h2 {
  position: relative;
  display: inline-block;
  padding: 0 4rem;
}
h2::before, h2::after {
  position: absolute;
  top: 50%;
  display: inline-block;
  content: '';
  width: 50px;
  height: 1px;
  background: #212121;
}
h2::before {
  left: 0px;
}
h2::after {
  right: 0px;
}

.fixedWidth{
width: 400px!important;
}

.textRight{
text-align: right;
}

 

#searchUI{
clear: both;
display: table!important;
font-size: 1.4em!important;
/* font-weight: 700; */
padding: 10px;
/* width: 80%; */
} 


select{
width: 200px!important;
  height: 40px!important;
  background-size: 20px!important;
  padding: 5px 30px 5px 10px!important;
  border-radius: 4px!important;
  outline: 0 none!important;

}

.searchOption{
margin-right: 5px;
}


input[type='date']{
			height:40px;
            width:300px;
            border-radius: 4px!important;
}

.textCenter{
text-align: center;
}

input[type='text']{
			 height:40px;
            width:300px;
            border-radius: 4px;
            font-size: 20px;
}
select option {
 /*  background: black; */
/*   color: #fff; */
  padding: 3px 0!important;
}
input{
outline :none!important;
}
 
.divisionName{
width:200px!important;
}

#searchUI th ,#searchUI td{
 
}

#searchUI th{
width: 200px!important;
}
#searchUI {
justify-content: flex-end;
}
 

.dateTags{
width: 200px!important;
margin-top: 5px;
}

#searchUI label{
font-weight:600;
padding-left: 4px;
padding-right: 4px;
margin-top: 10px;
}

 
.inputgroups{
/* justify-content: flex-end !important; */
margin-top: 8px;
}

.minimal{
margin-top: 5px;

}

.marginRight{
margin-right: 20px;
}
.marginLeftRight{
justify-content: center;
padding-right: 20px!important;
}
.marginLeft{
margin-left: 20px;

}

.labelLength{
width: 130px;
}
.ctgryNm{
 width:120px;
 white-space:nowrap; 
 overflow:hidden; 
 text-overflow: ellipsis;
 height: 45px;
 text-align: left; 
}
.fixedArea{
height: 48.5px;
}
/* .col-md-11{
background-color: rgb(240, 248, 255, 0.5);
} */

.input-group-prepend{
width: 100%;
}

 
.backColor{
 background-color: #FFFFFF;
} 
.progress{
font-size: 12px;
line-height: 20px;
}

#headTitle{
	margin: 0;
}
</style>
<c:if test="${not empty message }">
	<script type="text/javascript">
		Swal.fire({
			 title: "잘못된 요청입니다!",
			  text:  "${message }",
			  icon: "error",
			  button: "OK",
			}) 
		
	</script>
</c:if>
<security:authentication property="principal.adaptee" var="authMember" />
<security:authentication property="authorities" var="authMemRoles" />
<div >
<div  class="right links xs-4">
			 <span class="link realLink" onclick="allWork()">전체일감 </span> <span  class="link">  &nbsp; &nbsp;|  &nbsp; &nbsp;</span> 
			 <span class="link realLink" onclick="myWork()">내일감</span><span  class="link">  &nbsp; &nbsp;|  &nbsp; &nbsp;</span> 
			 <span class="link realLink" onclick="bookMark()">⭐즐겨찾기 일감 &nbsp; &nbsp;|  &nbsp; &nbsp;</span>
			 <c:url value="/project/${pCode}/work/create" var="insertURL">
			 </c:url>
			 <span class="link realLink controlBtn" data-gopage="${insertURL }">새 일감 추가 <i class="fa fa-plus" aria-hidden="true"></i></span>
		</div>
</div>

<!-- <h1><strong></strong></h1> -->

<h1 id="headTitle" style = "font-weight: bold;"> <i class="fa fa-briefcase" aria-hidden="true"></i>&nbsp; &nbsp;전체 일감 리스트</h1>
 <div class="textRight">
 
	<button id="searchButton" class="searchBtn btn">상세검색<span>🔍</span></button>
	 
 </div>
<div id="searchingArea">
			  
 <div class="backColor"> 
 <table id="searchUI">
 
 <tr>
 	
  	 

 	 <td colspan="6">
			<div class="input-group inputgroups right">
 		 		
  <div class="input-group-prepend">
   <label class="labelLength">일감 우선순위</label> 
 		  <select id="pricode" name="workPriortCode" class="form-control left minimal">
 	 			<option value>일감 우선순위</option>
	 			<c:forEach items="${priortList }" var="priorty">
							<option value="${priorty.codeNo }">
								${priorty.codeNm }
							</option>
				
				</c:forEach>  
 		 </select>
  <label class="labelLength">일감 기간 설정 </label>
  <input class="dateTags form-control" type="date" id="starting" name="startDate" />
    <label class="marginLeftRight">~</label>
  	<input class="dateTags form-control" type="date" id="ending" name="endDate" />
  </div>
</div>
</td>  
	 
 </tr>
 
 <tr class="">
 	<td class='' colspan="6">
		<div class="input-group right inputgroups"  >
 		 <div class="input-group-prepend">
 		 	  <label class=" labelLength">카테고리</label> 
 	 <select  class="form-control marginRight " id="category" name="ctgryCode">
				<option value>카테고리</option>
				<c:forEach items="${cartegoryList }" var="cartegory">
					<option value="${cartegory.ctgryCode }">
						${cartegory.ctgryNm }</option>
				</c:forEach></select>
 		
 		 <select    class="form-control searchOption" name="searchType">
				<option value>전체</option>
				<option value="title">제목</option>
				<option value="memId">담당자</option>
	</select> 
		 	<input type="text" name="searchWord" id="searchText" placeholder="검색어 입력" class="testTags form-control" />
	 		 <div class="input-group-append">
	 		 <button type="button" id="searchBtns" class="btnTags btn searchBtn">검색</button>
			<!-- <button type="button" id="resetBtn" class="btnTags btn resetBtn">초기화</button> -->
 			<button type="button" class="resetBtn btn"><img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button> 
	 		 </div>
 	 	</div>
 	 	</div>
 	</td>
 
 </tr>
 
 </table>
 
</div>

  </div>
    
 <br> 
  <div class="color SOON"> 
		
	</div>
	<span class="left mr-2"> 
		종료일이 일주일 이전인 일감 
	</span>
	<div class="color PASSED">
		
	</div>
	<span class="left "> 
		 종료일이 지난 일감
	</span>
	
	<br><br> 
	<table id="workList" class="table">


		<thead class="listHeader">
			<tr>
				<th>카테고리</th>
				<!-- <i class="fa fa-sort sort" aria-hidden="true"  data-item="WORK_SJ"></i> -->
				<th data-item='title' colspan="3">제목</th>
				<th data-item='memId'>담당자 &nbsp;<i class="fa fa-sort sort"
					aria-hidden="true" data-item="MEM_NAME"></i>
				</th>
				<th data-item='workPriortCode'>우선순위 &nbsp;<i class="fa fa-sort sort" aria-hidden="true"
					data-item="WORK_PRIORT_CODE"></i>
				</th>
				<th>시작일자 &nbsp;</th>
				<th data-item="WORK_ENDDE">종료일자 &nbsp; <i
					class="fa fa-sort sort" aria-hidden="true" data-item="WORK_ENDDE"></i></th>
				<th>진척도 &nbsp; <i class="fa fa-sort sort" aria-hidden="true"
					data-item="WORK_PRGS_DGREE_POINT"></i></th>
			</tr>
		</thead>



		<tbody id="listBody">
			<c:set var="workList" value="${pagingVO.dataList }" />
		<c:choose>
			<c:when test="${empty workList }">
				<tr>
					<td colspan="8">조건에 맞는 글이 없음.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${workList }" var="board">
					<tr id="${board.ctgryNm}">
						<td>${board.workSj}</td>
						<td colspan='3'>${board.memName}</td>
						<td>${board.priortNm}</td>
						<td>${board.workBgnde}</td>
						<td>${board.workEndde}</td>
						<td>${board.workPrgsDgreePoint}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="9">
					<div id="pagingArea" class="d-flex justify-content-center"></div>
				</td>
			</tr>
		</tfoot>
	</table>
					
	
	 

	<form id="searchForm" method="post"
		action="${cPath }/project/${pCode}/workList/workListJson">
		<input name="ctgryCode" type="hidden"> <input name="searchType"  type="hidden"> <input
		 type="hidden"	name="searchWord"> <input  type="hidden" name="startDate"> <input
		 type="hidden"	name="endDate"> <input name="page"  type="hidden"> <input id="sidx"  type="hidden"
			name="sidx"  type="hidden"> <input id="sortType"  type="hidden" name="sortType" />
		<input name="workPriortCode"  type="hidden" >
	
	</form>


<script>
$(function(){
	let searchUI = $("#searchingArea"); 
 	
    $("#searchButton").on("click", function(){
       if(searchUI.is(":visible")){
          searchUI.slideUp();
       } else {
          searchUI.slideDown();
       }
    });
	

    setDefaultDate();
	 $('[data-toggle="tooltip"]').tooltip()

	
	
	 
})//달러펑션

 

function setDefaultDate(){
	 document.getElementById('ending').value = new Date().toISOString().substring(0,10);

	 var date= new Date();
	 var month = date.getMonth();
	 date.set(month - 1 )
	 //beforMonth = date.toISOString().substring(0,10);
	 var yyyy = date.getFullYear();
	 var mm = date.getMonth() +1 > 9 ? date.getMonth(): '0'+ date.getMonth();
	 var dd = date.getDate()> 9 ? date.getDate():'0' +date.getDate();
	 document.getElementById('starting').value =  (yyyy+"-"+mm+"-"+dd)
	 

}

	let searchForm = $("#searchForm")
	let tbody = $("#listBody")
	$("[name='searchType']").val("${pagingVO.simpleSearch.searchType}");
	$("[name='searchWord']").val("${pagingVO.simpleSearch.searchWord}");
	$("[name='startDate']").val("${pagingVO.simpleSearch.startDate}");
	$("[name='endDate']").val("${pagingVO.simpleSearch.endDate}");
	$("[name='ctgryCode']").val("${pagingVO.simpleSearch.ctgryCode}");
	/* $("[name='sidx']").val("${pagingVO.simpleSearch.sidx}");
	$("[name='sortType']").val("${pagingVO.simpleSearch.sortType}"); */
	searchForm.find("[name='page']").val("");
	let pagingArea = $("#pagingArea")

	let bgnde = $("input[name='startDate']")
	let endde = $("input[name='endDate']")

	sortResult = false; //asc

 	
	let searchingArea = $("#searchingArea")
	
	
	
	function bookMark(){
		
		location.href = "${cPath}/project/${pCode}/workList/myBookmarkList";	
	}
	
	
	$("tbody").on( "click", "tr[id]", function() {
				let workCode = this.id;
				///workDetail/{workCode}
				location.href = "${cPath}/project/${pCode}/workDetail/"+ workCode ;

			});
	
 
	 $(tbody).on("mouseenter",  ".sj",function() {
         if (this.offsetWidth < this.scrollWidth) {
             $(this).attr('title', $(this).text());
         } else {
             $(this).removeAttr("title");
         }
     });
	 
	 $(tbody).on("mouseenter",  ".ctgryNm",function() {
         if (this.offsetWidth < this.scrollWidth) {
             $(this).attr('title', $(this).text());
         } else {
             $(this).removeAttr("title");
         }
     });
	 
 

		
		
		
	function allWork() {
		$("[name='searchType']").val("");
		$("[name='searchWord']").val("");
		$("[name='startDate']").val("");
		$("[name='endDate']").val("");
		$("[name='ctgryCode']").val("");
		$("[name='sidx']").val("");
		$("[name='sortType']").val("");
		$('#sidx').val('');
		$("[name='workPriortCode']").val("");
		$('#sortType').val('');
		
		searchForm.find("[name='page']").val("");
		searchForm.submit();
		setDefaultDate();
	}

	$(".sort").on("click", function() {
		if (sortResult) { //true면 
			sortResult = false; //desc
			$("[name='sortType']").val("asc")
			$("[name='sidx']").val($(this).data("item"))
			searchForm.find("[name='page']").val("");
			searchForm.submit();
		} else {
			sortResult = true; //asc
			$("[name='sortType']").val("desc")
			$("[name='sidx']").val($(this).data("item"))
			searchForm.find("[name='page']").val("");
			searchForm.submit();
		}
	});

	$("#searchBtns").on( "click", function() { 
		/* console.log($("#starting").val() )
		console.log($("#ending").val())
		 */
		if (    ($("#starting").val() != null && $("#ending").val() == null)
						|| ($("#ending").val() != null && $("#starting").val() == null)) {
			
					Swal.fire({
					  icon: "error",
					  title : "잘못된 요청입니다!",
					  text : "시작일자와 종료일자 모두 선택해주세요",
					  button :"확인",
					}) 
					return false;
				} else if (new Date($("#starting").val()).getTime() > new Date($("#ending").val()).getTime()) {
					 
					Swal.fire({
						  icon: "error",
						  title : "잘못된 요청입니다!",
							text : "종료날짜보다 시작날짜가 작아야합니다.",
						  button :"확인",
						}) 
					return false;
				} else {
					$("[name='sidx']").val("");
					$("[name='sortType']").val("");
					$("[name='searchType']").val($("#searchOption").val());
					$("[name='searchWord']").val($("#searchText").val());
					$("[name='endDate']").val($("#ending").val());
					$("[name='startDate']").val($("#starting").val());
					$("[name='ctgryCode']").val($("#category").val());
					$("[name='workPriortCode']").val($("#pricode").val());
					searchForm.find("[name='page']").val("");
					searchForm.submit();
					 
					/*  $("#searchingArea").hide() */
				}
			})

	$(".resetBtn").on("click", function() {
		allWork();
	})

	$("#searchForm").paging().ajaxForm(
			{
				dataType : "json",
				success : function(pagingVO) {
					tbody.empty();
					pagingArea.empty();
					let workList = pagingVO.dataList;
					let trTags = [];
					if (workList && workList.length > 0) {
						$(workList).each(function(idx, work) {
							trTags.push(makeTrTag(work));
						});
						
						var ListWidth = trTags.length;
						if(ListWidth <10){
							for(var i = 0 ; i<10 - ListWidth;i++ ){
								trTags.push(
										$("<tr>").html(
												$("<td>").attr("colspan" , "9").prop("class" , "fixedArea")		
											)
									 )		
							}
						}
						
						
						pagingArea.html(pagingVO.pagingHTMLBS);
					} else {
						trTags.push(
								
								$("<tr>").html(
										$("<td>").attr("colspan", "9").prop("class" , "fixedArea").html("해당하는 업무가 존재하지 않습니다.")
										)
							);
						for(var i =0 ; i<9 ; i++ ){
						trTags.push(
								$("<tr>").html(
										$("<td>").attr("colspan" , "9").prop("class" , "fixedArea")		
									)
							)
							
						}
						
					}
						
						
					/* 	trTags.push($("<tr>").html(
								$("<td>").attr("colspan", "9").html(
										"해당하는 업무가 존재하지 않습니다.")));
					} */
					tbody.append(trTags);
					  
					if($("div").hasClass("colorChange")){
						   $(".colorChange").closest('.progress').html("0%");
						 //;
						/* $(this).parents("").text("0%"); */
					}  
				}
			}).submit();
	
	
	 function makeTrTag(work) {
		//if(work.workSj.)	
		 
		if (work.workOthbcAt == 1) {
		//let workSj= work.worksj
		
			return $("<tr>")
					.append(
							$("<td class='ctgryNm ' >").html(work.ctgryNm),
							$("<td colspan='3' class='sj'>").css("width" ,"30%" ).html(work.workSj),
							$("<td>").html(work.memName),
							$("<td>").html(work.priortNm),
							$("<td>").html(work.workBgnde != null ? work.workBgnde : "미정" ),
							$("<td>").html(work.workEndde != null ? work.workEndde : "미정" ),
							$("<td>")
									.append(
											$("<div>").prop("class", "progress")
													.append(
															$("<div>").attr(
																			{
																				"aria-valuemin" : "0",
																				"aria-valuemax" : "100",
																				"aria-valuenow" : work.workPrgsDgreePoiint
																			}
																			).prop("class" , work.workPrgsDgreePoint==0 ? "progress-bar colorChange ": "progress-bar").html(work.workPrgsDgreePoint + "%").css( "width", work.workPrgsDgreePoint)
															)
														)
													).prop("id", work.workCode).prop("class", work.workDateStatus).data("open", "y");

		} else {

			if (("${authMember.memId}" == work.memId) || ("${authVO.author}" == "ROLE_PM")) {
				
				return $("<tr>")
				.append(
						$("<td class='ctgryNm '>").html(work.ctgryNm),
						$("<td colspan='3' class='sj'>").css("width" ,"30%" ).html(work.workSj),
						$("<td>").html(work.memName),
						$("<td>").html(work.priortNm),
						$("<td>").html(work.workBgnde != null ? work.workBgnde : "미정" ),
						$("<td>").html(work.workEndde != null ? work.workEndde : "미정" ),
						$("<td>")
								.append(
										$("<div>").prop("class", "progress")
												.append(
														$("<div>").attr(
																{
																	"aria-valuemin" : "0",
																	"aria-valuemax" : "100",
																	"aria-valuenow" : work.workPrgsDgreePoint
																}
																).prop("class" , work.workPrgsDgreePoint==0 ? "progress-bar colorChange ": "progress-bar").html(work.workPrgsDgreePoint + "%").css( "width", work.workPrgsDgreePoint)

												)
												
								)).prop("id", work.workCode).prop("class",
						work.workDateStatus).data("open", "y");
			} else {
				return $("<tr>").append(
						$("<td colspan='9'>").prop("class", "noAceess , sj").html(
								work.memFnm + "님의 비공개일감입니다")).data("open", "n");
			}

		}//비공개 일감 처리 끝
	};
	
	function myWork(){
		location.href="${cPath}/project/${pCode}/workList/myWorkList"
	}


	$(".controlBtn").on('click', function(){
		 
		let gopage = $(this).data("gopage");
		if(gopage){
			location.href = gopage
		}
})
		
</script>

 



 
