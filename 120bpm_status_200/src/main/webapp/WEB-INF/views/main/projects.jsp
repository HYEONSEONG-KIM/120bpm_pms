<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style>
#searchUI{      
	width:86%;
	line-height: normal;
	align-items: flex-end;
}   

#proejctList, #pagingArea { 
	width: 95%;   
} 

.accordion .myProgress { 
	background-color: #f3f3f3;
	border-radius: 5px;
	border : 2px outset #f3f3f3;
	box-shadow: 1px 1px 1px #d5d7db;
}

.accordion .progressbar {
	width: 0%;      
	height: 30px;    
	padding-top : 4px;
	background-color: #42b4e6;
	text-align: center; /* To center it horizontally (if you want) */
	border-radius: 5px;
} 
.active .progressbar{
	background-color: #9ce1ff; 
}
 
.smallD {
	width: 80%;
	margin: 20px;
	float: left;
	box-shadow: 1px 2px 3px 1px #d5d7db;
	padding: 0 10px;
	border-radius: 20px;
}
.accordion, .noAcc {
  background-color: #fff;
  color: #444;  
/*   cursor: pointer;   */
  padding: 15px 2% 5px;   
/*   margin-bottom : 10px;  */
  margin: 0 auto 10px;   
  width: 80%;   
  border: none; 
  outline: none;
  font-size: 15px;     
  border : 2px outset #fff;
  border-radius: 15px;
} 
.active.accordion{
   background-color: #42B4E6;
   border : 2px inset #42B4E6; 
}
/* .accordion:hover {  */
/*    background-color: #42B4E6; */
/*    border-color : #42B4E6; */
/* } */
.panel {  
	width : 77%;  
	padding: 15px 18px 0;  
	display: none;   
	margin: 0 auto 10px;    
	border : 2px inset white; 
	background-color: white;
	overflow: hidden; 
	background-color: #fdfdfd; 
}
.grid{
	display: grid; 
	grid-template-rows : 1.5fr 7fr 1fr;   
	row-gap : 2%;                      
}  
.prtReport{   
	cursor: pointer; 
	background-color: #f17f93;
	border : 2px outset #f17f93;
	padding : 4px; 
	color: white; 
}    
.accordion h5, .noAcc h5{
	font-weight: bold;
}
.active h5{
	 color : #fff;  
} 
.panel ul{ 
	margin-bottom : 0;
	padding : 0;
	font-size: 17px;
}
.panel li{   
	padding-right : 2%;
} 
.panel p{
 	vertical-align : text-top; 
 	width : 200px;
} 
.panel small{
	color : #42B4E6;
	font-weight: bold;
} 
.accordion .dates, .noAcc .dates{
	color : #808080;
}    
.active .dates{
	color : #eee; 
} 
.accordion .glyphicon,.noAcc .glyphicon{
	font-size: 1.2em;
	cursor : pointer;
	color : #1ABB9C;
}
.goProject{
	background-color: #fff;
	padding: 2px 5px;
}    
.accGrid{
	display: grid;  
	grid-template-columns : 2fr 2fr 2fr; 
	column-gap : 2%;    
	align-items: start;     
}  
.ptitle {
       font-size: 1.8rem;  
       font-weight: bold;
       color: #42B4E6; 
       line-height: 1.15;
       padding-bottom: 1.2rem; 
       border-bottom: 2px solid #42B4E6;
       letter-spacing: -0.03em;
}
.grid .form-control{
	display: inline-block;
    width: auto;
    vertical-align: middle;
}
.accordion h5,.noAcc h5,.uid .ui span{
	font-size: 1.1rem;
}   
.report_body{
	background-color: #f3f3f3;
}

#reportSelete{
	display: grid;
	grid-template-columns : 1fr 1fr 1fr;
	text-align: center;
	font-size: 25px;
}
#reportSelete span:hover{
	cursor: pointer;
	text-shadow: 2px 2px 2px lightgray;
}
.selectReport{
	font-weight: bold;
	color: navy;
	font-size: 30px;
}
.noneSelect{
	color: black;
}
</style> 
<h2 class="ptitle">&nbsp;&nbsp;내 프로젝트</h2>
<div class="ui program--search">
    <div class="float-md-left form-inline-left row pb-2 uid">
        <div class="ui program--count">
            <span>
                &nbsp;&nbsp;&nbsp;전체&nbsp; <strong id="ttCnt"> </strong>건 / 현재&nbsp; <strong id="nowCnt"></strong>건
            </span>
        </div>
    </div>
</div>
<div class="grid"> 
	<div id="searchUI" class="row item">
		<div>
			<div class="searchUIInput ">  
				<select name = "searchType" class="form-control mr-2">
					<option value>전체</option>
					<option value="prtTitle">프로젝트 제목</option>
					<option value="ornt">발주처</option>  
				</select>   
				<input type="text" name = "searchWord" id = "searchWord" class="form-control mr-2" />
				<input type="button" id="searchBtn" class="btnTags btn searchBtn" value = "검색"/>
			</div>  
		</div>  
	</div>

	<div id = "proejctDiv" class="item"> 
	</div>
	<div id = "pagingArea" class="item">
	</div>
</div>
		
<form id = "searchForm">
	<input type = "hidden" name = "checkDate" id = "searchFormDate" value = "whole"/>
	<input type="hidden" name = "searchType"> 
	<input type="hidden" name = "searchWord"> 
	<input type="hidden" name = "page"> 
</form> 
 
 
<div class="modal fade" id="prtReportModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="staticBackdropLabel"></h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <input type = "hidden" id = "prtIdReport"/>
      	<h1 style = "text-align: center; font-family: sans-serif;">프로젝트 완료 보고서</h1>
      <hr>
      <div id = "reportSelete">
		<span id = "prtInfoReport" class = "selectReport">프로젝트 정보</span>      	
		<span id = "workReport" class = "noneSelect">일감 보고</span>      	
		<span id = "ganttReport" class = "noneSelect">간트차트</span>      	
      </div>
      <hr>
      <div class="report_body">
      
      </div>
      
      <div class="modal-footer">
        <button type="button" class="gobackBtn btn-lg" data-bs-dismiss="modal" id = "closeRepModal">Close</button>
      </div>
    </div>
  </div>
</div>
 
<script> 
$(function(){
	$(document).ajaxComplete(function(event, xhr, options){
		searchForm.find("[name='page']").val("");
	}).ajaxError(function(event, xhr, options, error){
		console.log(event);
		console.log(xhr);
		console.log(options);
		console.log(error);
	});	
	
	
	
	//프로젝트 리스트 
	var proejctDiv = $('#proejctDiv');
	var pagingArea = $('#pagingArea');
	var searchForm = $('#searchForm').paging().ajaxForm({
		dataType : 'json', 
		success : function(res){ 
			proejctDiv.empty();
			pagingArea.empty();
			var dataList = res.dataList;
			
			var divs = "<div id='proejctList'>";
			if(dataList.length != 0){
				$(dataList).each(function(idx,li){
					
					var prtNm = li.prjctNm;
					var ornt = li.prjctOrnt;
					var scale = li.bsnssclae;
					var memList = li.projectMemList;

					var now = new Date();
					var endDay = new Date(li.prjctEndde);
					
					if(prtNm.length > 20){ 
						prtNm = prtNm.substring(0,20) + "...";
					}
					if(ornt==null){
						ornt = "없음";
					}
					if(scale==null){
						scale = "없음";
					}
					
					var memNames = "";
					for(var i=0; i<memList.length; i++){ 
						var memId = memList[i]["memId"]; 
						if(i>0) memNames += ", ";
						memNames += "<a data-id='"+memId+"'>"+memList[i]["memName"]+"</a>";
					}
					if((endDay - now) < 0){ 
						divs += "<div class='noAcc accGrid'>"; 
						divs += "<h5 class='prjctNm d-inline-block'  title='" + li.prjctNm + "'>" + prtNm;
						divs += "&nbsp;<button type='button'  data-prjctno='" + li.prjctNo  +"' class='goProject btn'><span class='glyphicon glyphicon-log-in' aria-hidden='true'></span></button>";
						divs +=  "</h5>"; 
						divs += " <h5 class='dates mt-1'>&ensp;&ensp; " + li.prjctBeginde + " ~ " + li.prjctEndde +" </h5>"; 
						divs += "<input type = 'button'  value = '완료보고서' class = 'prtReport btn float-right ' data-id = '" + li.prjctNo +"''/>"; 
						divs += "</div>"
					}else{   
						divs += "<div class='accordion accGrid'>"; 
						divs += "<h5 class='prjctNm d-inline-block'  title='" + li.prjctNm + "'>" + prtNm;
						divs += "&nbsp;<button type='button'  data-prjctno='" + li.prjctNo  +"' class='goProject btn'><span class='glyphicon glyphicon-log-in' aria-hidden='true'></span></button>";
						divs +=  "</h5>"; 
						divs += " <h5 class='dates mt-1'>&ensp;&ensp; " + li.prjctBeginde + " ~ " + li.prjctEndde +" </h5>"; 
						divs += "<div class='myProgress float-right'>"
						divs += "<div data-begin='" + li.prjctBeginde +"'";
						divs += "data-end='" + li.prjctEndde +"' class='progressbar'>0%</div>";
						divs += "</div>"
						divs += "</div>"
						divs += "<div class='panel'>"; 
						divs += "<ul><li class='d-inline-block'><b>◾시작일자</b> <small>|</small> <p class='d-inline-block short'>" + li.prjctBeginde +"</p></li>";
						divs += "<li class='d-inline-block'><b>◾담당PM</b> <small>|</small> <p class='d-inline-block short'>" + memNames + "</p></li>";  
						divs += "<li class='d-inline-block'><b>◾발주처명</b> <small>|</small> <p class='d-inline-block short'>" + ornt +"</p></li>";  
						divs += "<li class='d-inline-block'><b>◾종료일자</b> <small>|</small> <p class='d-inline-block short'>" + li.prjctEndde + "</p></li>";  
						divs += "<li class='d-inline-block'><b>◾구성원수</b> <small>|</small> <p class='d-inline-block short'>" + li.memCnt +"명</p></li>";  
						divs += "<li class='d-inline-block'><b>◾사업규모</b> <small>|</small> <p class='d-inline-block long'>" + scale +" (원)</p></li></ul>";
						divs += "</div>"; 
					}   
				})  
				 
			}else{
				divs += "<h5 class='text-center'>참여 프로젝트가 없습니다</h5></div>"; 
				 
			} 
			divs += "</div>";
			proejctDiv.html(divs); 
			pagingArea.html(res.pagingHTMLBS);
			$("#ttCnt").html(res.totalRecord);
			$("#nowCnt").html(dataList.length); 
			
			var pgbars = $(".progressbar");
			$.each(pgbars, function(i, pgbar) {
				var width = 0;
				beginDate = new Date($(pgbar).data("begin"));
				endDate = new Date($(pgbar).data("end"));
				today = new Date();
				let tobe = today.getTime() - beginDate.getTime();
				let endBegin = endDate.getTime() - beginDate.getTime();
				var percent = tobe / endBegin * 100;
				if(percent > 100){
					percent = 100;
					var interval = setInterval(start, 10);
					function start() {
						if (width >= percent) {
							clearInterval(interval);
						} else {
							width++;
							$(pgbar).css("width", width + "%")
									.css("color", "white");
							$(pgbar).text(width + "%");
						}
					}
				}else if (percent > 0 && percent <= 100) {
					var interval = setInterval(start, 15);
					function start() {
						if (width >= percent) { 
							clearInterval(interval);
						} else {
							width++;
							$(pgbar).css("width", width + "%")
									.css("color", "white");
							$(pgbar).text(width + "%");
						}
					}
				}
			});
			  
		}
	}).submit();

	//프로젝트 아코디언  
   $("body").on("click", ".accordion", function(e) {
	   e.stopPropagation();  
	    $(this).toggleClass("active"); 
		console.log($(this).next());  
	    var panel = $(this).next();
	    if($(panel).hasClass("panel")){
		    if ($(panel).css("display") === "block") {
		    	$(this).css("margin-bottom", "10px"); 
		    	$(panel).css("display", "none");
		    } else {    
		    	$(this).css("margin-bottom", "0"); 
		    	$(panel).css("display", "block");
		    } 
	    }else{
	    	
	    }
	});
	
	//프로젝트 이동
	$("body").on("click", ".goProject", function(e){
		e.stopPropagation();  
		let pCode = $(this).data("prjctno");
		let prjctNm = $(this).html(); 
		var popupWidth = 1400;               
		var popupHeight = 950;                 
		var popupX = (window.screen.width / 2) - (popupWidth / 2); 
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음    
		var popupY= (window.screen.height / 2) - (popupHeight / 2) - 50;  
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음       
		var popup = window.open("${cPath}/project/"+pCode + "/main", prjctNm + " 프로젝트", 'toolbar=yes,scrollbars=yes, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY );
	});
	
	
	
	let reportBody = $('.report_body');
	let prtReportModal = $('#prtReportModal');
	let prtIdReport = $('#prtIdReport');
	let selectReport = null;
	
	// 모달 열면서 프로젝트 정보 입력
	$('#proejctDiv').on('click','.prtReport',function(){
		let prtId = $(this).data('id');
		prtIdReport.val(prtId);
		$.ajax({
			url : "${cPath}/projectRep/info/"+prtId,
			dataType : "html",
			success : function(resp) {
				reportBody.empty();
				reportBody.html(resp);
				prtReportModal.modal('show');
				selectReport = $('#prtInfoReport');
				
			},
			error : function(errorResp) {

			}

		});
	})
	
	$('#closeRepModal').on('click',function(){
		prtReportModal.modal('hide');
	})
	
	// 프로젝트 정보
	$('#prtInfoReport').on('click',function(){
		
		let prtId = prtIdReport.val();
		$.ajax({
			url : "${cPath}/projectRep/info/"+prtId,
			dataType : "html",
			success : function(resp) {
				reportBody.empty();
				reportBody.html(resp);
				selectReport.attr('class', 'noneSelect');
				selectReport = $('#prtInfoReport');
				selectReport.attr('class','selectReport');
				
			},
			error : function(errorResp) {

			}

		});
			
	})
	
	// 일감보고
	$('#workReport').on('click',function(){
		
		let prtId = prtIdReport.val();
		$.ajax({
			url : "${cPath}/projectRep/work/"+prtId,
			dataType : "html",
			success : function(resp) {
// 				reportBody.empty();
				reportBody.html(resp);
				selectReport.attr('class', 'noneSelect');
				selectReport = $('#workReport');
				selectReport.attr('class','selectReport');
				
			},
			error : function(errorResp) {

			}

		});
			
	})
	
	// 간트차트 보고
	$('#ganttReport').on('click',function(){
		
		ganttHtmlAjax();  
		selectReport.attr('class', 'noneSelect');
		selectReport = $('#ganttReport');
		selectReport.attr('class','selectReport');

	})
	
	
	
	
	 var today = new Date(),
		day = 1000 * 60 * 60 * 24,
//	 	// Utility functions
		dateFormat = null,
		defined = null, 
		isObject = null;
	 
		//기간 초기 설정
		var now = new Date();  
		var nowdate = getFormatDate(now);
		var oneMonthLater = new Date(now.setMonth(today.getMonth() + 1));
		var startDate = ""; 
		var endDate = "";   

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
		$(".report_body").on("change", ".limitdate", function(){   
			var mindate = $(startDate).val();
			var maxdate = changeToYear(mindate);  
			if($(this).attr("name")=="startDate"){   
				$(endDate).prop("min",mindate);     
				$(endDate).prop("max",maxdate);   
			    if($(endDate).val().replaceAll("-", "") > maxdate.replaceAll("-","")){
			    	$(endDate).val(changeToMonth(mindate));
			    }  
			    if($(endDate).val().replaceAll("-", "") < mindate.replaceAll("-","")){
			    	$(endDate).val(changeToMonth(mindate));
			    }   
			}  
		});
		  


		  
		$(".report_body").on("click",'#searchBtnGantt',function(){
			var minde = $(startDate).val(); 
		 	var maxde = $(endDate).val(); 
			var data = {}; 
			data['startDate'] =  minde;
			data['endDate'] =  maxde;
			selectReport.attr('class', 'noneSelect');
			selectReport = $('#ganttReport');
			selectReport.attr('class','selectReport');
			console.log(data);
			ganttAjax(data);   
		}); 
		//간트차트 기간 검색시 작동하는 펑션 
		function ganttAjax(data){
			var prtId = prtIdReport.val(); 
			
			
			
			$.ajax({  
				url : "${cPath}/projectRep/gantt/find/"+ prtId,
				dataType : "json", 
//	 			data : $("#searchUI").serialize(),
				data : data,
				success : function(datas) {
					$(".x_title").find("small").html("<strong>"+ datas.length +"</strong>개의 일감");
					
					selectReport.attr('class', 'noneSelect');
					selectReport = $('#ganttReport');
					selectReport.attr('class','selectReport');
					 
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
//		 			chart.xAxis[0].update({
//		 				  min:today - 10 * day,     
//		 			});   
				},
				error : function(errorResp) { 
			 
				}
			}); 
			
		} //ganttAjax()끝

		
		  
		//간트차트 누르면 처음 동작하는  펑션
		function ganttHtmlAjax(){
			let prtId = prtIdReport.val();
			
			
			
			$.ajax({ 
				url : "${cPath}/projectRep/gantt/"+prtId,
				dataType : "html", 
				data : $("#searchUI").serialize(),
				success : function(resp) {
					
					reportBody.empty();
					reportBody.append(resp);
					selectReport.attr('class', 'noneSelect');
					selectReport = $(this);  
					$(this).attr('class','selectReport');
					
					startDate = $("input[name=startDate]"); 
					endDate = $("input[name=endDate]");  
					$(startDate).val(nowdate);        
					$(endDate).val(getFormatDate(oneMonthLater));   
					$(endDate).prop("min", $(startDate).val());      
					$(endDate).prop("max", changeToYear( $(startDate).val()));   
					  
					dateFormat = Highcharts.dateFormat;
					defined = Highcharts.defined; 
					isObject = Highcharts.isObject;
					
					selectReport.attr('class', 'noneSelect');
					selectReport = $('#ganttReport');
					selectReport.attr('class','selectReport');
				}, 
				error : function(errorResp) { 
			 
				} 
			}); 
			
		} //ganttAjax()끝

});
</script>