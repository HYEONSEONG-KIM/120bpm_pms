<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<meta charset="UTF-8">
<script type="text/javascript" src="${cPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${cPath }/resources/js/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
 <link href="${cPath}/resources/gentelella-master/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
     
<link rel="stylesheet" href="${cPath }/resources/css/workList.css">
<link rel="stylesheet" href="${cPath }/resources/css/commons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script  src="${cPath}/resources/js/jquery.form.min.js"></script>
<script src = "${cPath}/resources/js/paging.js"></script> 
<style type="text/css">

.noAceess {
	text-align: center;
}
tr[id]:hover {
		background: rgba(247, 222, 140, 0.3)!important;
}

.sj {
 width:100px !important;
 white-space:nowrap !important; 
 overflow:hidden !important; 
 text-overflow: ellipsis !important;
 height: 20px !important;
 }
 
 
#par{
	display: grid;
	grid-template-columns :60% 40% ;
	width: 100%;
	margin-top: 1%;
	 /* justify-content: center; */
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
width: 180px!important;
  height: 40px!important;
  background-size: 20px!important;
  padding: 5px 30px 5px 10px!important;
  border-radius: 4px!important;
  outline: 0 none!important;

}

.searchOption{
margin-right: 5px;
   width:100px!important;
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
width: 260px!important;
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
padding-left: 20px!important;
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
.fixedWidth{
width: 400px!important;
}

.textRight{
text-align: right;
}


.input-group-prepend{
width: 100%;
}

 
.backColor{
 background-color: #FFFFFF;
} 

#searchText{
width: 270px;
}
.sizing{
overflow:auto;
height: 280px;
}

#workDetailInfo th{
background-color: #F0F9FC;

}
</style>
</head>
	
<security:authentication property="principal.adaptee" var="authMember" />
<security:authentication property="authorities" var="authMemRoles" />
 <table id="searchUI">
 
 <tr>
 	
 	 <td colspan="6">
			<div class="input-group inputgroups right">
 		 		
  <div class="input-group-prepend">
   <label class="labelLength">?????? ????????????</label> 
 		  <select id="pricode" name="workPriortCode" class="form-control left minimal marginRight">
 	 			<option value>?????? ????????????</option>
	 			<c:forEach items="${priortList }" var="priorty">
							<option value="${priorty.codeNo }">
								${priorty.codeNm }
							</option>
				
				</c:forEach>  
 		 </select>
  <label class="labelLength">?????? ?????? ?????? </label>
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
 		 	  <label class=" labelLength">????????????</label> 
 	 <select  class="form-control marginRight " id="category" name="ctgryCode">
				<option value>????????????</option>
				<c:forEach items="${cartegoryList }" var="cartegory">
					<option value="${cartegory.ctgryCode }">
						${cartegory.ctgryNm }</option>
				</c:forEach></select>
 			 	<label class="labelLength">
 	 ?????? ??????
 	</label>
 	 <select class="form-control" id="ReqStatus" name="workReqSttusCode">
				<option value>????????????</option>
				<option value="isNull">???????????? ???</option>
				<c:forEach items="${CommonList }" var="commons">
					<option value="${commons.codeNo }">
						${commons.codeNm }</option>
				</c:forEach>
			</select>	
			
 			<label class="marginRight">
 	 	?????? ??????
 		</label>
		 	<input type="text" name="searchWord" id="searchText" placeholder="????????? ??????" class="testTags form-control" />
	 		 <div class="input-group-append">
	 		 <button type="button" id="searchBtns" class="btnTags btn searchBtn">??????</button>
			<!-- <button type="button" id="resetBtn" class="btnTags btn resetBtn">?????????</button> -->
 			<button type="button" class="resetBtn btn"><img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button> 
	 		 </div>
 	 	</div>
 	 	</div>
 	</td>
 
 </tr>
 
 </table>
 
<div id = "par">
<div class="left">

 
		<table id="workList" class="table">


		<thead class="listHeader">
			<tr>
				<th>????????????</th>
				<th data-item='title' colspan="3">??????</th>
				<th data-item='memId'>????????? &nbsp;<i class="fa fa-sort sort"
					aria-hidden="true" data-item="MEM_NAME"></i>
				</th>
			</tr>
		</thead>



		<tbody id="listBody">

		</tbody>
		<tfoot>
			<tr>
				<td colspan="9">
 
					<div id="pagingArea" class="d-flex justify-content-center"></div>
				</td>
			</tr>
		</tfoot>
	</table>
					
	
	
		</div>
			
	
	<div class="right">
	 <div id="detail">
			<table class="table" id="workDetailInfo">
				<tr>
					<th colspan="">??????</th>
					<td colspan="4" class="sj workSj">?????? ??????</td>
				</tr>
				<tr>
					<th>??????</th>
					<td>????????????</td>
					<th>????????????</th>
					<td colspan="3" class="sj workCt">????????????</td>
				</tr>
				<tr>
					<th>????????????</th>
					<td>????????????</td>
					<th>????????????</th>
					<td colspan="2">????????????</td>
				</tr>
				<tr>
					<th>?????????</th>
					<td>?????????</td>
					<th>?????????</th>
					<td colspan="2">?????????</td>
				</tr>
				<tr>
					<th>?????????</th>
					<td>?????????</td>
					<th>?????????</th>
					<td colspan="2">?????????</td>
				</tr>
				<tr>
					<th colspan="6">??????</th>
				</tr>
				<tr>
					<td colspan="6"><div class="sizing">
							<p>??????</p>
							</div></td>
				</tr>
				<tr>
					<td colspan="6"></td>
				</tr>
			</table>


		</div>
	</div>	

</div>

 
<form id="searchForm" method="post"
		action="${cPath }/project/${pCode}/issue/create/myWorkListJson">
		<input type="hidden" name="ctgryCode"> 
		<input type="hidden"  name="workOthbcAt"> 
		<input type="hidden"  name="workReqSttusCode"> 
		<input type="hidden"  name="searchType" value="title"> 
		<input type="hidden"  name="searchWord"> 
		<input type="hidden"  name="startDate">
		<input type="hidden"  name="endDate"> 
		<input type="hidden"  name="page"> 
		<input type="hidden"  name="sidx"> 
		<input name="workPriortCode"  type="hidden" >
		<input type="hidden"  name="sortType" />
	</form>
 
					<!-- <div class="modal-footer">
				        <button type="submit" class="btn updateBtn check">??????</button>
				        <button type="button"  class="btn btn-secondary closeModal" data-bs-dismiss="modal">??????</button>
		     	 </div> -->



 <script>
//====================================
let tbody = $("#listBody")

	$("#detail").on("click" ,".addUpper" , function(){
	 	//let sj = 	$("#upperSj").val()
	 	/* console.log($(this).parent()[0].find(".upperWorkSj")) */
	 	
	 	var workCode = ($(this).parents().find(".workSj") );
	 	 var name = workCode[0]
	 	 opener.document.getElementById("workSjId").value = $(name).text();
	 	 opener.document.getElementById("workCodeId").value =$(this).data("workCode");
	 	 
	 	var workCt = ($(this).parents().find(".workCt") );
	 	 //--------------------------------------
	 	 opener.document.getElementById("ctgryCodeId").value =$(workCt).data("workCt");
	 	 opener.document.getElementById("ctgryNmId").value =$(workCt).text();

	 	 window.close();
	 	//$("#upperSj").val($(name).text())		
	 	//$("#upperId").val($(this).data("workCode"))		
		//console.log($(this).data("workCode"))
		 	  
});
	
	
 var searchForm = $("#searchForm")
 var WorkBody = $("#listBody")
 $("#searchType").val("${pagingVO.simpleSearch.searchType}");
 $("#searchWord").val("${pagingVO.simpleSearch.searchWord}");
 $("#startDate").val("${pagingVO.simpleSearch.startDate}");
 $("#endDate").val("${pagingVO.simpleSearch.endDate}");
 $("#carCode").val("${pagingVO.simpleSearch.ctgryCode}");
 /* $("[name='sidx']").val("${pagingVO.simpleSearch.sidx}");
 $("[name='sortType']").val("${pagingVO.simpleSearch.sortType}"); */
 searchForm.find("[name='page']").val("");
 var pagingArea = $("#pagingArea")

 var startDay  = $("input[name='startDate']")
 var endDay = $("input[name='endDate']")


 function allWork() {
 	$("[name='searchType']").val("");
 	$("[name='searchWord']").val("");
 	$("[name='startDate']").val("");
 	$("[name='endDate']").val("");
 	$("[name='ctgryCode']").val("");
 	$("[name='sidx']").val("");
 	$("[name='sortType']").val("");
 	$('#sidx').val('');
 	$('#sortType').val('');
 	searchForm.find("[name='page']").val("");
 	searchForm.submit();
 }

 $("tbody").on( "click", "tr[id]", function() {
	 var workCode = this.id;
 	  url = "${cPath}/project/${pCode }/work/create/search/"+ workCode ;
 		$.ajax({
 			url : url , 
 		    dataType : "json" , 
 		    method : "post",
 		    success : function(resp){
 		    	$("#detail").empty();
 		  	 
 		    	let inifo =	makeDetail(resp);
 		    	$("#detail").append(inifo)
 					 
 		   		 }//success
 		})
 	

 });

 function makeDetail(resp){
  return 	$("<table class='table'>").append(
 			 $("<tr>").append(
 					 $("<th colspan=''>").html("??????"),
 					 $("<td colspan='4' class='sj workSj'>").html(resp.workSj)
 					  ),
 		$("<tr>").append( 
 					 $("<th>").html("??????"),
 			    	 $("<td>").html(resp.workStatus) ,
 					 $("<th>").html("????????????"),
 			    	 $("<td colspan='3' class='sj workCt'>").data('workCt', resp.ctgryCode).html(resp.ctgryNm) 
 			    	 ),
 			 $("<tr>").append( 
 					 $("<th>").html("????????????"),
 					 $("<td >").html(resp.workReqNm),
 					 $("<th>").html("????????????"),
 			    	 $("<td colspan='2'>").html(resp.priortNm)
 			 ),
 			 $("<tr>").append( 
 					 $("<th >").html("?????????"),
 			    	 $("<td>").html(resp.memName),
 					 $("<th>").html("?????????"),
 					 $("<td  colspan='2'>").html(resp.workRgsde)
 					 
 					 ),
 		    $("<tr>").append( 		 
 					 $("<th  >").html("?????????"),
 			    	 $("<td >").html( resp.workBgnde!=null ?resp.workBgnde :'??????'),
 					 $("<th  >").html("?????????"),
 			    	 $("<td  colspan='2'>").html(resp.workBgnde!=null? resp.workEndde :'??????' )
 		    		),
 			$("<tr>").append(
 					$("<th  colspan='6'>").html("??????")
 					), 
 			$("<tr>").append(
 					 $("<td colspan='6'>").append(
 							$("<div class='sizing'>").html(resp.workCn)
 					 		)
 					 
 				),
 			$("<tr>").append(
 					$("<td colspan='6'>").html(
 							$("<button>").attr("class" , "addUpper btn btn-primary btn-lg btn-block").data("workCode" , resp.workCode).html("??????")
 						)
 					)
 				
 				).prop("id" , "workDetailInfo")
 	};

 	$("#searchBtns").on( "click", function() { 
		/* console.log($("#starting").val() )
		console.log($("#ending").val())
		 */
		if (    ($("#starting").val() != null && $("#ending").val() == null)
						|| ($("#ending").val() != null && $("#starting").val() == null)) {
			
					Swal.fire({
					  icon: "error",
					  title : "????????? ???????????????!",
					  text : "??????????????? ???????????? ?????? ??????????????????",
					  button :"??????",
					}) 
					return false;
				} else if (new Date($("#starting").val()).getTime() > new Date($("#ending").val()).getTime()) {
					 
					Swal.fire({
						  icon: "error",
						  title : "????????? ???????????????!",
							text : "?????????????????? ??????????????? ??????????????????.",
						  button :"??????",
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

						pagingArea.html(pagingVO.pagingHTMLBS);
					} else {
						trTags.push($("<tr>").html(
								$("<td>").attr("colspan", "9").html(
										"???????????? ????????? ???????????? ????????????.")));
					}
					tbody.append(trTags);
				}
			}).submit();



 function makeTrTag(work) {

 	if (work.workOthbcAt == 1) {
 		return $("<tr>")
 				.append(
 						$("<td>").html(work.ctgryNm),
 						$("<td colspan='3' class='sj'>").css("width" ,"30%" ).html(work.workSj),
 						$("<td>").html(work.memName)
 						 ).prop("id", work.workCode).prop("class",
 						work.workPriortCode).data("open", "y");

 	} else {

 		if (("${authMember.memId}" == work.memId) || ("${authVO.author}" == "ROLE_PM")) {
 			return $("<tr>")
 			.append(
 					$("<td>").html(work.ctgryNm),
 					$("<td colspan='3' class='sj'>").css("width" ,"30%" ).html(work.workSj),
 					$("<td>").html(work.memName) 
 					 ).prop("id", work.workCode).prop("class",
 					work.workPriortCode).data("open", "y");
 		} else {
 			return $("<tr>").append(
 					$("<td colspan='9'>").prop("class", "noAceess , sj").html(
 							work.memFnm + "?????? ????????????????????????")).data("open", "n");
 		}

 	}//????????? ?????? ?????? ???
 };
 
 </script>


 
 