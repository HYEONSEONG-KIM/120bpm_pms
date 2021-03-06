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
 

#chart{
text-align: center;
}
.x_content{
height : 95%;
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
 
    margin: 20px;
	float: left;
	box-shadow: 1px 2px 3px 1px #d5d7db;
	padding: 10px;
	border-radius: 10px;  
	background-color: white;
}
 
.workSj{
text-align: left;

}
 
.issueSj{
text-align: left;
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
            width:50%;
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

 
#searchUI th{
width: 200px!important;
}
#searchUI {
justify-content: flex-end;
}
 
#searchingArea{
  background-color: #FFFFFF;  
  display: none;
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
 form-check-label{vertical-align:-1px}
 
#chart{
text-align: center;
} 
 
 
#listArea{
width: 100%;
height: 80%;
}
h4{
clear: both;
}

#chartGrid{
display: grid;
 grid-template-columns: 55% 45%;
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
 <hr>
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
				<option value="memId">?????????</option>
	</select> 
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
 </div>
  
<!-- 	<div class="x_panel issueChart">
	 	<div class="x_title ">  
			
			</div>
			<div class="clearfix"></div>
				
	</div> -->
   
  
 
 <div class="x_panel">
	
	<div class="clearfix"></div>
	
					<div  class="x_content"  style="display: block;">
					 <div id="chartGrid">
						<div >
							<h4>  ?????? ??????????????? ?????? ?????? ?????? </h4>
								<div id="chart"  style="display: block;">
									<div id="cartegoryChart">
									
									</div>
								</div>	
					<br> 
					<br>
					
					</div>	
					
					<div class="text-right">
					<button class="btn btn-default controlBtn" data-gopage="${cPath}/project/${pCode}/issue/issueList/myList">??? ?????? ??????</button>
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
									<li data-colnm='issueSj' class="notAccess">??????</li>
									<li data-colnm='memName'  class="notAccess">?????????</li>
									<li data-colnm='issuePriortCode'  class="notAccess">????????????</li>
									<li data-colnm='issueSolutAt'  class="notAccess">????????????</li>
								</ul>
							</div>
					 </div>
						<div class='text-right'><!-- onclick="saveInfo()" -->
						<button id="saveCols" type="button"  class="btn btn btn-default" >??????</button>
					</div>	
					
					</div>
			</div>
					</div>
					
					
					
					
							<div id="tablesArea">
								<table id="issueList" class="table">
								<thead> 
						<tr id="titles">
						<th data-colnm='issueSj' >??????</th>
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
				<form  id="searchForm" action="${cPath }/project/${pCode}/issue/issueList">
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
	 
 
<script type="text/javascript">
let titles = $("#titles")
let tbody = $("#listBody")
let pagingArea = $("#pagingArea");
let searchUI = $("#searchingArea"); 
let searchForm = $("#searchForm")

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

$(".resetBtn").on("click", function() {
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
	
		/* $("[name='searchType']").val($("#searchOption").val());
		$("[name='searchWord']").val($("#searchText").val());
		$("[name='endDate']").val($("#ending").val());
		$("[name='startDate']").val($("#starting").val());
		$("[name='issuePriortCode']").val($("#pricode").val());
		$("#searchForm [name='issueSolutAt']").val("");
		$("#all").prop('checked' , true)
		searchForm.find("[name='page']").val("");
		searchForm.submit();
		drawList();
		setDefaultDate(); */
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

	
	

$("tbody").on( "click", "tr[id]", function() {
			let issueNo = this.id;
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
            len = 7;
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
				 $(titles).append($("<th>").html(name))
			 	console.log("name" + name)
			 })	
			 
			 
		}else{
			$(notAcLen).each( function(idx , ac){
				$(titles).append($("<th>").html($(ac).text()));
			})
		}	
		$('#footerArea td').attr('colspan', $('#issueList thead th').length);
		
	}else{
		$(notAcLen).each( function(idx , ac){
			$(titles).append($("<th>").html($(ac).text()));
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
					 )
				 )
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
				
				if(wSj.length>5){
				txt = textLengthOverCut(issue.workSj,'5' ,'...')
				tdTags.push( $("<td>").append(
									
									 $('<span>').prop('title' ,wSj ).data('placement' , 'bottom').data('toggle','tooltip').prop('class'  , 'tooltip-text tooltip-bottom').text( txt ) 
									 
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
				if(sj.length>5){
					 txt = textLengthOverCut(issue.issueSj,'5' ,'...')
					
					 tdTags.push( $("<td>").append(
							 $('<span>').data('data-placement' , 'bottom').prop('title' ,sj ).data('toggle','tooltip').prop('class'  , 'issueSj').text( txt ) 
						 				).prop('class'  , 'issueSj')
						 			)
						 			
				}else{
				tdTags.push( $("<td class='issueSj'>").html(issue.issueSj))
				}
			}else if(item=='issuePriortCode'){
				tdTags.push( $("<td class='issuePriortCode'>").prop("class" , 'textCenter').html(issue.priorNm))
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
					
					if(wSj.length>5){
					txt = textLengthOverCut(issue.workSj,'5' ,'...')
					tdTags.push( $("<td>").append(
								
								 $('<span>').prop('title' ,wSj ).data('placement' , 'bottom').data('toggle','tooltip').prop('class'  , 'tooltip-text tooltip-bottom').text( txt ) 
								 
								 	).prop('class'  , 'sj')
								 )
								 
					}else{
						tdTags.push( $("<td class='workSj'>").html(wSj))
					}
					
				}else if(liName=='issueUpdtde'){
					tdTags.push( $("<td class='issueUpdtde'>").prop("class" , 'textCenter').html(issue.issueUpdtde))
				}else if(liName=='issueSj'){
					var sj = issue.issueSj;
					if(sj.length>5){
						 txt = textLengthOverCut(issue.issueSj,'5' ,'...')
						
						 tdTags.push( $("<td>").append(
								 $('<span>').data('data-placement' , 'bottom').prop('title' ,sj ).data('toggle','tooltip').prop('class'  , 'issueSj').text( txt ) 
							 				).prop('class'  , 'issueSj')
							 			)
							 			
					}else{
					tdTags.push( $("<td class='issueSj'>").html(issue.issueSj))
					}
				}else if(liName=='issuePriortCode'){
					tdTags.push( $("<td class='issuePriortCode'>").html(issue.priorNm))
				}else if(liName=='memName'){
					tdTags.push( $("<td class='memName'>").html(issue.memName))
				}else{
					console.log(issue)
					//console.log(li)
					
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
	localStorage.removeItem('${authMember.memId}IssueColName');
}

function removeColsInfo(){
	localStorage.removeItem('${authMember.memId}IssueColInfo');
}
 
 function saveColsNames(colsNames){
	//localStorage.setItem('nums', JSON.stringify([1, 2, 3]))
	 console.log("${authMember.memId}IssueColName")
	 localStorage.setItem("${authMember.memId}IssueColName" ,  JSON.stringify(colsNames));
	 var colsNames =  localStorage.getItem("${authMember.memId}IssueColName");
	 
 }
 
 function saveColsInfo(colsValue){
	 localStorage.setItem("${authMember.memId}IssueColInfo" , JSON.stringify(colsValue));
 }
 
 function getColsName(){
	 //JSON.parse(localStorage.getItem('nums'))
	 //console.log(" colName " + "${authMember.memId}IssueColName")
	 var colsNames =  localStorage.getItem("${authMember.memId}IssueColName");
		 if(colsNames!=null){
			 return  JSON.parse(colsNames);
		 }else{
			 return null;
		 }
 }
 
 
 function getColsInfo(){
	 var colsInfo =  localStorage.getItem("${authMember.memId}IssueColInfo");
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
		
	 $('[data-toggle="tooltip"]').tooltip();
	    
	 setDefaultDate();
	 let dataSet = getColsInfo();
	 makeTitle();
	 updateChart();
	 drawList();
 })
/////////////////////////////????????? ?????????///////////////////////////////////// 
function updateChart(){
	$.ajax({
		url :"${cPath}/project/${pCode}/issue/issueList/percent",
		dataType :"json",
		method:"post",
		success: function(resp){
			$("#cartegoryChart").empty();
			console.log(resp)
			values = [] 
			labels = []
			var percent =  resp.percenet
			var total = resp.total
			 
			if(resp.total!=0){
				
				$(percent).each(function(idx , issue){
					values.push(issue.issuePercent*10)
					labels.push(issue.ctgryNm)
				})
			 var options = {
		series: values,
		labels:labels  ,
		          chart: {
		          type: 'donut',
		          height: 200 
		        	},
		         	 dataLabels: {
		        		    enabled: true,
		        		    formatter: function (counts) {
		        		    var value =	Math.round(counts)
		        		      return  value + "%"
		        		    }
		        	 }, 
		        	 
		        	 tooltip: {
		        	      enabled: true ,
		        	      enabledOnSeries: undefined,
		        	      shared: true,
		        	      followCursor: false,
		        	      intersect: false,
		        	      inverseOrder: false,
		        	      custom: undefined,
		        	      fillSeriesColor: false,
		        	      theme: "light",
		        	      style: {
		        	        fontSize: '12px',
		        	        fontFamily: undefined
		        	      },
		        	      onDatasetHover: {
		        	          highlightDataSeries: false,
		        	      },
		        	      x: {
		        	          show: false,
		        	          format: 'dd MMM',
		        	          formatter: undefined,
		        	      },
		        	      y: {
		        	    	  formatter: function(value, { series, seriesIndex, dataPointIndex, w }) {
		        	    	      return ": " + value/10 + " TOTAL : " +total
		        	    	      
		        	    	    },
		        	          title: {
		        	              formatter: (seriesName) => seriesName,
		        	          },
		        	      },
		        	      z: {
		        	          formatter: undefined,
		        	          title: 'Size: '
		        	      },
		        	      marker: {
		        	          show: true,
		        	      },
		        	      fixed: {
		        	          enabled: false,
		        	          position: 'topRight',
		        	          offsetX: 0,
		        	          offsetY: 0,
		        	      },
		        	  },
		        responsive: [{
		          breakpoint: 480,
		          options: { 
		            chart: {
		              width: 300,
		              heigth : 500
		              
		            },
		            legend: {
		              position: 'bottom'
		            }
		          }
		        }]
		        };
		
				 var chart = new ApexCharts(document.querySelector("#cartegoryChart"), options);
				chart.render();
				
				
			 }else{
				 $("#cartegoryChart").append(
						 $("<div>").html("?????? ???????????? ???????????? ?????? ????????? ??? ??? ????????????")
						)
					
			}
			
		},
	    complete: function() {
	       
	         setTimeout(updateChart, 5000);  
	      }
		
	})
	
}

	


</script>

</body>
</html>