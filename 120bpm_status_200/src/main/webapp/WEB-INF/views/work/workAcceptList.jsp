<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${cPath }/resources/js/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
 <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" 
integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
 <link rel="stylesheet" href="${cPath }/resources/css/commons.css"> 
<style>
.circleDiv {
	border-radius: 30px;
	height: 130px;
	width: 150px;
	background-color: white; 
	display: inline-flex;
	margin : 0 100px; 
	text-align: center;
	flex-wrap: wrap;
	justify-content: center;
}
.circleDiv div{
	margin : auto;
	color : black; 
	font-size: 1rem;
} 
em{ 
	font-weight: bold;
	font-size: 2rem;
	color : #42B4E6;
} 

#colDiv{ 
	font-size: 15px;
} 

 
.tooltip {
  display: inline-block;
  color: deeppink;
  font-weight: bold;
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
	transform: translate(-50%, -50%);
	bottom: 100%;
	left: 50%;
  
}

.tooltip:hover:after .tooltip-text {
    display: block;
    content: attr(data-tooltip-text);
    position: absolute;
    bottom: 100%;
    right: 0; 
    background-color: rgba(0, 0, 0, 0.8);
    color: #FFFFFF; 
    font-size: 13px;
    padding: 7px 12px;
    width: auto;  
    z-index: 9999; 
  
}
 
<!-- -->
.wrap_section_contents{
display: none;
}
.wrap_section_contents_open{
background-color:white;
}

.wrap_section_contents{

background-color:white;
}
 
#searchingArea{
 	display: none;
} 
.SOON {
	background-color: rgba( 255, 184, 184, 0.6)!important;
}

.PASSED{
	background-color: rgb(177, 177, 177 , 0.1)!important;
}
 

#searchUI{
clear: both;
display: table!important;
font-size: 1.4em!important;
/* font-weight: 700; */
padding: 10px;
/* width: 80%; */
} 

 
.divisionName{
width:200px!important;
}

#searchUI label{
font-weight:600;
padding-left: 4px;
padding-right: 4px;
margin-top: 10px;
}

.color{
 float: left;
width: 20px;
height: 20px;
 margin: 1px 1px 0px 0px;
}  

 

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	font-size: 1.4em;
}
 

ul.tabs li.current{
	background: white;
	color: #222;
	font-weight: 700;
	
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
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



  .modal__background{
  position: fixed;
  top:0; left: 0; bottom: 0; right: 0;
  background: rgba(230, 230, 230, 0.8);
}  


 .modal {
        text-align: center;
         border-radius: 10px;
         font-size: 1.3em;
         
}

.refuse{
	box-shadow:inset 0px 1px 0px 0px #f5978e;
	background-color:#f24537;
	border-radius:6px;
	border:1px solid #d02718;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding::6px 17px;
	text-decoration:none;
	text-shadow:0px 1px 0px #810e05;
}

.refuse:hover {
	background-color:#c62d1f;
	color:#ffffff;
}
.refuse:active {
	position:relative;
	top:1px;
}

.approve:hover  #allAccept:hover{
	/* background:linear-gradient(to bottom, #1e62d0 5%, #3d94f6 100%); */
	background-color:#1e62d0;
	color:#ffffff;
}
.approve:active   #allAccept:active{
	position:relative;
	top:1px;
	
}


.approve , #allAccept{
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background-color:#3d94f6;
	border-radius:6px;
	border:1px solid #337fed;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding::6px 17px;
	text-decoration:none;
	text-shadow:0px 1px 0px #1570cd;
}

.table{ 
width : 100%;
table-layout: fixed;
 min-height : 550px!important;
max-height:550px!important;
height: 550px!important;
/*  */
}

#listBody{
min-height : 482px!important;
max-height: 482px!important;
height: 482px!important;
}

.table tfoot td{
padding-top: 0;
} 

#detailSearch{
background-color: white;
}
.wrap_section_contents_open{
 
}
.wrap_section_contents_open{
margin:0;
}

  h2{
font-size :1.3em;
}  
 
 
 
#searchingArea{
 background-color: #FFFFFF;  
} 
 .show{
 
 text-align: right;
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
width: 180px!important;
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

#searchUI input[type='text']{
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
/* border: 2px black solid; */
/* justify-content: flex-end; */
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
#acceptCheckForm input[type='text']{
width: 80%;
}
#acceptCheckForm input[type='password']{
width: 80%;
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
width: 120px;

}
.ctgryNm{
 width:120px;
 white-space:nowrap; 
 overflow:hidden; 
 text-overflow: ellipsis;
 height: 45px;
 text-align: left; 
}

 

.input-group-prepend{
width: 100%;
}

 
.backColor{
 background-color: #FFFFFF;
} 
.prior{
width: 100px!important;

}
 

.pMem{
width: 140px!important;
}

.fixedArea{
height: 48px;

}
.menuName{
width: 40%;
display: inline;
}

.widthMininal{
 
float: right;
}
</style>
</head>
<body>
 <security:authentication property="principal.adaptee" var="authMember"/> 
 <h1 class='menuName' style = "text-align: left; font-weight: bold;"> <i class="fa fa-briefcase" aria-hidden="true"></i>&nbsp; &nbsp;PM ?????? ??????</h1>
 
 <div class="textRight widthMininal">
 
	<button id="searchButton" class="searchBtn btn">????????????<span>????</span></button>
	 
 </div>
<div id="searchingArea">
			  
 <div class="backColor"> 
 <table id="searchUI">
 
 <tr>
 	
  	 

 	 <td colspan="6">
			<div class="input-group inputgroups right">
 		 		
  <div class="input-group-prepend">
   <label class="labelLength">?????? ????????????</label> 
 		  <select id="pricode" name="workPriortCode" class="form-control left minimal">
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
 <tr>
	<td>
			<div class="input-group right inputgroups"  >
 		 <div class="input-group-prepend">
 		 	  <label class=" labelLength">????????????</label> 
 	 <select  class="form-control " id="category" name="ctgryCode">
				<option value>????????????</option>
				<c:forEach items="${cartegoryList }" var="cartegory">
					<option value="${cartegory.ctgryCode }">
						${cartegory.ctgryNm }</option>
				</c:forEach></select>
				
				<label class="labelLength">?????????</label> 
 			<select  class="form-control pMem " name="memId" id="pMember">
						<option value>?????????</option>					
				<c:if test="${not empty pMember}">
				<c:forEach items="${pMember}" var="mem">
					<option value="${mem.memId}">
				 ${mem.memName}
					</option>
				</c:forEach>
				</c:if>
					</select>
 		 <input type="text" class="form-control length" placeholder="????????? ?????? ??????"  name="searchWord"  id="title">
 			<button type="button" id="searchBtn" class="btnTags btn searchBtn">??????</button>
			<!-- <button type="button" id="resetBtn" class="btnTags btn resetBtn">?????????</button> -->
 			<button type="button" class="resetBtn btn"><img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button> 
 		</div>
 		</div>
 		</td>
    </table>
 </div>
 
</div> 
 <div>
 <br>
<div class="d-flex justify-content-center">
	<div class="circleDiv">
		<div>
			<span class="bold">?????? ?????? ??????</span><br>
			<span><em>${reqCount }</em> ???</span>
		</div>
	</div>
	<div class="circleDiv lightblue">
		<div>
			<span class="bold">????????? ??????</span><br>
			<span><em>${acceptCount }</em> ???</span>
		</div>
	</div>
	<div class="circleDiv lightgreen">
		<div>
			<span class="bold">?????? ??????</span><br> 
			<span><em>${rejectCount }</em> ???</span> 
		</div>
	</div>
</div> 
 
</div>
 <br><br>
 	<div class="color SOON">
		
	</div>
 	 	<span class="left"> 
		???????????? ????????? ????????? ??????
	</span>
	<div class="color PASSED">
		
	</div>
	<span class="left "> 
		 ???????????? ?????? ??????
	</span>
		
<br><br> 
 
<div class="wrap">
		<div class="tab_btn">
				 
		</div>
		<ul class="tabs">
		<c:forEach items="${CommonList }" var="common">
		<c:choose>
			<c:when test="${common.codeNo eq 'W00301' }">
					<li class="tab-link current" data-tab="${common.codeNo }">${common.codeNm }</li>
			</c:when>
			<c:otherwise>
					<li class="tab-link " data-tab="${common.codeNo }">${common.codeNm }</li>
			</c:otherwise>
		</c:choose>
		
		</c:forEach> 
		
	 
	</ul>
		

</div>

	<table id="workList" class="table">

		<thead class="listHeader">
			<tr>
				<th colspan='2' class="selectAll selectCheck">????????????
				<input class="selectCheck" id="allCheck" type="checkbox" > </th>
				<th colspan='2'>????????????</th>
				<!-- <i class="fa fa-sort sort" aria-hidden="true"  data-item="WORK_SJ"></i> -->
				<th data-item='title' colspan="2">?????? &nbsp; <i class="fa fa-sort sort" aria-hidden="true"  data-item="WORK_SJ"></i></th>
				<th colspan='2' data-item='MEM_NAME'>????????? &nbsp;<i class="fa fa-sort sort"
					aria-hidden="true" data-item="MEM_NAME"></i>
				</th>
				<th class="prior" data-item='workPriortCode'>????????????<i class="fa fa-sort sort" aria-hidden="true"
					data-item="WORK_PRIORT_CODE"></i>
				</th>
				<th colspan='2' data-item="WORK_ENDDE">????????????<i
					class="fa fa-sort sort" aria-hidden="true" data-item="WORK_ENDDE"></i></th>
				<th colspan='2'><span id="btnArea"></span> </th>
			</tr>
		</thead>

<tbody id="listBody">

		</tbody>
  
		<tfoot>
			<tr>
				<td colspan="13">
					<div id="pagingArea" class="d-flex justify-content-center"></div>
				</td>
			</tr>
		</tfoot>
	</table>


 
	
<!--????????? ???????????? ?????? -->
  <div id="background">
		 <div class="modal fade checkModal" id="acceptModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-fullscreen-lg-down  modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="staticBackdropLabel" >
		       	  <i class="fa fa-pencil-square-o" aria-hidden="true"></i> 	???????????? ??????
		    </h2>
		      		 <a class="btn-close trigger closeModal" href="#">
       					 <i class="fa fa-times" aria-hidden="true"></i>
    				  </a>
		      </div>
		      <div class="modal-body">
		      <span>?????? ????????? ??????????????? ?????? ???????????? ???????????????.</span><br> 
		      	<form id="acceptCheckForm" action="${cPath }/project/${pCode }/work/manage/create/acceptChcek"  method="Post" >
		      	 	 <div class="form-inline form-group" >
		      	 		<label>????????????</label>
		      			<input  type="password" onkeyup="enterDown()" id="pmAcceptCheck"  name="memPass" class="form-control inputPass memIdCheck clearValue" placeholder="???????????? ??????" required>
		      		</div>
		      		<input type="hidden" class="clearValue" name="memId" >
		      		<input type="hidden"id="workCodeArray" class="clearValue" name="workCodes" >
		      		<!-- <input type="hidden"id="memEmail" name="memMails" > -->
		      	</form>
		    	<div class='show'> <button type="button"  class="btn btn-sm btn-light showMemPass" >???????????? ??????<span class="checkAt"><i class="far fa-square"></i></span></button></div>
		      <div class="modal-footer">
		        <button type="button" id="acceptChecking"    class="btn updateBtn check">??????</button>
		        <button type="button"  class="btn btn-secondary closeModal" data-bs-dismiss="modal">??????</button>
		      </div>
				 
		      </div>
		    </div>
		  </div>
		</div>
		</div>
		
			
<!-- ????????? ???????????? ?????? & ???????????? ?????? -->
  <div id="background">
		 <div class="modal fade checkModal" id="refuseModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-fullscreen-lg-down  modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 onclick="dataSet()" class="modal-title" id="staticBackdropLabel" >
		       	  <i class="fa fa-pencil-square-o" aria-hidden="true"></i> ????????????
		    </h2>
		      		 <a class="btn-close trigger closeModal" href="#">
       					 <i class="fa fa-times" aria-hidden="true"></i>
    				  </a>
		      </div>
		      <div class="modal-body">
		       <h3 style="text-align: center;">??????????????? ??????????????? ???????????????</h3>
		      	<form id="refuseForm" method="Post" action="${cPath }/project/${pCode}/work/manage/create/refuse">
		      	 <div>
		    		 <label for="workReturnWhy"></label>
		    		<textarea rows="9" cols="5" class="holderArea form-control clearValue" name="workReturnWhy"></textarea>
		    	</div>
		    	<input type="hidden" id="refuseMail"  name="memEmail">
		    	<!-- <input type="hidden" name="memId" > -->
		    	<input type="hidden"  id="refuseWorkCode" name="workCode" >
		    	<input type="hidden" id="refuseWorkSj" name="workSj" >
		    	<input type="hidden" id="refuseMemName" name="memName" >
		    	<input type="hidden" id="refuseMemId" name="memIds">
		    	<br><br> 
		    	<input  type="password"  name="memPass" id="refuseMemPass" class="form-control inputPass memIdCheck clearValue" placeholder="???????????? ??????" required>
		      	</form>
		    	<div class='show'> <button type="button"  class="btn btn-sm btn-light showMemPass ">???????????? ??????<span class="checkAt"><i class="far fa-square"></i></span></button></div>
		      <div class="modal-footer">
		        <button type="submit" id="refuseBtn" class="btn updateBtn check ">??????</button>
		        <button type="button"  class="btn btn-secondary closeModal" data-bs-dismiss="modal">??????</button>
		      </div>
				 
		      </div>
		    </div>
		  </div>
		</div>
		</div>
			
		
		
<form id="searchForm" method="post" action="${cPath }/project/${pCode }/work/manage/workList">
		   <input name="ctgryCode"  type="hidden" >
		   <input name="searchType" value="title"   type="hidden"  > 
		   <input name="searchWord"  type="hidden" > 
		   <input name="startDate"  type="hidden" >
		   <input name="endDate"  type="hidden" >
		   <input name="workPriortCode"  type="hidden" >
		   <input name="memId"  type="hidden" >
		   <input  name="workReqSttusCode" value="${defalutReq}"  type="hidden" > <!-- type="hidden" -->
		   <input name="page"  type="hidden" > 
		   <input id="sidx"  type="hidden"name="sidx"  type="hidden" > 
		   <input id="sortType"  name="sortType"  type="hidden" />
	</form>

	
<script type="text/javascript">
let searchForm = $("#searchForm")
let tbody = $("#listBody")
let pagingArea = $("#pagingArea")
let btnArea = $("#btnArea");

let bgnde = $("input[name='startDate']")
let endde = $("input[name='endDate']")

/* let memMails = []; */
 
//????????? ???????????? ?????? req  ????????? ????????? ?????? ??????????????? ??? //reset ????????? 
let sendWorkId = [];
 
let checkAt = $(".checkAt")
function enterDown() {
	if (window.event.keyCode == 13) { 
		//formSubmit();
		/* $("#acceptCheckForm").submit(); */
	 } 
	}
 
 
 function dataSet(){
	 $("[name='workReturnWhy']").val("????????? Exception??? ???????????????. ?????? ??? ?????? ?????? ????????????.")
 }
 
$("#acceptChecking").on("click" , function(){
	$("#acceptCheckForm").submit();
	
})
 
$(tbody).on("mouseenter",  ".ctgryNm",function() {
    if (this.offsetWidth < this.scrollWidth) {
        $(this).attr('title', $(this).text());
    } else {
        $(this).removeAttr("title");
    }
});

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

 
$(tbody).on("click" ,".refuse" , function(){
	
		var workCode = $(this).closest("tr").attr("id")
	    var memMail = $(this).data("memMail");
	    var workSj = $(this).closest("tr").find(".sj").text();
	    var memName = $(this).closest("tr").find(".memName").text();
	    var memName = $(this).closest("tr").find(".memName").text();
	    var memIds = $(this).closest("tr").find(".memName").data("memId");
	    console.log(memIds)
	    $("#refuseMemName").val(memName)
	    $("#refuseWorkSj").val(workSj)
	    $("#refuseWorkCode").val(workCode)
	    $("#refuseMail").val(memMail)
	    $("#refuseMemId").val(memIds)
		$("#refuseModal").show();  
	   $("[name='workReturnWhy']").focus();
	    $( '#background' ).addClass( 'modal__background' );
})


let refuseForm= $("#refuseForm") 

$("#refuseBtn").on("click" , function(){
	refuseForm.submit();
})




//================================ ??????  ??? ??????????????? ?????????============================
$(function(){
	
let searchUI = $("#searchingArea"); 
 	
    $("#searchButton").on("click", function(){
       if(searchUI.is(":visible")){
          searchUI.slideUp();
       } else {
          searchUI.slideDown();
       }
    });
	
	 
	$("#refuseForm").ajaxForm({
			 dataType :"text",
			 traditional : true,
			 success:function(resp){
				 if(resp=="OK"){
					 Swal.fire({
						 title: "?????? ??????",
						  text:  "?????? ????????? ??????????????????",
						  icon: "success",
						  button: "OK",
					}).then(function(){
						 location.reload();
						   $("#refuseMemName").val("")
						    $("#refuseWorkSj").val("")
						    $("#refuseWorkCode").val("")
						    $("#refuseMail").val("")
						    $("#refuseMemId").val("")
						       $("[name='workReturnWhy']").val("");
				    });
					 
				 }else if(resp=="NOTAUTH"){
					 Swal.fire({
						 title: "?????? ??????",
						  text:  "??????????????? ???????????? ????????????",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						arrayClear();
						
				    });
					
				 }else if(resp="SENDFAIL"){
					 Swal.fire({
						 title: "?????? ?????? ?????? ??????",
						  text:  "?????? ?????????????????? ??????????????????",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						arrayClear();
						
				    });
					 
				 }
			 }
		
		})
		
	//
	
	
	
	 //===========????????? ??????????????? ????????? 
		$("#acceptCheckForm").ajaxForm({
			 dataType :"text",
			 traditional : true,
			 success:function(resp){
				 if(resp=="OK"){
					 Swal.fire({
						 title: "?????? ??????",
						  text:  "?????? ?????? ????????? ??????????????????",
						  icon: "success",
						  button: "OK",
					}).then(function(){
						 location.reload();
				    });
					 
				 }else if(resp=="NOTAUTH"){
					 Swal.fire({
						 title: "?????? ??????",
						  text:  "??????????????? ???????????? ????????????",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						arrayClear();
						
				    });
					
				 }else if(resp="SENDFAIL"){
					 Swal.fire({
						 title: "?????? ?????? ????????????",
						  text:   "?????? ?????? ???????????? ??????????????????",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						arrayClear();
						
				    });
					 
				 }
			 }
		
		})
	
		
	
		setDefaultDate();
	
		 
		
	
});
 

$("#resetBtn").on("click" , function(){
	reset();
})


$("#searchBtn").on("click" , function(){

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
		
		 searchForm.find("[name='page']").val("");
		 searchForm.submit(); 
		 setDefaultDate();
	}
})

//==========================================

  $("#btnArea").on("click" ,"#allAccept",  function(){
	checkedArray();
	if(sendWorkId.length== 0){
			Swal.fire({
				 title: "?????? ?????? ??????",
				  text:  "????????? ????????? ???????????? ????????????",
				  icon: "error",
				  button: "OK",
			}) 
	}else{
		$("#workCodeArray").val(sendWorkId)
		/* $("#memEmail").val(memMails) */
		 $( '#background' ).addClass( 'modal__background' );
			$("#acceptModal").show();
	}
})  
 
//=======================================
$("[name='searchWord']").val("${pagingVO.simpleSearch.searchWord}");
$("[name='startDate']").val("${pagingVO.simpleSearch.startDate}");
$("[name='endDate']").val("${pagingVO.simpleSearch.endDate}");
$("[name='ctgryCode']").val("${pagingVO.simpleSearch.ctgryCode}");
$("[name='workReqSttusCode']").val("${pagingVO.simpleSearch.workReqSttusCode}");
$("[name='searchType']").val("title");
searchForm.find("[name='page']").val("");


let acceptModal	=	$("#acceptModal")

sortResult = false; //asc
 
 
 
//===========================
	function checkedArray(){
	 	  let cnt = 0 ; 
	 	  
	let checked = $(".myCheck:checked").each(function(){
    	  let value = $(this).closest("tr").attr("id")
    	  cnt ++;
    	  sendWorkId.push(value)
  
	})
	
		if(cnt==0){
			Swal.fire({
				  icon :"error", 
				  text: "????????? ????????? ????????????",
				  button: "??????"
			})
		}
		/* return sendWorkId  */
	}
	
	
//===================????????? ???????????? 
$(".showMemPass").on("mouseup" , function(){
$(".memIdCheck").attr("type" , "password");
checkAt.html('<i class="far fa-square"></i>')
});

//===================????????? ???????????? 

$(".showMemPass").on("mousedown" , function(){
$(".memIdCheck").attr("type" , "text");
checkAt.html("<i class='far fa-check-square'></i>")
/* checkAt.html('<i class="fa fa-check-square" aria-hidden="true"></i>') */
});
//======================
function arrayClear(){
	 $(".checkModal").hide();
	  $( '#background' ).removeClass( 'modal__background' );
	  $(".clearValue").val("");
	  $(".memIdCheck").val("");  
	  sendWorkId = [];
}

//======================?????? ?????? ======================
	$(".closeModal").on("click" , function(){
		arrayClear();
/* 	  $(".checkModal").hide();
	  $( '#background' ).removeClass( 'modal__background' );
	  $(".memIdCheck").val("");  
	  $(".clearValue").val(""); */
}) 
//=====================================================	
//?????? ??????
$(".sort").on("click", function() {
	if (sortResult) { //true??? 
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



let btnDetail = $(".btn-detail")

let changeIcon = $(".changeIcon");
/* let status =	$("[name='workReqSttusCode']") */
//========?????? ????????? ???????????? ?????? ???????????? ??????????????????============================================

 	
$(function(){
	$("[name='workReqSttusCode']").val("W00301");
	btnArea.append(
			
				$("<button>").prop("class" , "btn ").prop("id" , "allAccept").html("?????? ??????")
				)
				 
	 $("#searchForm").submit();
	
	
	setDefaultDate();
})
//=====================================================

 //????????? ????????? ?????? ?????? ??????
$("tbody").on("click" , ".whyNot" , function(){
	 
	 $.ajax({
		url : "${cPath}/project/${pCode}/workDetail/returnWhy",
		data : {"workCode" : $(this).data("workCode")},
		dataType :"json",
		type : "post",
		success :function(resp){
			//console.log(resp)
		if(resp.result =="SUCCESS"){
			Swal.fire({
				  icon :"info", 
				  text: resp.why,
				  button: "??????"
				});
		}else{
			Swal.fire({
				  icon :"error", 
				  text: resp.why,
				  button: "??????"
				});
			
		}
	 }
	});  
	
});	

  
  
 

//==============================????????? ??????=============================
///?????????
  $("#searchForm").paging().ajaxForm({
			dataType : "json",
			success : function(pagingVO) {
				tbody.empty();
				pagingArea.empty();
				let workList = pagingVO.dataList;
				let trTags = [];
				if (workList && workList.length > 0) {
					$(workList).each(function(idx, work) {
						trTags.push(makeTrTags(work));
					});
				 
				   sendWorkId = [] 
					
				   var ListWidth = trTags.length;
					if(ListWidth <10){
						for(var i = 0 ; i<10 - ListWidth;i++ ){
							trTags.push(
									$("<tr>").html(
											$("<td>").attr("colspan" , "13").prop("class" , "fixedArea")		
										)
								 )		
						}
					}
				   
				   
				   
					if($("[name='workReqSttusCode']").val()!="W00301"){
						/* $(".selectCheck").hide(); */
						$("#allAccept").hide(); 
					}else{
						/* $(".selectCheck").show(); */
						$("#allAccept").show(); 
						
					}
					
					pagingArea.html(pagingVO.pagingHTMLBS);
				} else {
					var none = [] ;
					
					trTags.push(
							
							$("<tr>").html(
									$("<td>").attr("colspan", "13").html("???????????? ????????? ???????????? ????????????.")
									)
						);
					for(var i =0 ; i<9 ; i++ ){
						
					trTags.push(
							$("<tr>").html(
									$("<td>").attr("colspan" , "13").prop("class" , "fixedArea")		
								)
						)
						
					}
				}
				tbody.append(trTags);
			}
		}).submit();
 
  //////////////////////////////////////////////////////////
  
  $(tbody).on("click" ,".approve", function(){
	  sendWorkId = [];
	  let value = $(this).closest("tr").attr("id")
  	  sendWorkId.push(value)
	  $("#workCodeArray").val(sendWorkId)
	  $( '#background' ).addClass( 'modal__background' );
	  $("#acceptModal").show();
	  document.getElementById("pmAcceptCheck").focus();
  })
  
 
  
  
//==============================================================	
	function makeTrTags(work){
			let req =	$("[name='workReqSttusCode']").val();
			
//==============?????? ?????? ?????? ????????? ??????================================================	
		 if(req=="W00301"){
		 		let btn =[]
		 		btn.push(
		 				$("<div>").append(
		 						$("<button>").prop("class", " btn  , approve").data("memMail" ,work.memEmail).html("??????"),
		 						$("<button>").prop("class", "btn  , refuse ").data("memMail" ,work.memEmail).html("??????")
		 					)		
		 			);                
//======================================================================================
			 
			 return $("<tr>").append(
						$("<td colspan='2' >").append(
						$("<input class='myCheck' >").attr("type" , "checkbox").prop("name" , "workCode")
							).prop("class" ,"selectCheck , links"),
						$("<td colspan='2' class='ctgryNm ' >").html(work.ctgryNm),
						$("<td colspan='2' class='sj'>").css("width" ,"30%" ).html(work.workSj),
						$("<td colspan='2' class='memName' >").data("memId" , work.memId).html(work.memName),
						$("<td>").html(work.priortNm),
						$("<td colspan='2'>").html(work.workEndde != null ? work.workEndde : "??????" ),
						$("<td colspan='2'>").append(btn)
				).prop("id", work.workCode).prop("class", work.workDateStatus)

		 	}else if( (req=="W00303") && work.workReturnWhy!=null){
		 
		 		
		 		let returnWhy = [];
		 		returnWhy.push(
		 					$("<span>").append(
		 							$('<button class="btn whyNot btn-info btn-sm">').append(
		 									"?????? &nbsp;"+ '<i class="fa fa-info-circle" aria-hidden="true"></i>'
		 										).data("workCode", work.workCode )
		 							 ) 	
		 					)
		 		
		 		return $("<tr>").append(
		 				$("<td colspan='2'>").append(
		 						$("<input class='myCheck' >").attr("type" , "checkbox").prop("disabled" , "disabled")
		 						
		 						),
		 				
						$("<td colspan='2' class='ctgryNm '>").html(work.ctgryNm),
						$("<td colspan='2' class='sj'>").css("width" ,"30%" ).html(work.workSj),
						$("<td colspan='2' >").data("memId" , work.memId).html(work.memName),
						$("<td>").html(work.priortNm),
						$("<td colspan='2'>").html(work.workEndde != null ? work.workEndde : "??????" ),
						$("<td colspan='2'>").append(returnWhy)
				).prop("id", work.workCode).prop("class", work.workDateStatus)

		 		
		 	}else{
		 		return $("<tr>").append(
		 				$("<td colspan='2'>").append(
		 						$("<input class='myCheck' >").attr("type" , "checkbox").prop("disabled" , "disabled")
		 						
		 						),
								$("<td colspan='2' class='ctgryNm '>").html(work.ctgryNm),
								$("<td colspan='2' class='sj'>").css("width" ,"30%" ).html(work.workSj),
								$("<td colspan='2'>").html(work.memName),
								$("<td >").html(work.priortNm),
								$("<td colspan='2'>").html(work.workEndde != null ? work.workEndde : "??????" ),
								$("<td  colspan='2'>").append("")
						).prop("id", work.workCode).prop("class", work.workDateStatus)
		 		
		 	}
		
		
	}
	
	//=======================??????????????? ??????========================
	$("tbody").on( "click", ".sj", function() {
		let workCode = 	$(this).closest("tr").prop("id")
		 console.log(workCode)
		 location.href = "${cPath}/project/${pCode}/workDetail/"+ workCode ;
	 
	});
	//=========================??? ????????? ?????? ??????======================
	
	$(tbody).on("mouseenter",  ".sj",function() {
	    if (this.offsetWidth < this.scrollWidth) {
	        $(this).attr('title', $(this).text());
	    } else {
	        $(this).removeAttr("title");
	    }
	});
//===========================?????? ??? ??????============================
function toggleSearch(){
	
	var detailBtn = document.getElementById("detailSearch"); 
	
	if(detailBtn.classList.contains('btn-detail_open')) { //?????? ???
		detailBtn.classList.add('btn-detail')
		detailBtn.classList.remove('btn-detail_open')
		$(".wrap_section_contents_open").addClass( "wrap_section_contents");
		$(".wrap_section_contents").removeClass( "wrap_section_contents_open" );
		$(".wrap_section_contents").hide();
		$(".changeIcon").html('<i class="fas fa-search-plus"></i>')
	}else{ //??????
		detailBtn.classList.add("btn-detail_open")
		detailBtn.classList.remove("btn-detail")
		$(".wrap_section_contents").show();
		$(".wrap_section_contents").addClass("wrap_section_contents_open");
		$(".wrap_section_contents").removeClass("wrap_section_contents");
		$(".changeIcon").html('<i class="fa fa-times" aria-hidden="true"></i>')
	}
	
	
}


	


	$("tbody").on("change" , ".myCheck" , function(){
	 			 let allCheckLenght   = $(".myCheck").length;
	 			 let checked = $(".myCheck:checked").length;
	 			 
	 			 if(allCheckLenght!= checked){
	 				$('#allCheck').prop('checked',false);
	 			 }else if(allCheckLenght==checked){
	 				$('#allCheck').prop('checked',true);
	 			 }
	 		 	 
	 			 if($(this).prop("checked")){
	 				let value = $(this).closest("tr").attr("id")
	 				sendWorkId.push(value)
	 				console.log(sendWorkId)
	 			 }else{
	 				let value = $(this).closest("tr").attr("id")
	 				var inedex = sendWorkId.indexOf(value); 
		 				if(inedex >-1){
		 					sendWorkId.splice(inedex , 2)
		 				}
	 				 }
	 				 
	 				 
	 			 });
	 			 
	 


	

	$("#goback").on("click" , function(){
		
		geBack();
	});
	
//======================================
 function nextTab(){
	$("[name='searchWord']").val("");
	$("[name='startDate']").val("");
	$("[name='endDate']").val("");
	$("[name='ctgryCode']").val("");
	$("[name='workPriortCode']").val("");
	$("[name='sidx']").val("");
	$("[name='sortType']").val("");
	$('#sidx').val('');
	$('#sortType').val('');
	searchForm.find("[name='page']").val("");
	searchForm.submit();
}  

//=======================?????????
$('ul.tabs li').click(function(){
	var tab_id = $(this).attr('data-tab');
	$('ul.tabs li').removeClass('current');
	$('.tab-content').removeClass('current');
	$("[name='workReqSttusCode']").val(tab_id)
	nextTab()
	$(this).addClass('current');
	$("#"+tab_id).addClass('current');
})

 //=======================????????? ?????? ?????? ??? ????????? ??? ????????? ???????????? 
function reset(){
	$("[name='searchWord']").val("");
	$("[name='startDate']").val("");
	$("[name='endDate']").val("");
	$("[name='ctgryCode']").val("");
	$("[name='workReqSttusCode']").val("W00301");
	$("[name='workOthbcAt']").val("");
	$("[name='sidx']").val("");
	$("[name='sortType']").val("");
	searchForm.find("[name='page']").val("");
	searchForm.submit();
}  


$("#allCheck").on("click", function(){
	if($('#allCheck').is(':checked')){       
		  let checkboxes   = $(".myCheck").length
		 
			if(checkboxes>0){
				if($(".myCheck").hasClass("notAccess")){        
					  $('.myCheck').prop('checked',false);
				}else{
					  $(".myCheck").prop('checked',true); 
				}
				 
			}else{
				Swal.fire({
					  icon :"error", 
					  text: "?????? ????????? ????????? ????????????",
					  button: "??????"
				}).then(function(){
					 $('#allCheck').prop('checked',false);
			    });
			}		 
		
	    }else{
	       $('.myCheck').prop('checked',false);
	    }

})

function geBack(){
	$(".wrap_section_contents_open").addClass("wrap_section_contents");
	$(".wrap_section_contents").removeClass("wrap_section_contents_open");
	$(".btn-detail_open").addClass("btn-detail")
	$(".btn-detail").removeClass("btn-detail_open")
	$(".wrap_section_contents").hide();
	
	
} 
 




</script>

</body>
</html>