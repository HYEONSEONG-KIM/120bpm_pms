<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<%-- <script src="${cPath }/resources/Highcharts-Gantt-9.1.2/code/highcharts-gantt.js"></script> --%>
<%-- <script src="${cPath }/resources/Highcharts-Gantt-9.1.2/code/modules/exporting.js"></script> --%>
<style type="text/css">
#searchPar{
	display: flex;
	flex-direction: row;
}

#searchUI{
	width:100%;
	line-height: normal;
	justify-content: flex-end;
	margin-right: 2.5%;
}  

#proceeding{

	width:100%;
	line-height: normal;
	justify-content: flex-start; 
	margin-left: 2%;
}
#proceeding select{

	font-size: 1.1rem; 
	font-weight: 300;
	border: 1px solid #aba9a9;
}
#proejctList {
	width: 95%;
	background: #fcfcfc;
	display: grid;
	grid-template-columns : 1fr 1fr 1fr 1fr;
	margin: 0 2%;
	text-align: center;
}
.searchUIBtn{
	margin-left: 5px;
}
.searchUIBtn{
	margin-top: -20px;
}
.myProgress {
	width: 95%;
	background-color: #f3f3f3;
	border-radius: 5px;
	box-shadow: 1px 1px 1px #d5d7db;
}

.progressbar {
	width: 0%;
	height: 20px;
	background-color: #42b4e6;
	text-align: center; /* To center it horizontally (if you want) */
	line-height: 20px; /* To center it vertically */
	border-radius: 5px;
}

.smallD {
	width: 80%;
	margin: 20px;
	float: left;
	box-shadow: 1px 2px 3px 1px #d5d7db;
	padding: 0 10px;
	border-radius: 20px;
}
.insertBtn{
	text-align: right;
	margin-bottom: 15px;
	border-radius: 3px;
}
#createPrt:hover{
	color : gray;
}

.popOuterBox_refuse{
 display:flex; 
  flex-direction : column; 
  flex-wrap: wrap; 
  align-content: flex-end; 
  position:absolute;  
  top:28%;    
  left:35%;  
  width:800px;  
  height:600px;
  margin:-125px 0 0 -200px;
}
.popInnerBox_refuse{
	display:flex;
  justify-content:space-between;
  flex-direction:column;
  position:absolute;
  top:28%;  
  left:35%;
  width:800px;
  height:600px;
  margin:-125px 0 0 -200px;
  text-align:center;
  background:#fff;
  border-radius:12px; 
}
.goProject:hover{
	cursor: pointer;
	text-shadow: 1px 1px 1px gray;
}
.prtReport{
	background-color: #f17f93;
	border-color : #f17f93;
	color: white;
	margin-bottom: 15px;
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

	<div id = "searchPar">
	
		<div id = "proceeding" >
			<select name = "checkDate" id = "dateSearch">
				<option value="whole">??????</option>
				<option value="proceeding">?????????</option>
				<option value="end">??????</option>
			</select>
		</div>
	
		<div id="searchUI" class="row">
			<div>
				<div class="searchUIInput">
					<select name = "searchType" id = "searchType">
						<option value>????????????</option>
						<option value="prtTitle">???????????? ??????</option>
						<option value="name">????????????</option>
						<option value="ornt">?????????</option>
					</select> 
					<input type="text" name = "searchWord" id = "searchWord" />
				</div> 
				<div class="searchUIBtn">
					<input type="button" id="searchBtn" class="btnTags btn searchBtn" value = "??????" style="width: 60px; height : 37px;"/>
					<input type = "button" value ="???????????? ??????" id = "createPrt" class = "insertBtn" style="width: 105px; height : 37px; font-size: 16px">
				</div>
			</div>
		</div>
	</div>

	<div id = "proejctDiv">
	</div>
	
	<div id = "pagingArea">
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
      	<h1 style = "text-align: center; font-family: sans-serif;">???????????? ?????? ?????????</h1>
      <hr>
      <div id = "reportSelete">
		<span id = "prtInfoReport" class = "selectReport">???????????? ??????</span>      	
		<span id = "workReport" class = "noneSelect">?????? ??????</span>      	
		<span id = "ganttReport" class = "noneSelect">????????????</span>      	
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
	
	
	<!-- ????????????... -->
	
	
<!-- ???????????? ??????????????? ?????? modal -->
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

<!-- <!-- ?????? ????????? ???????????? ?????? ?????? --> -->
<!-- 	<div id="popUp_refuse" class="popCmmn"> -->
<!-- 	  <div class="popBg" data-num="11"></div>  -->
<!-- 		<div class="popOuterBox_refuse">          -->
<!-- 		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >???</button> -->
<!-- 		  <div class="popInnerBox_refuse">   -->
<!-- 		    <div class="popHead">?????? ??????</div>   -->
<!-- 		    <div class="popBody">   -->
<!-- 		    <input type = "hidden" id = "hiddenMemId" name = "memId"> -->
<!-- 		    	<h5 style="text-align: center;">??????????????? ??????????????? ???????????????</h5> -->
<!-- 		    	<div> -->
<!-- 		    		<span>?????????</span><br>  -->
<!-- 		    		<input type = "text" name = "memEmail"  class="holderInput" id = "hiddenMemEmail" readonly> -->
<!-- 		    	</div> -->
<!-- 		    	<div> -->
<!-- 		    		<sapn>??????</sapn><br> -->
<!-- 		    		<textarea rows="10" cols="30" class="holderArea" name = "content"></textarea> -->
<!-- 		    	</div> -->
<!-- 		    	<input id="inputPass" type="password" name="memberPass" class="holderInput inputPass" placeholder="???????????? ??????" required> -->
<!-- 		    	<div><input class="showPass" type="checkbox" >???????????? ??????</div> -->
<!-- 		    </div>    -->
<!-- 		    <div class="popFoot">     -->
<!-- 		      <input type = "submit"  class="checkBtn btn btbtn" value = "??????">     -->
<!-- 		    </div>   -->
<!-- 		  </div>      -->
<!-- 	  </div> -->
<!-- 	</div>   -->
	
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
	})

	$("#proejctDiv").on('click','.goProject' ,function(){ 
		let pCode = $(this).data("prjctno");
		let prjctNm = $(this).html(); 
		var popupWidth = 1400;             
		var popupHeight = 950;                 
		var popupX = (window.screen.width / 2) - (popupWidth / 2); 
		// ?????? ????????? width ????????? 1/2 ?????? ??????????????? ????????????    
		var popupY= (window.screen.height / 2) - (popupHeight / 2) - 50;  
		// ?????? ????????? height ????????? 1/2 ?????? ??????????????? ????????????       
		var popup = window.open("${cPath}/project/"+pCode + "/main", prjctNm + " ????????????", 'toolbar=yes,scrollbars=yes, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY );
 	}); 
	
	$('#dateSearch').on('change',function(){
		let dateValue = $(this).val();
		$('#searchType').val("");
		$('#searchWord').val("");
		$('#page').val("");
		$('#searchFormDate').val(dateValue);
		
		searchForm.submit();
		
		
	})
	
	$('#createPrt').on('click',function(){
		location.href = "${cPath}/admin/project/create";
	})
	
	let proejctDiv = $('#proejctDiv');
	let pagingArea = $('#pagingArea');
	
//????????? ???????????????
	let searchForm = $('#searchForm').paging().ajaxForm({
		dataType : 'json',
		success : function(res){
			proejctDiv.empty();
			pagingArea.empty();
			
			let dataList = res.dataList;
			
			let divs = "<div id = 'proejctList'>";
			
			if(dataList.length != 0){
				$(dataList).each(function(idx,li){
				
					let prtNm = null;
					
					let now = new Date();
					let endDay = new Date(li.prjctEndde);
					
					if(li.prjctNm.length > 10){
						prtNm = li.prjctNm.substring(0,10) + "...";
					}else{
						prtNm = li.prjctNm
					}
					divs += "<div class='smallD'>";
					divs += "<hr>";
					divs += "<h5 class='goProject prjctNm'  data-prjctno='" + li.prjctNo  +"' title= '" + li.prjctNm + "'>" + prtNm + "</h5>";
					divs += "<hr>";
					divs += "<p>???????????? : " + li.prjctBeginde +"</p>";
					divs += "<p>???????????? : " + li.prjctEndde + "</p>";
					divs += "<br>";
					divs += "<div class='myProgress'>"
					divs += "<div data-begin='" + li.prjctBeginde +"'";
					divs += "data-end='" + li.prjctEndde +"' class='progressbar'>0%</div>";
					divs += "</div> <hr>"
					if((endDay - now) < 0){
						divs += "<input type = 'button' value = '???????????????' class = 'prtReport' data-id = '" + li.prjctNo +"''/>"; 
					}else{
						divs += "<input type = 'button' value = '????????????' class = 'detailPrt insertBtn' data-id = '" + li.prjctNo +"''/>"; 
					}
					divs += "</div>";
				})
				
			}else{
				divs += "<h3>?????? ????????? ??????????????? ????????????</h4>";
				
			}
				divs += "</div>"
			proejctDiv.html(divs);
			pagingArea.html(res.pagingHTMLBS);

			
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
	
	let reportBody = $('.report_body');
	let prtReportModal = $('#prtReportModal');
	let prtIdReport = $('#prtIdReport');
	let selectReport = null;
	
	// ?????? ????????? ???????????? ?????? ??????
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
	
	// ???????????? ??????
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
	
	// ????????????
	$('#workReport').on('click',function(){
		
		let prtId = prtIdReport.val();
		$.ajax({
			url : "${cPath}/projectRep/work/"+prtId,
			dataType : "html",
			success : function(resp) {
				reportBody.empty();
				reportBody.html(resp);
				selectReport.attr('class', 'noneSelect');
				selectReport = $('#workReport');
				selectReport.attr('class','selectReport');
				
			},
			error : function(errorResp) {

			}

		});
			
	})
	
	// ???????????? ??????
	$('#ganttReport').on('click',function(){
		
		ganttHtmlAjax();  
		selectReport.attr('class', 'noneSelect');
		selectReport = $('#ganttReport');
		selectReport.attr('class','selectReport');

	})
	
	
	
//????????????	
	
	$('#proejctDiv').on('click','.detailPrt',function(){
		
		
		
		let prtId = $(this).data('id');
		let url = "${cPath}/admin/project/detail/" + prtId;
		$.ajax({
			url : url,
			dataType : "html",
			success : function(resp) {
				$('.modal-body').empty();
				$('.modal-body').append(resp);
				$('#staticBackdrop').modal('show');
			},
			error : function(errorResp) {

			}

		});
		
	})
	
	$('#closeModal').on('click',function(){
		$('#staticBackdrop').modal('hide');
	})
	
	
	
	
	/* $('#proejctDiv').on('click','.deletePrt',function(){
		let prtId = $(this).data('id');
		let url = "${cPath}/admin/project/delete/" + prtId;
		
		  Swal.fire({
			  title: '??????????????? ?????????????????????????',
			  text : '????????? ?????????????????? ????????? ?????? ???????????? ?????? ?????? ?????????',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '??????'
			}).then((result) => {
			  if (result.isConfirmed) {
				   $.ajax({
						url : url,
						dataType : "json",
						success : function(resp) {
							console.log(resp)
							if(resp == 'OK'){
								Swal.fire({
    									title: '????????????',
    						    		icon: 'success'
								}).then(function(){
    								location.href = "${cPath}/admin/project/list";								
								});
							}else if(resp == 'FAIL'){
								Swal.fire({
    									title: '?????? ??????',
    						    		icon: 'error'
								});
							}
				    			  
						},
						error : function(errorResp) {

						}

					}); 
			  }
			})
		
		
	})
	

 */

		
	
 var today = new Date(),
	day = 1000 * 60 * 60 * 24,
// 	// Utility functions
	dateFormat = null,
	defined = null, 
	isObject = null;
 
	//?????? ?????? ??????
	var now = new Date();  
	var nowdate = getFormatDate(now);
	var oneMonthAgo = new Date(now.setMonth(today.getMonth() - 1)); 
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
	//???????????? ?????? ????????? ???????????? ?????? 
	function ganttAjax(data){
		var prtId = prtIdReport.val(); 
		
		
		
		$.ajax({  
			url : "${cPath}/projectRep/gantt/find/"+ prtId,
			dataType : "json", 
// 			data : $("#searchUI").serialize(),
			data : data,
			success : function(datas) {
				$(".x_title").find("small").html("<strong>"+ datas.length +"</strong>?????? ??????");
				
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
							      title: '????????????',  
							      value: dateFormat(format, point.start)
							    }, {
							      visible: !options.milestone,
							      title: '????????????',
							      value: dateFormat(format, point.end) 
							    }, {
							      title: '?????????',
							      value: status
							    }, {
							      title: '?????????',
							      value: options.owner || 'unassigned'
							    }, {
							      title: '??????',
							      value: point.sttus
							    }, {
							      title: '????????????',
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
								  week : "%W???"
							  },  
							  min: minde,     
							  max: maxde 
							} 
						 
				}); 
//	 			chart.xAxis[0].update({
//	 				  min:today - 10 * day,     
//	 			});   
			},
			error : function(errorResp) { 
		 
			}
		}); 
		
	} //ganttAjax()???

	
	  
	//???????????? ????????? ?????? ????????????  ??????
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
				$(startDate).val(getFormatDate(oneMonthAgo));        
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
		
	} //ganttAjax()???

	 
		$("#container").on("click", ".highcharts-series > .highcharts-point", function(event){
			let workCode = event.originalEvent.point.id;  
			location.href = "${cPath}/project/${pCode}/workDetail/" + workCode;
		}); 

		
</script>
