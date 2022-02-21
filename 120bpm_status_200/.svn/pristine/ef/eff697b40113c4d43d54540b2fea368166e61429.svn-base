<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" href="${cPath }/resources/css/commons.css">
<script type="text/javascript"	src="${cPath }/resources/js/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css"> 

.back, #workList {
	padding-top: 50px;
}

tr[id]:hover {
	background: rgb(240, 249, 252, 0.3)!important;
}

tr {
	cursor: default;
}

input, select {
	outline: none;
}

select::-ms-expand {
	display: none;
}

 

i {
	cursor: pointer;
}

.notAccess {
	text-align: center;
	display: none;
}

.realLink:hover {
	cursor: pointer;
}

#myWorkBody{
height: 500px!important;
min-height : 500px!important;
max-height : 500px!important;
}
 
#chartUI{
	/* margin-top : 40px; */
	display: grid;
	grid-template-columns: 1fr 1fr;
}
 
 .multi{
 z-index: 0;
 
 }
.smallD {
   /*  margin: 20px; */
    float: left;
    box-shadow: 1px 2px 3px 1px #d5d7db;
    padding: 0 10px;
    border-radius: 20px;
    background-color: white;
   height: 180px;
}

#multiLine{
text-align:center;
vertical-align:middle;
z-index: 0;
}
 
.links {
text-align: left;
font-size: 1.2em;
}

#myWorkList{
width :100%;
table-layout:fixed;
}

#myWorkList tr{
/* height: 100px!important; */
}
.selectCheck {

text-align:center;
}
 
 

.leftArea{
text-align: right;
}

/* 모달창의 배경을 만든다 */
  .modal__background{
  position: fixed;
  top:0; left: 0; bottom: 0; right: 0;
  background: rgba(230, 230, 230, 0.8);
}  

 
 .modal {
        text-align: center;
         border-radius: 10px;
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


.progress{
width: 100px!important;
  background-color: #EEE6D5;
  -webkit-box-shadow: none;
  box-shadow: none;
  display: inherit;
}

.table thaed th tfoot td{
	padding : 30px 0 0;
} 
.listHeader{
	font-size: medium;
}

.left{
float: left;
}

.table{ 
width : 100%;
table-layout: fixed;
 
}
 
#searchUI{
clear: both;
display: table!important;
font-size: 1.4em!important;
 
padding: 10px;
 
} 


 
.right{
float: right;

}
.searching{
font-size: 28px;

} 
#searchingArea{
background-color: #F9F9F9;
/* margin-top: 0.2%; */
/* margin-bottom: 0.5%; */
 display: none;
} 

#count , #multi{
max-height: 170px;
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
 
.SOON {
	background-color: rgba( 255, 184, 184, 0.6)!important;
}

.PASSED{
	background-color: rgb(177, 177, 177 , 0.1)!important;
	
}

 

.textRight{

text-align: right;
}
.color{
float: left;
width: 20px;
height: 20px;
 margin: 1px 1px 0px 0px;
border: 1px gray solid !important;
} 

.textCenter{
text-align: center;
} 

.backColor{
 background-color: #FFFFFF;
} 
.progress{
font-size: 12px;
line-height: 20px;
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
padding: 10px;
} 


select{
  width: 170px!important;
  height: 40px!important;
  background-size: 20px!important;
  padding: 5px 30px 5px 10px!important;
  border-radius: 4px!important;
  outline: 0 none!important;

}
 
#delete{
 z-index: 9999; 
}
#acceptReq{
 z-index: 9999; 
}


input[type='date']{
			height:40px;
            width:200px!important;
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
margin-top: 8px;
}

.marginRight{
margin-right: 20px;
}
.marginLeftRight{
justify-content: center;
    padding-right: 20px!important;
/* margin-right: 10px;
margin-left: 10px; */
}
.marginlarger{
margin-right: 100px;
margin-left: 100px;
}
.marginLeft{
margin-left: 100px;

}

.table tfoot td{
padding-top: 0;
} 

 
.ctgryNm{
 width:100px;
 white-space:nowrap; 
 overflow:hidden; 
 text-overflow: ellipsis;
 height: 45px;
 text-align: left; 
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
 
 
  .backColor{
 background-color: #FFFFFF;
} 
#searchText{
width :200px;
}  
  .labelLength{
width: 130px;

}

.widths{
width :500px;
}
.prior{
width : 100px;
}
#headTitle{
	margin: 0;
}
 
</style>
</head>
<security:authentication property="principal.adaptee" var="authMember" />
<security:authentication property="authorities" var="authMemRoles" />

<body>
 
<div  class="right links xs-4">
			 <span class="link realLink" onclick="allWork()">전체일감 </span> <span  class="link">  &nbsp; &nbsp;|  &nbsp; &nbsp;</span> 
			 <span class="link realLink" onclick="myWork()">내일감</span><span  class="link">  &nbsp; &nbsp;|  &nbsp; &nbsp;</span> 
			 <span class="link realLink" onclick="bookMark()">⭐즐겨찾기 일감 &nbsp; &nbsp;|  &nbsp; &nbsp;</span>
			 <c:url value="/project/${pCode}/work/create" var="insertURL">
			 </c:url>
			 <span class="link realLink controlBtn" data-gopage="${insertURL }">새 일감 추가 <i class="fa fa-plus" aria-hidden="true"></i></span>
		</div>
		
<h1 id="headTitle" style = " font-weight: bold;"> <i class="fa fa-briefcase" aria-hidden="true"></i>&nbsp; &nbsp;내 일감 리스트 </h1>
 <div class="textRight">
 <span class="backcolor">
	<button id="searchButton" class="searchBtn btn">상세검색<span>🔍</span></button>
	</span>
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
 		 	 
 		 	  <label class="labelLength">카테고리</label> 
 	 <select  class="form-control searchOption" id="category" name="ctgryCode">
				<option value>카테고리</option>
				<c:forEach items="${cartegoryList }" var="cartegory">
					<option value="${cartegory.ctgryCode }">
						${cartegory.ctgryNm }</option>
				</c:forEach></select>
 		
 		 	<label class="labelLength">
 	 승인 상태
 	</label>
 	 <select class="form-control" id="ReqStatus" name="workReqSttusCode">
				<option value>승인상태</option>
				<option value="isNull">승인요청 전</option>
				<c:forEach items="${CommonList }" var="commons">
					<option value="${commons.codeNo }">
						${commons.codeNm }</option>
				</c:forEach>
			</select>	
			 
 		<label class="marginRight">
 	 	제목 검색
 		</label>
		 	<input type="text" name="searchWord" id="searchText" placeholder="일감 제목 입력" class="form-control" />
	 		 <button type="button" id="searchBtns" class="btnTags btn searchBtn">검색</button>
			<!-- <button type="button" id="resetBtn" class="btnTags btn resetBtn">초기화</button> -->
 			<button type="button" class="resetBtn btn"><img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button> 
 	 	</div>
 	 	</div>
 	</td>
 
 </tr>
 
 </table>
 
</div>
  </div>


<br>
<div id = "chartUI">
  <div class="smallD">
	<div id="count"></div>
</div> 
<div class="smallD multi">
	<div id="multiLine"></div>
</div>
</div>
  
 
		 
		 
		 
		  <div id="btnArea" class="leftArea">
		  <br>	
 	<div class="color SOON">
		
	</div>
	<span class="left"> 
		종료일이 일주일 이전인 일감
	</span>
	<div class="color PASSED">
		
	</div>
	<span class="left "> 
		 지난 일감
	</span>			
					</div>
    
	 	 
	<br>	 
	<br>	 
	<div class="wrap ">
		<div class="tab_btn left">
				 
		 
		<ul class="tabs widths">
					<li class="tab-link current"  >전체</li>
					<li class="tab-link" data-tab="1">공개</li>
					<li class="tab-link " data-tab="0">비공개</li>
		</ul>

		 
</div>
  <span class="right ">
		 <button id="delete" class="btn deleteBtn checking origin">삭제</button>
		 <button id="acceptReq" class="btn  btbtn  checking origin">완료 승인요청</button>	
    </span>
	</div>
		
	<table id="myWorkList" class="table">
	<thead class="listHeader">
		<tr>
			<th colspan='2' class="selectAll selectCheck">전체선택
			<input class="selectCheck" id="allCheck" type="checkbox" > </th>
			<th colspan='2' >카테고리</th>
			<th colspan="2" >제목<i class="fa fa-sort sort" aria-hidden="true"  data-item="WORK_SJ"></i></th>
			<th colspan="2">승인상태</th>
			<th class="prior">우선순위 <i class="fa fa-sort sort" aria-hidden="true" data-item="WORK_PRIORT_CODE"></i></th>
			<th colspan="2"  data-item="WORK_RGSDE">등록일자<i class="fa fa-sort sort" aria-hidden="true" data-item="WORK_ENDDE"></i></th>
			<th colspan="2"  data-item="WORK_ENDDE">종료일자<i class="fa fa-sort sort" aria-hidden="true" data-item="WORK_ENDDE"></i></th>
			
			<th colspan='2' >진척도 <i class="fa fa-sort sort" aria-hidden="true"
				data-item="WORK_PRGS_DGREE_POINT"></i></th>
		    
			</tr>
	</thead>
		<tbody id="myWorkBody">

		</tbody>
		<tfoot>
			<tr class="fixed">
				<td  colspan="15">
					<div id="pagingArea" class="d-flex justify-content-center"></div>
				</td>
				 
			</tr>
		</tfoot>
			
	</table>
	
	<form id="searchForm" method="post" action="${cPath }/project/${pCode}/workList/myWorkListJson">
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
	
 

<!-- 비밀번호 체크 -->
  <div id="background">
		 <div class="modal fade" id="checkModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-fullscreen-lg-down  modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="staticBackdropLabel" >
		       	  <i class="fa fa-pencil-square-o" aria-hidden="true"></i> 	비밀번호 확인
		    </h2>
		      		 <a class="btn-close trigger closeModal" href="#">
       					 <i class="fa fa-times" aria-hidden="true"></i>
    				  </a>
		      </div>
		      <div class="modal-body">
		      	<form id="passCheckForm" method="Post">
		      	<label>비밀번호</label>
		      		<input  type="password" onkeyup="enterDown()"  id="memIdCheck" name="memPass" class="holderInput inputPass" placeholder="비밀번호 입력" required>
		      		<input type="hidden" name="memId" >
		      		<input type="hidden" name="workCode[]" >
		      		<input type="hidden" name="choice">
		      	</form>
		    	<div class='show'> <button type="button"  class="btn btn-sm btn-light" id="showMemPass">비밀번호 보기<span class="checkAt"><i class="fa fa-square-o" aria-hidden="true"></i></span></button></div>
		      <div class="modal-footer">
		        <button type="submit" class="btn updateBtn check">확인</button>
		        <button type="button"  class="btn btn-secondary closeModal" data-bs-dismiss="modal">닫기</button>
		      </div>
				 
		      </div>
		    </div>
		  </div>
		</div>
</div>
 

<script type="text/javascript">
  
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
	setDefaultDate();
}  

  
 $('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');
		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');
		$("[name='workOthbcAt']").val(tab_id)
		nextTab()
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
  
 //============================================
	$(function(){
    let searchUI = $("#searchingArea") 
    $("#searchButton").on("click", function(){
       if(searchUI.is(":visible")){
          searchUI.slideUp();
       } else {
          searchUI.slideDown();
       }
    });
	
    setDefaultDate();
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
	 
	function bookMark(){
		location.href = "${cPath}/project/${pCode}/workList/myBookmarkList";	
	}
	 
	//==============================================================
	 $.ajax({
		 url : "${cPath}/project/${pCode}/workList/myWorkList/perMonth",
		 dataType :"json",
		 success :function(resp){
			 let workPercent = resp.perMonth
			 console.log(resp.perMonth)
			 let seriesArr1 = [];
			 let labelsArr1 = [];
			 $(workPercent).each(function(idx, work) {
				 seriesArr1.push(work.reqMonth)
				 labelsArr1.push(work.workRgsde)
				});
			 
			   var options = {
				          series: [{
				            name: "등록된 일감 수",
				            data: seriesArr1
				        }],
				          chart: {
				          height: 170,
				          width :400,
				          type: 'line',
				          zoom: {
				            enabled: false
				          }
				        },
				        dataLabels: {
				          enabled: false
				        },
				        stroke: {
				          curve: 'straight'
				        },
				        title: {
				          text: '월별 일감 등록 수',
				          align: 'left'
				        },
				        grid: {
				          row: {
				            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
				            opacity: 0.5
				          },
				        },
				        xaxis: {
				          categories: labelsArr1,
				        }
				        };
				        var chart1 = new ApexCharts(document.querySelector("#count"), options);
				        chart1.render();

		 }
		 
		 
	 })
 
     //================================================================
	 $.ajax({
		 url : "${cPath}/project/${pCode}/workList/myWorkList/percent",
		 dataType :"json",
		 success :function(resp){
			 
			 let workPercent = resp.workPercent
			 let seriesArr = [];
			 let labelsArr = [];
			 $(workPercent).each(function(idx, work) {
				 seriesArr.push(work.percent)
				 labelsArr.push(work.ctgryNm)
		});
			 
			 //=============================
			 
			  var option1 = {
			          series: [{
			          name: '진척도',
			          data: seriesArr
			        }],
			          chart: {
			          width :500,
			          height: 200,
			          type: 'bar',
			        },
			        plotOptions: {
			          bar: {
			            borderRadius: labelsArr.length,
			            dataLabels: {
			              position: 'top', // top, center, bottom
			            },
			          }
			        },
			        colors: [
			        	  function({ value, seriesIndex, w }) {
			        	    if (value == 100) {
			        	      return '#69D2E7'
			        	    } else {
			        	      return '#FF9800'
			        	    }
			        	  }
			        	],
			         
			        dataLabels: {
			          enabled: true,
			          formatter: function (val) {
			            return val + "%";
			          },
			          offsetY: 5,
			          style: {
			            fontSize: '12px',
			            colors: ["#304758"]
			          }
			        },
			        
			        xaxis: {
			          categories: labelsArr,
			          labels: {
			              rotate: -20
			            },
			          position: 'bottom',
			          axisBorder: {
			            show: false
			          },
			          
			          axisTicks: {
			            show: false
			          },
			          crosshairs: {
			            fill: {
			              type: 'gradient',
			              gradient: {
			                colorFrom: '#D8E3F0',
			                colorTo: '#BED1E6',
			                stops: [0, 100],
			                opacityFrom: 0.4,
			                opacityTo: 0.5,
			              }
			            }
			          },
			          tooltip: {
			            enabled: true,
			          }
			        },
			        yaxis: {
			          axisBorder: {
			            show: false
			          },
			          axisTicks: {
			            show: false,
			          },
			          labels: {
			        	offsetY: 0,
			            show: false,
			            formatter: function (val) {
			              return val + "%";
			            }
			          }
			        
			        },
			        title: {
			          text: '카테고리에 따른 진척도 비율 ',
			          floating: true,
			          offsetY: 0,
			          align: 'top',
			          style: {
			            color: '#444'
			          }
			        }
			        };

			        var chart = new ApexCharts(document.querySelector("#multiLine"), option1);
			        chart.render();
			 
		 }//success
		 
	 })
			 
			 
	 

//===============================================================================
let searchForm  = $("#searchForm")
let tbody = $("#myWorkBody")
let pagingArea = $("#pagingArea")
let deleteBtn = $(".deleteBtn")

let acceptReq = $(".acceptReq")
 
let checkAt = $(".checkAt");
	 
let sendWorkId = [];

$("[name='searchType']").val("title");
$("[name='searchWord']").val("${pagingVO.simpleSearch.searchWord}");
$("[name='startDate']").val("${pagingVO.simpleSearch.startDate}");
$("[name='endDate']").val("${pagingVO.simpleSearch.endDate}");
$("[name='ctgryCode']").val("${pagingVO.simpleSearch.ctgryCode}");
$("[name='workReqSttusCode']").val("${pagingVO.simpleSearch.workReqSttusCode}");
$("[name='workOthbcAt']").val("${pagingVO.simpleSearch.workOthbcAt}");
searchForm.find("[name='page']").val("");

let bgnde = $("input[name='startDate']")
let endde = $("input[name='endDate']")

let myCheckAt = false;
sortResult = false; //asc

let choice = $("input[name='choice']")

$(".resetBtn").on("click", function() {
	myWork();
})

function allWork() {
		location.href="${cPath}/project/${pCode}/workList"
	}


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

$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})


$("tbody").on( "click", ".sj", function() {
			let workCode = 	$(this).closest("tr").prop("id")
 			 location.href = "${cPath}/project/${pCode}/workDetail/"+ workCode ;
		 
		});
//리셋
function myWork(){
	$("[name='searchWord']").val("");
	$("[name='startDate']").val("");
	$("[name='endDate']").val("");
	$("[name='ctgryCode']").val("");
	$("[name='workReqSttusCode']").val("");
	$("[name='workOthbcAt']").val("");
	$("[name='sidx']").val("");
	$("[name='sortType']").val("");
	searchForm.find("[name='page']").val("");
	searchForm.submit();
	setDefaultDate();
}

//정렬 변경
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
		setDefaultDate();
	}
});


//검색버튼
$("#searchBtns").on( "click", function() {

			if (  ($("#starting").val() != null && $("#ending").val() == null)
					|| ($("#ending").val() != null && $("#starting").val() == null)) {
				

				swal({
					title : "잘못된 요청입니다!",
					text : "시간과 종료기간 모두 선택해주세요",
					icon : "error",
				});
				return false;
			} else if (new Date($(bgnde).val()).getTime() > new Date($(endde).val()).getTime()) {
				swal({
					title : "잘못된 요청입니다!",
					text : "종료날짜보다 시작날짜가 작아야합니다.",
					icon : "error",
				});

				return false;
			} else {
				$("[name='workReqSttusCode']").val($("#ReqStatus").val());
				$("[name='workOthbcAt']").val($("#openAt").val());
				
				$("[name='sidx']").val("");
				$("[name='sortType']").val("");
				
				$("[name='searchWord']").val($("#searchText").val());
				$("[name='endDate']").val($("#ending").val());
				$("[name='startDate']").val($("#starting").val());
				$("[name='ctgryCode']").val($("#category").val());
				searchForm.find("[name='page']").val("");
				searchForm.submit();
				/*  $("#searchingArea").hide() */
			}
		})

 ///페이징
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
						trTags.push(makeMyTrTag(work));
					});
					sendWorkId = [];
					myCheckAt = false;
					 $('#allCheck').prop('checked', false)	
					// $(".selectCheck").hide();
					 $(".origin").addClass("checking")
					 $("#re").remove();

					 var ListWidth = trTags.length;
						if(ListWidth <5){
							for(var i = 0 ; i<5 - ListWidth;i++ ){
								trTags.push(
										$("<tr>").html(
												$("<td>").attr("colspan" , "15").prop("class" , "fixedArea")		
											)
									 )		
							}
						}
						  
					 
					pagingArea.html(pagingVO.pagingHTMLBS);
				} else {
					trTags.push($("<tr>").html(
							$("<td>").attr("colspan", "15").prop("class" , "textCenter").html(
									"해당하는 업무가 존재하지 않습니다.")));
				}
				
				
				tbody.append(trTags);
				if($("div").hasClass("colorChange")){
					   $(".colorChange").closest('.progress').html("0%");
					 //;
					/* $(this).parents("").text("0%"); */
				}  
				
			}
		}).submit();
 
 
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
				  button: "확인"
				});
		}else{
			Swal.fire({
				  icon :"error", 
				  text: resp.why,
				  button: "닫기"
				});
			
		}
	 }
	});  
	
});
 //===============================================================
 
	
	 
function makeMyTrTag(work){

	 
if( (work.workReqSttusCode!=null && work.workReturnWhy!=null)    ){//조건  상태인경우 상태이고 메세지가 등록되어있는경우 
	
	return $("<tr>").append(
			$("<td colspan='2'>").append( $("<input class='myCheck' >").attr("type" , "checkbox").attr("data-workReqCode", work.workReqSttusCode).prop("name" , "workCode")
								).prop("class" ,"selectCheck , links"),
			$("<td colspan='2'  class='ctgryNm '>").html(work.ctgryNm),
			/* $("<td>").html(work.workOpen), */
			$("<td colspan='2'  class='sj'>").css("width" ,"30%" ).html(work.workSj),
			$("<td colspan='2'>").html(work.workReqNm +"&nbsp;&nbsp;")
							.append(  //.data("returnWhy", work.workCode)html(+" &nbsp; ")
							$("<span>").append(
									$('<button class="btn whyNot btn-info btn-sm">' ).append(
											 '<i class="fa fa-info-circle  fa-lg" aria-hidden="true"></i>'		
												).data("workCode", work.workCode )
									 ) 
							
								),
			 $("<td>").html(work.priortNm),
			 $("<td colspan='2' >").html(work.workRgsde  ),
			 $("<td colspan='2' >").html(work.workEndde != null ? work.workEndde : "미정" ),
			 $("<td colspan='2' >")
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
			).prop("id", work.workCode).prop("class", work.workDateStatus)
	
	
}else{ // 
	                      
	if(work.workReqSttusCode=="W00301"||work.workReqSttusCode=="W00302" ){
		var className = "notAccess"
	}else{
		
		var className = "myCheck";
	}
 
	return $("<tr>").append(
					$("<td colspan='2' >").append( $("<input>").attr("type" , "checkbox").prop("class" ,className).attr("data-workReqCode", work.workReqSttusCode).prop("name" , "workCode")
							
					).prop("class" ,"selectCheck , links") , 
					$("<td colspan='2'  class='ctgryNm '>").html(work.ctgryNm),
					/* $("<td>").html(work.workOpen), */
					$("<td colspan='2'  class='sj'>").css("width" ,"30%" ).html(work.workSj),
					$("<td  colspan='2'>").html( work.workReqNm !=null ? work.workReqNm :'-'),
					$("<td>").html(work.priortNm),
					$("<td colspan='2' >").html(work.workRgsde  ),
					 $("<td colspan='2' >").html(work.workEndde != null ? work.workEndde : "미정" ),
					$("<td colspan='2' >").append(
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
											).prop("id", work.workCode).prop("class", work.workDateStatus).data("workSttusCode" ,work.workSttusCode)
			}
}
 
//===============================================================

  
 $("tbody").on("change" , ".myCheck" , function(){
	 
	 		if($(this).hasClass("notAccess")){
	 			$(this).prop('checked',false);
	 			Swal.fire({
					  icon :"error", 
					  text: "이미 승인 신청을 한 일감과 완료된 일감은 선택이 불가합니다",
					  button: "확인"
					});
	 		}else{
	 			 let allCheckLenght   = $(".myCheck").length;
	 			  let checked = $(".myCheck:checked").length;
	 			 if(allCheckLenght!= checked){
	 				$('#allCheck').prop('checked',false);
	 			 }else if(allCheckLenght==checked){
	 				$('#allCheck').prop('checked',true);
	 			 }
	 		}	 
}) 

  
  
 //===============================================================
 
 
 
$("#allCheck").on("click", function(){
	if($('#allCheck').is(':checked')){       
		   let checkboxes   = $(".myCheck").length//
		   let disabled =   $('.notAccess').length//2
		 // let allCheckLenght =checkboxes - disabled;
		  
			if(checkboxes>0){
				if($(".myCheck").hasClass("notAccess")){        
					  $('.myCheck').prop('checked',false);
				}else{
					  $(".myCheck").prop('checked',true); 
				}
				 
			}else{
				Swal.fire({
					  icon :"error", 
					  text: "변경 가능한 일감이 없습니다",
					  button: "확인"
				}).then(function(){
					 $('#allCheck').prop('checked',false);
			    });
			}		 
		
	    }else{
	       $('.myCheck').prop('checked',false);
	    }

})
 //========변경 가능한 일감 체크 이미 신청되거나 완료된 경우 셀렉트 삭제======================================================
 
 
let checking = $(".checking");
 
 
	
	 
	 //z클릭된 동안 속성 변경
$("#showMemPass").on("mouseup" , function(){
	$("#memIdCheck").attr("type" , "password");
	checkAt.html('<i class="fa fa-square-o" aria-hidden="true"></i>')
});

 
$("#showMemPass").on("mousedown" , function(){
	$("#memIdCheck").attr("type" , "text");
	checkAt.html('<i class="fa fa-check-square" aria-hidden="true"></i>')
});

	
$(".closeModal").on("click" , function(){
	  $("#checkModal").hide();
	  $( '#background' ).removeClass( 'modal__background' );
	  $("#memIdCheck").val("");
	  choice.val("");
}) 
	
	
	function checkedArray(){
	 	  let cnt = 0 ; 
	let checked = $(".myCheck:checked").each(function(){
    	  let value = $(this).closest("tr").attr("id")
    	  cnt ++;
    	  sendWorkId.push(value)
    })
	
	    if(	cnt>0){
	     $(checkModal).show();
		 $( '#background' ).addClass( 'modal__background' );
	    }   
	
		if(cnt==0){
			Swal.fire({
				  icon :"error", 
				  text: "선택된 일감이 없습니다",
				  button: "확인"
			})
		}
		return cnt
	}
	
	
	
	
	
	
 
	$("#acceptReq").on("click" , function(){
				checkedArray()
				choice.val("req");
		// let sendWorkId = [];
	 
	  });
	  
	  
	$("#delete").on("click" , function(){
		// let sendWorkId = [];
		checkedArray()
	    choice.val("del")
	  });

	
	function enterDown() {
		if (window.event.keyCode == 13) { 
			formSubmit();
		 } 
		}

		 
	 
		
	function formSubmit(){
		$.ajax({
			url : "${cPath }/project/${pCode}/work/create/accountCheckAll",
			method :"post",
			dataType : 'text',
			traditional : true,
			/* dataType : 'text', */
			data : {"memPass"  : $("#memIdCheck").val() , 
				"workCode" :  sendWorkId  , "memId" : "${authMember.memId}" ,
				"memName"	: "${authMember.memLnm}${authMember.memFnm}" , "choice" : choice.val()
				},	
			success : function(resp){
				if(choice.val()=="del"){
						if(resp == "OK"){
						Swal.fire({
							  icon: "success",
							  title: "삭제 성공",
							  text: "삭제가 성공적으로 완료되었습니다.",
							  button :"확인",
							}).then(function(){
								 location.reload();
						    });
						}else if(resp == "FILEDELFAIL" ){
							Swal.fire({
								  icon: "error",
								  title: "삭제 실패",
								  text:  "파일 삭제에 문제가 생겼습니다.",
								  button :"확인",
								}).then(function(){
									 location.reload();
							    });
					}else if(resp=="FAIL"){
						Swal.fire({
							  icon: "error",
							  title: "승인 요청 실패",
							  text:  "비밀번호가 일치하지 않습니다.",
							  button :"확인",
							}).then(function(){
								 location.reload();
						    });
						}else{
							Swal.fire({
								  icon: "error",
								  title: "승인 요청 실패",
								  text:  "서버상의 오류로 승인요청에 실패했습니다. 잠시후에 다시 시도해주세요",
								}).then(function(){
									 location.reload();
							    });
					}/////del if 문 끝
				}else if(choice.val()=="req"){
					if(resp == "SEND" ){
						Swal.fire({
							  icon: "success",
							  title: "승인 요청 성공",
							  text: "승인요청이 성공적으로 완료되었습니다.",
							  button :"확인",
							}).then(function(){
								 location.reload();
						    });
					}else if(resp == "SENDFAIL" ){
						Swal.fire({
							  icon: "error",
							  title: "승인 요청 오류",
							  text:  "PM에 알림 실패",
							  button :"확인",
							}).then(function(){
								 location.reload();
						    });
						
						}
							else if(resp=="FAIL"){
								
								
								Swal.fire({
									  icon: "error",
									  title: "승인 요청 실패",
									  text:  "비밀번호가 일치하지 않습니다.",
									  button :"확인",
									}) 
									sendWorkId = []
									 $("#memIdCheck").val("") 
									
							 
							}
					}else{
						Swal.fire({
							  icon: "error",
							  title: "승인 요청 실패",
							  text:  "서버상의 오류로 승인요청에 실패했습니다. 잠시후에 다시 시도해주세요",
							  button :"확인",
							}).then(function(){
								 location.reload();
						    });
				}
			
			} //success 
		 		
					 
			})
		 
	}
		$(".controlBtn").on('click', function(){
			 
			let gopage = $(this).data("gopage");
			if(gopage){
				location.href = gopage
			}
	})
		

$(".check").on("click" , function(){
	 
	formSubmit();
	
 
	});
 


</script>
</body>
</html>