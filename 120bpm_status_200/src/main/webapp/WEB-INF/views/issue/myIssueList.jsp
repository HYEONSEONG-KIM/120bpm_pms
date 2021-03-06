<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"	src="${cPath }/resources/js/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">

@import url('https://fonts.googleapis.com/css2?family=Geostar&family=Geostar+Fill&display=swap');
body { 
	background: #f3f3f3;
	font-size: 13px;
	font-weight: 400;
	line-height: 1.471   
}
 
      .tooltip {
        background: #333;
        color: white;
        font-weight: bold;
        padding: 4px 8px;
        font-size: 13px;
        border-radius: 4px;
      }
.x_content{
height : 95%;
}
.smallD {
		height : 95%;
	 width: 95%;
	margin: 20px;
	float: left;
	
	padding: 10px;
	border-radius: 10px;  
	background-color: white;
}
.x_panel{

	margin: 10px;
 border-radius: 10px;
  box-shadow: 1px 2px 3px 1px #d5d7db;
}

#saveCols{
border: 1px solid gray;
}
#setting{
 
padding:10px;
}

.greyBorder{
border: 1px solid gray;
}

.addCols{
flex-direction :column !important;
padding:0;
}

ul{
   list-style:none;
 	 padding :0;
   }
   
li{
   cursor: pointer;
}  
.notAccess{
   opacity: 0.4;
   color : black;
   cursor: pointer;
   font-weight: bold;
}
.textCenter{
text-align: center;
} 

#setting{
display: none;
}

 
#chart{
height : 95%;
}
.issueChart{
margin-right: 5%;
 
}
 
.workSj{
text-align: left;

}
 

.issueSj{
text-align: left!important;
}

.tooltip:hover .tooltip-text {
  display: block;
}


#searchUI{
clear: both;
display: table!important;
font-size: 1.4em!important;
padding: 10px;
} 


#searchUI{
clear: both;
display: table!important;
font-size: 1.4em!important;
padding: 10px;
 
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
            width:50%;
            border-radius: 4px;
            font-size: 20px;
}
select option {
 
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
 
#searchingArea{
  background-color: #FFFFFF;  
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
 
.input-group-prepend{
width: 100%;
}

#listBody{
height: 240px;
}

.form-check-input{
width:13px;
height:13px;
vertical-align:middle;
margin-top: 15px;
}

#allAC{
display: none;
}
 form-check-label{vertical-align:-1px}
 
 
.selectCheck {
text-align: center;
} 
 
/* Show the tooltip text when you mouse over the tooltip container */
.tooltip:hover .tooltip-text {
  visibility: visible;
}

.tooltip .tooltip-text  {
  font-family:'Noto Sans KR', sans-serif !important;
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  padding: 5px 0;
  border-radius: 6px;
 
  /* Position the tooltip text - see examples below! */
  position: absolute;
  z-index: 1;
}
#chartGrid{
margin-top : 3%;
display: grid;
text-align:right;
 grid-template-columns: 55% 45%;
}

#btnArea{

margin: left;
}

tr{

height: 48.7px;
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
<security:authentication property="principal.adaptee" var="authMember" />

<body>
<h1 class='menuName' style = "text-align: left; font-weight: bold;"> <i class="fa fa-tasks" aria-hidden="true"></i>&nbsp; &nbsp;?????? ?????????</h1>

 <div class="text-right widthMininal">

	<button id="searchButton" class="searchBtn btn">????????????<span>????</span></button>
	 
 </div>
<div id="searchingArea"class='x_panel'>
			  
 <table id="searchUI">
 
 <tr>
  	 <td colspan="6">
			<div class="input-group inputgroups right">
 		 		
  <div class="input-group-prepend">
  <label class="labelLength">????????????</label> 
 		  <select id="pricode" name="workPriortCode" class="form-control left minimal">
 	 			<option value>????????????</option>
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
 <td colspan="6">
 <div class="input-group right inputgroups"  >
 	 
 		 <div class="input-group-prepend">
 		 <div class="form-check">
  <input class="form-check-input" value='all' type="radio" name="issueSolutAt" id="all" checked>
  <label class="form-check-label" for="flexRadioDefault1">
   ??????
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" value='1' name="issueSolutAt" id="end" >
  <label class="form-check-label" for="flexRadioDefault2">
   ??????
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio"  value='0' name="issueSolutAt" id="ing"  >
  <label class="form-check-label" for="flexRadioDefault2">
  ?????????
  </label>
</div>
 		 
 		 
 		 <select    class="form-control searchOption" name="searchType">
				<option value>??????</option>
				<option value="workTitle">?????? ??????</option>
				<option value="title">?????? ??????</option>
	</select> 
		 	<input type="text" name="searchWord" id="searchText" placeholder="????????? ??????" class="testTags form-control" />
	 		 <div class="input-group-append">
	 		 <button type="button" id="searchBtns" class="btnTags btn searchBtn">??????</button>
			<!-- <button type="button" id="resetBtn" class="btnTags btn resetBtn">?????????</button> -->
 			<button type="button" id="reset" class="resetBtn btn"><img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button> 
	 		 </div>
 	 	</div>
 	 	</div>

 
 </td>
 </tr>
 
 </table>
 </div>
 <div class="containers">
    
  
  
 
 <div class="x_panel">
  <div id="chartGrid">	
  <div></div>
	<div class="text-right" id="btnArea">
	<button id="solute" class="btn btbtn">??????</button>
	<button id="delete" class="btn deleteBtn">??????</button>
	
	 <button class="btn btn-default controlBtn" data-gopage="${cPath}/project/${pCode}/issue/issueList">?????? ??????</button>
 	<button type="button" class="newBtn btn controlBtn" data-gopage="${cPath }/project/${pCode}/issue/create" >
		<img class="newImg" src="${cPath}/resources/imgs/img/new.png">
		????????? 
	</button>
	
	<button id="colSetBtn" type="button" class="btn gobackBtn" >????</button>
	<div id="setting" class="mb-3 greyBorder ">
					 <div class="d-flex">
							<div class="float-left  mr-3">
							????????? ??????
									<ul id="addCols" class="greyBorder">
										<li data-colnm='issueRgsde'>?????????</li>
										<li data-colnm='workSj'>????????????</li>
										<li data-colnm='issueUpdtde'>???????????????</li>
										<li data-colnm='repCount'>????????????</li>
									</ul>
									 
							</div>
							<div  class="float-right">
								????????? ??????
								<ul id="chooseCols" class="greyBorder" >
									<li id="allAC" data-colnm='selectAll' class="notAccess">????????????</li>
									<li data-colnm='issueSj' class="notAccess">??????</li>
									<li data-colnm='memName'  class="notAccess">?????????</li>
									<li data-colnm='issuePriortCode'  class="notAccess">????????????</li>
									<li data-colnm='issueSolutAt'  class="notAccess">????????????</li>
								</ul>
							</div>
					 </div>
						<div class='text-right'>
						<button id="saveCols" type="button" class="btn btn btn-default" >??????</button>
					</div>	
					
			</div>		
			</div>
	</div>
	<div class="clearfix"></div>
	
					<div  class="x_content"  style="display: block;">
					
					
					
							<div id="tablesArea">
								<table id="issueList" class="table">
								<thead> 
						<tr id="titles">
						<th  class="selectAll selectCheck" >?????? ??????<input class="selectCheck" id="allCheck" type="checkbox" ></th>
						<th  data-colnm='issueSj' >??????</th>
						<th data-colnm='memName'>?????????</th>
						<th  data-colnm='issuePriortCode'>????????????</th>
						<th data-colnm='issueSolutAt' >????????????</th>
						</tr>
					</thead>
					<tbody id="listBody">
						<c:set var="issueList" value="${pagingVO.dataList }" />
		<c:choose>
			<c:when test="${empty issueList }">
				<tr>
					<td colspan="8">????????? ?????? ???????????? ??????.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${issueList }" var="issue">
					<tr id="${issue.issueSj}">
						<td>${issue.memName}</td>
						<td>${issue.issuePriortCode}</td>
						<td>${issue.soluteNm}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
					</tbody>
					<tfoot>
						<tr id="footerArea"> 
							<td colspan="5" >
								<!-- paging UI -->
								<div id="pagingArea"></div>
							</td> 
						</tr>
					</tfoot>
				</table>
				<form  id="searchForm" action="${cPath }/project/${pCode}/issue/issueList/myList">
					<input type="hidden" name="page">
					<input type="hidden" name="searchWord">
					<input type="hidden" name="searchType">
					<input type="hidden" name="work">
					<input type="hidden" name="startDate">
					 <input type="hidden"name="endDate">
					<input type="hidden" name="work">
					<input type="hidden" name="issuePriortCode">
					<input type="hidden" name="issueSolutAt"> 
				</form>
								
								 
							</div>
					</div>	
	
	
	
		</div>	
		</div>		
 
 <form id="deleteForm" method="post" action="${cPath }/project/${pCode }/issue/remove">
 	<input type="hidden" id="deleteIsuees" name="issueNos">
 </form>
 
 <form id="soluteForm" method="post" action="${cPath }/project/${pCode}/issue/modify/result/solut">
 	<input type="hidden" id="soluteIssue" name="issueNos">
 </form>
<script type="text/javascript">
let titles = $("#titles")
let tbody = $("#listBody")
let pagingArea = $("#pagingArea");
let searchUI = $("#searchingArea"); 
let searchForm = $("#searchForm")
let sendWorkId = [];

$("#delete").on("click" , function(){
	checkedArray()
  });


 

$("#reset").on("click", function() {
	$("[name='searchType']").val("");
	$("[name='searchWord']").val("");
	$("[name='endDate']").val("");
	$("[name='startDate']").val("");
	$("[name='issuePriortCode']").val("");
	$("#searchForm [name='issueSolutAt']").val("");
	$("#all").prop('checked' , true)
	searchForm.find("[name='page']").val("");
	searchForm.submit();
	drawList();
	setDefaultDate();
})

$("#solute").on("click" , function(){
	  let cnt = 0 ; 
	  let checked = $(".myCheck:checked").each(function(){
	  	  //let value = $(this).data('issueNo')
	  	let value =  $(this).closest("tr").prop('id')
	  	  cnt ++;
	  	  sendWorkId.push(value)
	  })
	  
	  if(cnt>0){
		  $("#soluteIssue").val(sendWorkId)
		  $("#soluteForm").submit();
	  }

		if(cnt==0){
			Swal.fire({
				  icon :"error", 
				  text: "????????? ????????? ????????????",
				  button: "??????"
			})
		}
	
})



 $("#soluteForm").ajaxForm({
	 dataType : "text",
	 success :function(resp){
		 if(resp == "OK"){
			 Swal.fire({
				  icon: "success",
				  title: "?????? ?????? ??????",
				  text: "?????? ????????? ??????????????? ?????????????????????.",
				  button :"??????",
				}).then(function(){
					 location.reload();
			    });
			 
		 }else {
				Swal.fire({
					  icon: "error",
					  title: "?????? ?????? ??????",
					  text:  "?????? ????????? ????????? ???????????????.",
					  button :"??????",
					}).then(function(){
						 location.reload();
				    });
		 }
		 
	 }
	 
	 
 })




function checkedArray(){
	  let cnt = 0 ; 
let checked = $(".myCheck:checked").each(function(){
	  //let value = $(this).data('issueNo')
	let value =  $(this).closest("tr").prop('id')
	  cnt ++;
	  sendWorkId.push(value)
})

	  if(cnt>0){
		$("#deleteIsuees").val(sendWorkId)  
		//
		 Swal.fire({
             title: '?????????????????????????',
             text: "????????? ????????? ????????? ??? ????????????",
             icon: 'warning',
             showCancelButton: true,
             confirmButtonColor: '#3085d6',
             cancelButtonColor: '#d33',
             confirmButtonText: '??????',
             cancelButtonText: '??????'
         }).then((result) => {
             if (result.isConfirmed) {
            	 $("#deleteForm").submit();
             }else{
            	 sendWorkId = [];
             }
         })
		
	  }   

	if(cnt==0){
		Swal.fire({
			  icon :"error", 
			  text: "????????? ????????? ????????????",
			  button: "??????"
		})
	}
	 
}

 


$("#deleteForm").ajaxForm({
		dataType : "text",
	 success :function(resp){
		 if(resp == "OK"){
			 Swal.fire({
				  icon: "success",
				  title: "?????? ??????",
				  text: "????????? ??????????????? ?????????????????????.",
				  button :"??????",
				}).then(function(){
					 location.reload();
			    });
			 
		 }else {
				Swal.fire({
					  icon: "error",
					  title: "?????? ??????",
					  text:  "????????? ????????? ???????????????.",
					  button :"??????",
					}).then(function(){
						 location.reload();
				    });
		 }
		 
	 }
})



$("#issueList").on("click", "#allCheck" , function(){
	if($('#allCheck').is(':checked')){       
		   let checkboxes   = $(".myCheck").length//
		 // let allCheckLenght =checkboxes - disabled;
		  
			if(checkboxes>0){
					  $(".myCheck").prop('checked',true); 
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

	
  
 $("tbody").on("change" , ".myCheck" , function(){
	 
	 		 
	 			 let allCheckLenght   = $(".myCheck").length;
	 			  let checked = $(".myCheck:checked").length;
	 			 if(allCheckLenght!= checked){
	 				$('#allCheck').prop('checked',false);
	 			 }else if(allCheckLenght==checked){
	 				$('#allCheck').prop('checked',true);
	 			 }
}) 



	 $(".controlBtn").on('click', function(){
	 		let gopage = $(this).data("gopage");
	 		if(gopage){
	 			location.href = gopage
	 		}
	 })

$("#colSetBtn").on("click" , function(){
	if($('#setting').css('display') == 'none'){
        $('#setting').show();
    }else{
        $('#setting').hide();
    }
 
})
 
	
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

	
$("tbody").on( "click", ".issueSj", function() {
	let issueNo = 	$(this).closest("tr").prop("id")
	 location.href = "${cPath}/project/${pCode}/issue/Detail/"+ issueNo ;
});

 

$("#searchBtns").on( "click", function() { 
	 
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
					$("[name='searchType']").val($("#searchOption").val());
					$("[name='searchWord']").val($("#searchText").val());
					$("[name='endDate']").val($("#ending").val());
					$("[name='startDate']").val($("#starting").val());
					$("[name='issuePriortCode']").val($("#pricode").val());
					var radioVal = $('input[name="issueSolutAt"]:checked').val();
					if(radioVal=='all'){
						radioVal ='';
					}
					$("#searchForm [name='issueSolutAt']").val(radioVal);
					searchForm.find("[name='page']").val("");
					searchForm.submit();
					drawList();
					/*  $("#searchingArea").hide() */
				}
			})



 /** @param txt<br/>
     *  @param len : ????????? ????????? 20<br/>
     *  @param lastTxt : ????????? ????????? "..."<br/>
     *  @returns ?????????
     * <br/>
     * <br/>
     * ?????? ???????????? ???????????? ???????????? ????????? ????????? ???????????? ???????????? ??????<br/>
     * ???ex) ????????????????????? -> textLengthOverCut('?????????????????????', '5', '...') : ???????????????...<br/>
     */
    function textLengthOverCut(txt , len, lastTxt ) {
    	 
        if (len == "" || len == null) { // ?????????
            len = 10;
        }
        if (lastTxt == "" || lastTxt == null) { // ?????????
            lastTxt = "...";
        }
        if (txt.length > len) {
            txt = txt.substr(0, len) + lastTxt;
            return txt
        }
     }

 

function makeTitle(){
 	/* var colsInfos = getColsInfo()  */
	var colNames = getColsName()
	var notAcLen =  $("#chooseCols li.notAccess");
 	var addCols = $("#addCols li")
 	//console.log(notAcLen.length)
 	//????????? not access??? ?????? ???????????? ????????? ???
 	 let dataSet = getColsInfo();  
	var thTags = [];
		$(titles).empty();
	
	if(dataSet!=null && colNames!=null){
		if(dataSet.length > notAcLen.length){
			//????????? ????????? ?????? ?????? ??????????????? ????????? ??? ???
			//????????? ????????? ?????? ????????? ?????? ??????
			
			 $(dataSet).each(function(idx , issue){
				/* console.log(idx)
				console.log(issue)
			 	console.log("??????" + issue) ;
			 	console.log("?????????" + $(notAcLen[idx]).data('colnm')) ; */
			if(issue == $(notAcLen[idx]).data('colnm') ) return ;
				$("#chooseCols").append(
							$("<li>").data("colnm" ,issue).text(colNames[idx])
							)
				$(addCols).each(function(idx , li){
					//???????????? ????????? ?????? ??????
					if($(li).data('colnm')==issue){
						console.log("??????")
						console.log(this)
						$(this).remove();						
					}
				})
			 })
			 
			 colNames.forEach(name=>{
				 if(name=="????????????"){
				$(titles).append(
						 $("<th>").html(name +"&nbsp;").append(
							$("<input type='checkbox'>").prop("id" ,"allCheck" )
							)
					);
				 }else{
					 $(titles).append($("<th>").html(name))
				 }
				
			 	
			 })	
			 
			 
		}else{
			$(notAcLen).each( function(idx , ac){
				
			if($(ac).data('colnm')=="selectAll"){
					$(titles).append(
							$("<th>").prop('class','text-center').html(
							$(ac).text()+"&nbsp;"
					).append($("<input type='checkbox'>").prop("id" ,"allCheck" ))
							
					);
				}else{
					$(titles).append($("<th>").html($(ac).text()));
				}
				
			})
		}	
		$('#footerArea td').attr('colspan', $('#issueList thead th').length);
		
	}else{
		$(notAcLen).each( function(idx , ac){
			if($(ac).data('colnm')=="selectAll"){
				$(titles).append(
						
						$("<th>").prop('class','text-center').html(
						$(ac).text()+"&nbsp;"
						 
				).append($("<input type='checkbox'>").prop("id" ,"allCheck" ))
						
				);
			}else{
			$(titles).append($("<th>").html($(ac).text()));
			}
			/* 
			$(titles).append($("<th>").html($(ac).text())); */
		})	
	}//null ????????????

} 
	

$("#saveCols").on("click" , function(){
	 thTags = $("#titles th")
	 $(titles).empty();
	 $(tbody).empty();
	 var update =false;
	  //????????? ????????? ?????? ?????????
	 let chooseValue = $("#chooseCols li")
	 var  footerTd = $("footerArea td")  
	 $(footerTd).attr("colspan" , chooseValue.length );
		var chooseCols = $("#chooseCols li")
	
		thNames = []
		var colsNames = [];
		var colsValue =[];
		 $(chooseCols).each(function(i, cols){
			 thNames.push(
					 		$("<th>").html($(cols).text())
					 		);
			 colsNames.push($(cols).text());
			 colsValue.push($(cols).data('colnm'))
		 })
	 
		 	
		fixedCols = $("#chooseCols li.notAccess");
		 // console.log("colsValue.length"  + colsValue.length)
		 if(colsValue.length>fixedCols.length){
			 saveColsNames(colsNames)
			 saveColsInfo(colsValue)
			 update =true;
		 }else{
			 	removeCols();    
				removeColsInfo(); 
				 update =true;
		 }
	$(titles).html(thNames)
	 $('#setting').hide();
	/* drawList(); */
	if( update){
		drawList();
	}
});

 
//=================================================================
 function drawList(){
	 $("#searchForm").paging().ajaxForm({
		 dataType:"json",
		 success:function(pagingVO){
			 let workList = pagingVO.dataList;
			 var chooseLen = $("#chooseCols li").length;
			 tbody.empty();
			 let trTags = [];
			 var chooseList = $("#chooseCols li");
			 if(workList&&workList.length>0){
				  $(workList).each(function(idx , issue){
					  trTags.push(makeTableList(issue));
				  });
				  $('#allCheck').prop('checked', false)	
				  
				  var ListWidth = trTags.length;
					if(ListWidth <5){
						for(var i = 0 ; i<5 - ListWidth;i++ ){
							trTags.push(
									$("<tr>").html(
											$("<td>").attr("colspan" , chooseLen).prop("class" , "fixedArea")		
										)
								 )		
						}
					}	 
				  
					pagingArea.html(pagingVO.pagingHTMLBS);
			 }else{
				 trTags.push($("<tr>").append(
						$("<td>").prop('class' , 'text-center').attr("colspan" ,chooseLen).html("???????????? ????????? ???????????? ????????????")	 
				 ))
				 
				 var ListWidth = trTags.length;
					if(ListWidth <5){
						for(var i = 0 ; i<5 - ListWidth;i++ ){
							trTags.push(
									$("<tr>").html(
											$("<td>").attr("colspan" , chooseLen).prop("class" , "fixedArea")		
										)
								 )		
						}
					}	 
				 
			 }
			tbody.append(trTags);			 
			 
		 }
		 
	 }).submit();
 }
//=================================================================
 
 function makeTableList(issue){
	 
	 let dataSet = getColsInfo();
	 var chooseList = $("#chooseCols li");
	 let tdTags = [];
	 if(dataSet!=null){//???????????? ?????? ?????? ?????? ?????? ????????? ?????? ????????? ??? ????????? ??????
		 dataSet.forEach(function(item, index, arr){
			if(item=='issueSolutAt'){
				tdTags.push(	$("<td>").prop("class" , 'textCenter').html(issue.soluteNm)) 
			}else if(item=='workSj'){
				wSj = issue.workSj;
				if(wSj.length>10){
				txt = textLengthOverCut(issue.workSj,'10' ,'...')
				tdTags.push( $("<td>").append(
								 $('<span>').data('placement' , 'bottom').prop('title' ,wSj ).data('toggle','tooltip').prop('class'  , 'tooltip-text tooltip-bottom').text( txt ) 
								 
								 	).prop('class'  , 'sj')
								 )
				}else{
					tdTags.push( $("<td class='workSj'>").html(wSj))
				}
				
			/* 	tdTags.push( $("<td class='workSj'>").html(  txt   )   ) */
			}else if(item=='issueUpdtde'){
				tdTags.push( $("<td class='issueUpdtde'>").prop("class" , 'textCenter').html(issue.issueUpdtde==null?"-":issue.issueUpdtde))
			}else if(item=='issueSj'){
				var sj = issue.issueSj;
				if(sj.length>10){
					 txt = textLengthOverCut(issue.issueSj,'10' ,'...')
				tdTags.push( $("<td>").append(
						 $('<span>').prop('title' ,sj ).data('placement' , 'bottom').data('toggle','tooltip').text( txt ) 
					 			).prop('class'  , 'issueSj')
					 			)
				}else{
				tdTags.push( $("<td class='issueSj'>").html(issue.issueSj))
				}
			}else if(item=='issuePriortCode'){
				tdTags.push( $("<td >").prop("class" , 'issuePriortCode textCenter').html(issue.priorNm))
			}else if(item=='selectAll'){
				tdTags.push( 
						$("<td>").prop("class" , 'textCenter')
							.append( $("<input class='myCheck'>").attr("type" , "checkbox")
							.attr("data-issueNo", issue.issueNo)
							.prop("name" , "issueNos")
							).prop("class" ,"selectCheck , links")
						)
			}else{
				tdTags.push( $("<td>").prop("class" , 'textCenter').html(issue[item]))
			}
		 });
	 }else{
		
		 $(chooseList).each(function(idx, li){
			 var liName = $(li).data('colnm') 
			  
			 if(liName=='issueSolutAt'){
					tdTags.push(	$("<td>").prop("class" , 'textCenter').html(issue.soluteNm)) 
				/* 	$("<td>").prop("class" , 'textCenter').html(issue.issueRgsde) */
				}else if(liName=='workSj'){
					/* txt = textLengthOverCut(issue.workSj,'5' ,'...')
					tdTags.push( $("<td class='workSj'>").html(txt)) */
					wSj = issue.workSj;
					
					if(wSj.length>10){
					txt = textLengthOverCut(issue.workSj,'10' ,'...')
					tdTags.push( $("<td>").append(
								
								 $('<span>').prop('title' ,wSj ).data('placement' , 'bottom').data('toggle','tooltip').prop('class'  , 'tooltip-text tooltip-bottom').text( txt ) 
								 
								 	).prop('class'  , 'sj')
								 )
					/* tdTags.push( $("<td>").append(
							 		txt ,
									$('<div class="tooltip ">').append(
											  
					 							$('<span>').prop('class'  , 'tooltip-text tooltip-bottom').text(wSj)	 
							 				)
										).prop('class' , 'workSj')
						 			) */
						 			
						 			
					}else{
						tdTags.push( $("<td class='workSj'>").html(wSj))
					}
					
				}else if(liName=='issueUpdtde'){
					tdTags.push( $("<td class='issueUpdtde'>").prop("class" , 'textCenter').html(issue.issueUpdtde))
				}else if(liName=='issueSj'){
					var sj = issue.issueSj;
					if(sj.length>10){
						 txt = textLengthOverCut(issue.issueSj,'10' ,'...')
						 tdTags.push( $("<td>").append(
						 $('<span>').data('data-placement' , 'bottom').prop('title' ,sj ).data('toggle','tooltip').prop('class'  , 'issueSj').text( txt ) 
					 				).prop('class'  , 'issueSj')
					 			)
					 			
					 			
					}else{
						tdTags.push( $("<td class='issueSj'>").html(issue.issueSj))
					}
					
				}else if(liName=='selectAll'){
					 
					tdTags.push( 
								$("<td>").prop("class" , 'textCenter')
								.append( $("<input class='myCheck'>").attr("type" , "checkbox")
								.attr("data-issueNo", issue.issueNo)
								.prop("name" , "issueNos")
								).prop("class" ,"selectCheck , links")
					)
				}else if(liName=='issuePriortCode'){
					tdTags.push( $("<td class='issuePriortCode textCenter'>").html(issue.priorNm))
				}else if(liName=='memName'){
					tdTags.push( $("<td class='memName textCenter'>").html(issue.memName))
				}else{
					
					tdTags.push( $("<td>").prop("class" , 'textCenter').html(issue))
				}
		  })  
	 }
	 
	 return $("<tr>").append(tdTags).prop("id" , issue.issueNo);
 }
  
  
 
////???????????? ????????????
 $("#addCols").on("dblclick", "li" , function(){
	 var item = $(this)
	 $(item).remove();
	 $("#chooseCols").append(item);
 })
 
////???????????? ????????????
 $("#chooseCols").on("dblclick", "li" , function(event){
	 var item = $(this)
		 if($(item).hasClass("notAccess")){
			 event.preventdefault();
		 }
	 $(item).remove();
	 $("#addCols").append(item);
 })
 
 
 

 
 
 function saveInfo(){
	titles.empty();
	var footerArea = $("#footerArea");
	footerArea.empty();
	
	
	tbody.empty();
	var chooseCols = $("#chooseCols li")

	thNames = []
	var colsNames = [];
	var colsValue =[];
	 $(chooseCols).each(function(i, cols){
		 thNames.push(
				 		$("<th>").html($(cols).text())
				 		);
		 colsNames.push($(cols).text());
		 colsValue.push($(cols).data('colnm'))
	 })
 
	 	
		fixedCols = $("#chooseCols li.notAccess");
	 if(colsValue.length>fixedCols.length){
		 saveColsNames(colsNames)
		 saveColsInfo(colsValue)
	 }else{
		 	removeCols();    
			removeColsInfo(); 
	 }
	 
}

function removeCols(){
	localStorage.removeItem('${authMember.memId}MyIssueColName');
}

function removeColsInfo(){
	localStorage.removeItem('${authMember.memId}MyIssueColInfo');
}
 
 function saveColsNames(colsNames){
	//localStorage.setItem('nums', JSON.stringify([1, 2, 3]))
	 console.log("${authMember.memId}MyIssueColName")
	 localStorage.setItem("${authMember.memId}MyIssueColName" ,  JSON.stringify(colsNames));
	 var colsNames =  localStorage.getItem("${authMember.memId}MyIssueColName");
	 
 }
 
 function saveColsInfo(colsValue){
	 localStorage.setItem("${authMember.memId}MyIssueColInfo" , JSON.stringify(colsValue));
 }
 
 function getColsName(){
	 //JSON.parse(localStorage.getItem('nums'))
	 //console.log(" colName " + "${authMember.memId}IssueColName")
	 var colsNames =  localStorage.getItem("${authMember.memId}MyIssueColName");
		 if(colsNames!=null){
			 return  JSON.parse(colsNames);
		 }else{
			 return null;
		 }
 }
 
 
 function getColsInfo(){
	 var colsInfo =  localStorage.getItem("${authMember.memId}MyIssueColInfo");
	 if(colsInfo!=null){
		 return  JSON.parse(colsInfo);
	 }else{
		 return null;
	 }
 }
 
 
 //==================================
 $(function(){
	 
	    $("#searchButton").on("click", function(){
	       if(searchUI.is(":visible")){
	          searchUI.slideUp();
	       } else {
	          searchUI.slideDown();
	       }
	    });
		
	     
	    $('[data-toggle="tooltip"]').tooltip()
	     
	 setDefaultDate();
	 let dataSet = getColsInfo();
	 makeTitle();
	 drawList();
 })
 


</script>

</body>
</html>