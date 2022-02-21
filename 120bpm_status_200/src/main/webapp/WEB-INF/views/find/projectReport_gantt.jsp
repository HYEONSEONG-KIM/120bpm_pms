<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<script src="${cPath }/resources/Highcharts-Gantt-9.1.2/code/highcharts-gantt.js"></script>
<script src="${cPath }/resources/Highcharts-Gantt-9.1.2/code/modules/exporting.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');  
svg, #container{
	font-family:'Noto Sans KR', sans-serif !important;
} 
text{   
	 width:1%;    
	 white-space: nowrap;      
	 overflow:hidden;      
	 text-overflow: ellipsis;
}
.bold{
	font-weight: bolder;
	font-size: 1.3rem;
	width : 100%;
} 
.light{ 
	color : grey;
}  

.searchInput{
	font-size: 1.1rem;
	font-weight: 300;
	margin-bottom: 5px;
}
.searchUIInput span{
	padding-left : 
	color : grey;
	font-size: 0.7em;
}
.dropdown-menu{
	min-width: 12%; 
}
.dropdown-item{
	font-weight: normal; 
	font-size: 1.3em;
}
input,select{ 
	margin-top: 8px;
} 
.delAddBtn{
	padding : 0;
	margin-left: 3px;
}
.highcharts-xaxis{  
	position: absolute !important; 
	top: 300px !important;  
	z-index: 500 !important;
}
.color {
    float: left;
    width: 20px;
    height: 20px;
    margin: 1px 1px 0px 0px; 
}
#ganttReport{
	width: 95%;
	margin: 2%;
}
#dateSearch{
	display: grid;
	    grid-template-columns: 13fr 7fr;
}
#searchBtnGantt{
	margin-top: 15px;
}
</style>
<div id = "ganttReport">
	<form id="searchUI"> 
		<div class="col-md-12 mt-2 searchInput" id = "dateSearch"> 
			<div class="searchUIInput" >   
				<span class="pl-3">*시작일로부터 최대 1년까지 검색 가능</span><br>
				<label>기간</label> 
				<input class="limitdate" type="date" name="startDate" /> ~ 
				<input  class="limitdate" type="date" name="endDate" />
			</div> 
			<div class="searchUIBtn ">  
				<button type="button" id="searchBtnGantt" class="btnTags btn searchBtn">검색<span>🔍</span></button>
			</div> 
		</div>   
	</form>   
	
	<div class="x_panel mt-1">
		<div class="x_title">  
			<h2 class=" bold">간트차트 <small class="float-right pt-1"></small></h2>
			<div class="clearfix"></div> 
		</div>    
		<div class="x_content mt-3" style="display: block;">
			<div id="container"></div>
		</div>    
	</div>
</div>

<script>
$(function(){


var today = new Date(),
day = 1000 * 60 * 60 * 24,
// Utility functions
dateFormat = Highcharts.dateFormat,
defined = Highcharts.defined,
isObject = Highcharts.isObject;

//기간 초기 설정
var now = new Date(); 
var startDate = $("input[name=startDate]"); 
var endDate = $("input[name=endDate]");
var nowdate = getFormatDate(now);
var oneMonthAgo = new Date(now.setMonth(today.getMonth() - 1)); 
var oneMonthLater = new Date(now.setMonth(today.getMonth() + 1));
$(startDate).val(getFormatDate(oneMonthAgo));        
$(endDate).val(getFormatDate(oneMonthLater));   
$(endDate).prop("min", $(startDate).val());     
$(endDate).prop("max", changeToYear( $(startDate).val()));  

function getFormatDate(date){ 
	var year = date.getFullYear();
	var month = (1 + date.getMonth());
	month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
	day = day >= 10 ? day : '0' + day;
	return year + '-' + month + '-' + day;
}
function getToYear(date){
	var year = date.getFullYear() + 1;  
	var month = (1 + date.getMonth());
	month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
	day = day >= 10 ? day : '0' + day;
	return year + '-' + month + '-' + day;
}
 
function changeToYear(date){
	var cd = new Date(date);
	return getToYear(cd);	 
} 
function changeToMonth(date){
	var cd = new Date(date);
	return getToMonth(cd);
}
function getToMonth(date){
	var year = date.getFullYear();
	var month = (2 + date.getMonth());
	month = month >= 10 ? month : '0' + month;
	var day = date.getDate();
	day = day >= 10 ? day : '0' + day;
	return year + '-' + month + '-' + day;
}
// $(".limitdate").on("change", function(){   
// 	var mindate = $(startDate).val();
// 	var maxdate = changeToYear(mindate); 
// 	if($(this).attr("name")=="startDate"){   
// 		$(endDate).prop("min",mindate);  
// 		$(endDate).prop("max",maxdate);   
// 	    if($(endDate).val().replaceAll("-", "") > maxdate.replaceAll("-","")){
// 	    	$(endDate).val(changeToMonth(mindate));
// 	    }  
// 	    if($(endDate).val().replaceAll("-", "") < mindate.replaceAll("-","")){
// 	    	$(endDate).val(changeToMonth(mindate));
// 	    }   
// 	}  
// });
  
// $("button[type=reset]").on("click", function(e){  
// 	e.preventDefault();
// 	$(".addSearchInput").empty();
// 	$(".dropdown-item").show();
// 	$("#searchUI")[0].reset(); 
// 	$(startDate).val(nowdate);
// 	$(endDate).val(getFormatDate(oneMonthLater));
// });

  
// $("#searchBtn").on("click",function(){
// 	console.log($("#searchUI").serialize());
// 	ganttAjax();  
// }); 
   
today = today.getTime();
Highcharts.setOptions({
    lang: {
        months: [
            '1월', '2월', '3월', '4월',
            '5월', '6월', '7월', '8월',
            '9월', '10월', '11월', '12월'
        ],
        weekdays: [
            '일', '월', '화', '수',  
            '목', '금', '토'
        ]
    },
    global: {  
        useUTC: false
    } 
});
  
ganttAjax();  
function ganttAjax(){
	$.ajax({  
		url : "${cPath}/projectRep/gantt/find/${pCode}",
		dataType : "json", 
		data : $("#searchUI").serialize(),
		success : function(datas) {
			$(".x_title").find("small").html("<strong>"+ datas.length +"</strong>개의 일감");
			 
		 	var minde = new Date($(startDate).val()); 
		  	minde = parseInt(minde.getTime());
		 	var maxde = new Date($(endDate).val()); 
		 	maxde = parseInt(maxde.getTime());
		   
			Highcharts.ganttChart('container',{
						series: [{
							name : "${leftMenuPrt.prjctNm }",
							data : datas
						}],      
						tooltip: {
	// 					  shape:"rect",
					      backgroundColor: "#fff", 
					      borderWidth: 3,
						  pointFormatter: function () {
						    var point = this,
						      format = '%Y-%m-%d', 
						      options = point.options, 
						      completed = options.completed,
						      amount = isObject(completed) ? completed.amount : completed,
						      status = amount * 100 + '%' ,
						      lines;   
			 
						    lines = [{  
						      value: point.fullname,
						      style: 'font-weight: bold; font-size: 17px; '
						    }, {
						      title: '시작일자',  
						      value: dateFormat(format, point.start)
						    }, {
						      visible: !options.milestone,
						      title: '종료일자',
						      value: dateFormat(format, point.end) 
						    }, {
						      title: '진척도',
						      value: status
						    }, {
						      title: '담당자',
						      value: options.owner || 'unassigned'
						    }, {
						      title: '상태',
						      value: point.sttus
						    }, {
						      title: '우선순위',
						      value: point.priort  
						    }];
	
						    return lines.reduce(function (str, line) {
						      var s = '', 
						        style = (
						          defined(line.style) ? line.style : 'font-size: 1em; '
						        ); 
						      if (line.visible !== false) {
						        s = (
						          '<span style="' + style + '">' + 
						          (defined(line.title) ? line.title + ': ' : '') +
						          (defined(line.value) ? line.value : '') +
						          '</span><br>'
						        );
						      }
						      return str + s;
						    }, '');
						  }
						},
						xAxis: { 
						  currentDateIndicator: { 
						      width: 2,  
						      color: '#42B4E6', 
						      label: { 
						          format: '%Y-%m-%d %a %H:%M'
						      } 
						  }, 
						  dateTimeLabelFormats : {
							  week : "%W주"
						  },  
						  min: minde,     
						  max: maxde 
						} 
					 
			}); 
// 			chart.xAxis[0].update({
// 				  min:today - 10 * day,     
// 			});   
		},
		error : function(errorResp) { 
	 
		}
	}); 
	
} //ganttAjax()끝

 
	$("#container").on("click", ".highcharts-series > .highcharts-point", function(event){
		let workCode = event.originalEvent.point.id;  
		location.href = "${cPath}/project/${pCode}/workDetail/" + workCode;
	}); 


});  
</script>
<jsp:include page="/includee/footer.jsp"/>