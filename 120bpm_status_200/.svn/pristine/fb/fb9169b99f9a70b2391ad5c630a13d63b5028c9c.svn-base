<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<link href="${cPath}/resources/billboard.js/billboard.css" rel="stylesheet"> 
<script src="${cPath }/resources/billboard.js/billboard.pkgd.js"></script>
<%-- ${pCode } --%> 
                 
<link href="${cPath}/resources/css/projectMain.css" rel="stylesheet"> 
<security:authentication property="principal.adaptee" var="authMember"/> 
<div id = "topPar" class="mb-3">
	<div class="col-md-11 mt-1 mb-2 ml-3 progressDiv"> 
		<div id = "stateColorArea">
			<div>
				<div class = "stateColor normal"></div>
				<span class = "colorText">정상</span>
			</div>
			<div>
				<div class = "stateColor warnning"></div>
				<span class = "colorText">경고</span>
			</div>
			<div>
				<div class = "stateColor danger"></div>
				<span class = "colorText">위험</span>
			</div>
			
		</div>
		<h2 id="perText"></h2> 
		<span class="beginde ml-2"> 
		${prjct.prjctBeginde }  
		</span> 
		<div class="progress">    
			<div id = "proWorkAvg" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
		</div>  
		<span class="endde">  
		${prjct.prjctEndde }  
		</span>  
	</div> 
	
	<div>
		<img id = "milestoneImg" src="${cPath}/resources/imgs/temp/milestone.png" data-bs-toggle="tooltip" data-bs-placement="bottom">
	</div>
 </div>
<div id="cont1" class="x_panel outline mr-3 col-md-6">   
	<div class="x_title" data-no="6">     
		<h2 >프로젝트 개요</h2>   
		<ul class="nav navbar-right panel_toolbox">
 			<li><a class="closeLink"><i class="fa fa-close"></i></a></li>
 		</ul>
		<div class="clearfix"></div>  
	</div> 
	<div id="outlineDiv" class="x_content" style="display: block;">
		<table id="olTable"> 
			<tr>     
				<th>프로젝트명</th><td id="prjctNm" title="${prjct.prjctNm }" ><div class="scroll">${prjct.prjctNm }</div></td>
			</tr> 
			<tr>    
				<th>개요</th><td id="sumry"><div class="scroll" id="sumryD"></div></td>
			</tr> 
			<tr>
				<th>시작일자</th><td>${prjct.prjctBeginde }</td>
			</tr>
			<tr>
				<th>종료일자</th><td>${prjct.prjctEndde }</td>
			</tr> 
			<tr> 
				<th>발주처명</th><td>${prjct.prjctOrnt }</td>
			</tr>
			<tr>
				<th>사업규모</th><td>${prjct.bsnssclae } 원</td>
			</tr>
			<tr>
				<th>투입인원</th><td>${prjct.memNumber } 명</td>
			</tr>
		</table> 
	</div>
</div> 
<div id="cont2" class="x_panel workStatus col-md-6 "  >  
	<div class="x_title"  data-no="7">   
		<h2>일감 추적</h2>
		<ul class="nav navbar-right panel_toolbox">
			<li><a >더보기</a></li> <!-- 일감리스트 -->
 			<li><a class="closeLink"><i class="fa fa-close"></i></a></li>
 		</ul>  
		<div class="clearfix"></div>
	</div>    
	<div class="x_content" style="display: block;"> 
		<div class="float-right"> 
		<span>카테고리 </span><select id="selectCtgry">
			<option value> 전체 </option>
			<c:if test="${not empty ctgryList }">
				<c:forEach items="${ctgryList }" var="ctgry"> 
				<option value="${ctgry.ctgryCode }">${ctgry.ctgryNm }</option>
				</c:forEach>  
			</c:if> 
		</select> 
		</div>
		<br><br>
		<div id="gaugeChart"></div> 
	</div>          
</div>  
<div id="cont3" class="x_panel mems mr-3 col-md-6" >  
	<div class="x_title"  data-no="8">    
		<h2>프로젝트 구성원 </h2>  
		<ul class="nav navbar-right panel_toolbox">
 			<li><a class="closeLink"><i class="fa fa-close"></i></a></li>
 		</ul>
		<div class="clearfix"></div>
	</div>    
	<div class="x_content" style="display: block;"> 
		<div id="tableDiv">
		<c:if test="${not empty memList }">
			<c:forEach items="${memList }" var="mem">
				<table>  
						<tr>
							<td rowspan="2"> 
								<div id="proflDiv"> 
								<img src="${cPath }/resources/imgs/member/${mem.proflImgNm}">
								</div>
							</td>
							<th class="pointer pl-3"><a href="${cPath}/project/${pCode}/user/${mem.memId}">${mem.memName }</a> </th>
							<th class="authorNm ">${mem.authorNm }</th>
							<c:choose>   
							<c:when test=" ${authMember.memId eq mem.memId}">   
								<td class="mailTd">✉ ${authMember.memEmail}</td>    
							</c:when>    
							<c:otherwise>   
								<td class="mailTd">✉ ${mem.memEmail}</td> 
							</c:otherwise>
							</c:choose>
						</tr>   
				</table>
			</c:forEach>   
		</c:if> 
		</div> 
	</div>     
</div>
    
<div id="cont4" class="x_panel col-md-6 custom d-flex" >   
	<img class="customBtn pointer" alt="추가" src="${cPath }/resources/imgs/img/plusbutton.png">
</div>   
  
<script>



var class1 = $("#cont1").attr("class"); 
var class2 = $("#cont2").attr("class");
var class3 = $("#cont3").attr("class");
var class4 = $("#cont4").attr("class");
var content1 = $("#cont1").children().clone(); 
var content2 = $("#cont2").children().clone();
var content3 = $("#cont3").children().clone(); 
var content4 = $("#cont4").children().clone(); 

$(function() {     

		var sumry = "${prjct.sumry }";
		sumry = sumry.replaceAll("<p>", "").replaceAll("</p>", "").replaceAll("&#39;", "'");
		$("#sumry").attr("title", sumry);    
		$("#sumryD").html(sumry);        
 		   
	 	//프로젝트 진행 바
		var pgbar = $(".progress-bar");
		var perText = $("#perText"); 
		var width = 0;  
		beginDate = new Date($(".beginde").text());
		endDate = new Date($(".endde").text());
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
					$(perText).text(width + "%");
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
					$(perText).text(width + "%"); 
				}
			} 
		}
		// 마일스톤 진행상황
		let workAvg = ${workAvg};
		let tooltipMsg;
		let proWorkAvg = $('#proWorkAvg');
		
		if(percent <= 30){
			tooltipMsg = "프로젝트 초반입니다. 일정에 맞게 업무를 진행하여 주세요";
			proWorkAvg.attr('class','progress-bar progress-bar-striped progress-bar-animated');
		}else if(percent <= 60){
			if(workAvg < (percent-10)){
				tooltipMsg = "일정에 비해 진척도가 낮습니다. 속도를 올려주세요";
				proWorkAvg.attr('class','progress-bar progress-bar-striped bg-warning progress-bar-animated');
			}else{
				tooltipMsg = "알맞은 속도로 진행되고 있습니다.";
				proWorkAvg.attr('class','progress-bar progress-bar-striped progress-bar-animated');
			}
			
		}else if(percent <100){
			if(workAvg < (percent-15)){
				tooltipMsg = "일정에 비해 진척도가 매우 낮습니다. 서둘러 주세요";
				proWorkAvg.attr('class','progress-bar progress-bar-striped bg-danger progress-bar-animated');
			}else if(workAvg < (percent-5)){
				tooltipMsg = "일정에 비해 진척도가 낮습니다. 속도를 올려주세요";
				proWorkAvg.attr('class','progress-bar progress-bar-striped bg-warning progress-bar-animated');
			}else{
				tooltipMsg = "알맞은 속도로 진행되고 있습니다.";
				proWorkAvg.attr('class','progress-bar progress-bar-striped progress-bar-animated');
			}
		}else{
			tooltipMsg = "프로젝트가 완료되었습니다";
			proWorkAvg.attr('class','progress-bar progress-bar-striped progress-bar-animated');
		}
		$('#milestoneImg').attr('title', tooltipMsg);
		 
		//일감추적
		ajaxWorkTracking($("#selectCtgry").val());	
	 
		// 커스텀버튼클릭 
		var rot = 45;     
		$("body").on("click", ".customBtn",function(){  
			let panel = $(this).parent();
		  	if($(panel).children(".customList").css("display")!="none"){
			  	rot -= 45;            
		  	}       
		  	$(this).css("transform","rotate("+rot+"deg)");  
			console.log(panel);   
			$(panel).find(".customList").fadeToggle(300);     
			let customs = $(".x_panel");   
			$.each(customs, function(i, custom){  
				let no = getmenuno($(custom).attr("id"));  
				if(no==null){       
					 no = $(custom).find(".x_title").data("no"); 
				}     
				let lis = $(panel).find(".customList").find("li");
				
				console.log($(lis));
					
				$.each(lis, function(i, li){   
					if($(li).data("no")==no){   
						$(li).hide();       
					}   
				});     
			});
			rot = 45;   
		});  
		      
		//섹터 closeLink 클릭하면 커스터마이징할수있게 바꾸기
		$("body").on("click", ".closeLink", function(e){
		  	let selectMenu = $("<ul class='customList pointer'>").append( 
		  			$("<li data-no='1'>").html("내 일감"),
		  			$("<li data-no='2'>").html("즐겨찾는 일감"), 
		  			$("<li data-no='3'>").html("최근 뉴스"), 
		  			$("<li data-no='4'>").html("최근 이슈"),
// 		  			$("<li data-no='5'>").html("위키"), 
		  			$("<li data-no='6'>").html("개요"), 
		  			$("<li data-no='7'>").html("일감추적"), 
		  			$("<li data-no='8'>").html("구성원")  
		  			).css("display","none");     
			let panel = $(this).parents(".x_panel");
			setCustomTag($(panel).attr("id"),panel); 
			removecont($(panel).attr("id"), panel);      
			let no = $(panel).find(".x_title").data("no");
			console.log(panel);
			$(panel).addClass("custom d-flex");  
			$(panel).empty();    
			$(panel).append($("<img class='customBtn pointer' alt='추가' src='${cPath }/resources/imgs/img/plusbutton.png'>"));
			$(panel).append(selectMenu);            
			let customs = $(".x_panel");   
			$.each(customs, function(i, custom){  
				let lis = $(custom).find(".customList").find("li");
				$.each(lis, function(i, li){  
					if($(li).data("no")==no){ 
						$(li).show(); 
					}       
				});
			});
		});      
		
		
		var customs = $(".x_panel");   
		$.each(customs, function(i, custom){  
		  	let selectMenu = $("<ul class='customList pointer'>").append( 
		  			$("<li data-no='1'>").html("내 일감"),
		  			$("<li data-no='2'>").html("즐겨찾는 일감"), 
		  			$("<li data-no='3'>").html("최근 뉴스"),
		  			$("<li data-no='4'>").html("최근 이슈"),
// 		  			$("<li data-no='5'>").html("위키"), 
		  			$("<li data-no='6'>").html("개요"), 
		  			$("<li data-no='7'>").html("일감추적"), 
		  			$("<li data-no='8'>").html("구성원") 
		  			).css("display","none");      
// 			removecont($(custom).attr("id"), custom);   
			getcont($(this).attr("id"), this); 
			let res = getCustomTag($(this).attr("id"));
			if(res==1){ 
				$(this).empty(); 
				$(this).addClass("custom d-flex");
				$(this).append($("<img class='customBtn pointer' alt='추가' src='${cPath }/resources/imgs/img/plusbutton.png'>"));  
				console.log(res);  
			}        
			$(this).append(selectMenu);    
		});//저장한 menuno꺼내기    
		$("body").on("click",".customList li", function(){
			let menuno =$(this).data("no");  
			let customs = $(".x_panel");   
			$.each(customs, function(i, custom){  
				let lis = $(custom).find(".customList").find("li");
				$.each(lis, function(i, li){ 
					if($(li).data("no")==menuno){    
						$(li).hide();  
					}  
				});   
			});
			let parentPanel = $(this).parents(".x_panel");
			removeCustomTag($(parentPanel).attr("id")); 
			let cont = $(parentPanel).attr("id"); 
			if(menuno == 1){ 
				savecont(1, cont);   
				ajaxCustomWork(parentPanel);   //내 일감
			}else if(menuno==2){
				savecont(2,cont);
				ajaxCustomWorkBkmk(parentPanel); //즐겨찾기 일감
			}else if(menuno==3){
				savecont(3, cont);
				ajaxCustomCurNews(parentPanel);  //최근 뉴스
			}else if(menuno==4){
				savecont(4, cont);      
				//최근 이슈
			}else if(menuno==5){  
				savecont(5, cont);
				ajaxCustomCurWiki(parentPanel); //위키
			}else if(menuno==6){
				savecont(6, cont);
				$(parentPanel).empty();   
				$(parentPanel).append(content1);  
				$(parentPanel).removeClass("custom d-flex").addClass(class1);  
				var sumry = "${prjct.sumry }";
				sumry = sumry.replaceAll("<p>", "").replaceAll("</p>", "").replaceAll("&#39;", "'");
				$("#sumry").attr("title", sumry);   
				$("#sumryD").html(sumry);    
			}else if(menuno==7){
				savecont(7, cont);
				$(parentPanel).empty();   
				$(parentPanel).append(content2);  
				$(parentPanel).removeClass("custom d-flex").addClass(class2);  
			}else if(menuno==8){ 
				savecont(8, cont); 
				$(parentPanel).empty();    
				$(parentPanel).append(content3);  
				$(parentPanel).removeClass("custom d-flex").addClass(class3);  
				
			}else{ 
				return false; 
			}
		}); 
});
	
	// 위키
	function ajaxCustomCurWiki(parentPanel){
		$.ajax({
			url : "${cPath}/project/${pCode}/main/customCurWiki",
			dataType : "json",
			success : function(wiki) {
				$(parentPanel).empty();    
				let x_title = $("<div class='x_title'  data-no='5'>").append( 
						$("<h2>").html("위키"),  
						$("<ul class='nav navbar-right panel_toolbox'>").append( 
								$("<li>").html($("<a>").html("더보기")),  
								$("<li>").html($("<a class='closeLink'>").html($("<i class='fa fa-close'>")))),
						$("<div class='clearfix'>"));  
				let x_content = $("<div class='x_content'>").css("display", "row").css("background", "#fafafa");
				let feed = $("<div class='feed mt-2 ml-1 mb-2'>").append(  
						$("<h6>").append($("<strong>").html(wiki.memName), $("<small>").html("님이 작성함")),
						$("<h2>").html(wiki.boSj), $("<p>").html(wiki.boCn),
						$("<span>").html(wiki.boRgsde + " 작성")   
					);       
  
				$(parentPanel).append(x_title, x_content);      
				$(parentPanel).find(".x_content").append(feed);   
				$(parentPanel).removeClass("custom d-flex");  
			},
			error : function(errorResp) {

			}
		});
	}
	
	// 최근 뉴스 피드
	function ajaxCustomCurNews(parentPanel){
		$.ajax({
			url : "${cPath}/project/${pCode}/main/customCurNews",
			dataType : "json",
			success : function(news) {
				$(parentPanel).empty();   
				let x_title = $("<div class='x_title' data-no='3'>").append( 
						$("<h2 >").html("최근 뉴스"),  
						$("<ul class='nav navbar-right panel_toolbox'>").append( 
								$("<li>").html($("<a href='${cPath}/project/${pCode}/news/list'>").html("더보기")), 
								$("<li>").html($("<a class='closeLink'>").html($("<i class='fa fa-close'>")))),
						$("<div class='clearfix'>"));  
				let x_content = $("<div class='x_content'>").css("display", "row").css("background", "#fafafa");
				let leftFeed = $("<div class='float-left feed col-md-12 mt-2'>").append( 
						$("<h6>").append($("<strong>").html(news.memName), $("<small>").html("님이 작성함")),
						$("<h2>").html(news.boSj), $("<p>").html(news.boCn),
						$("<span>").html(news.boRgsde + " 작성")  
					);        
// 				let rightFeed = $("<div class='float-right feed col-md-5 mt-2'>").append($("<img>").attr({"src":"", "alt":"이미지"}));
				 

				$(parentPanel).append(x_title, x_content);      
				$(parentPanel).find(".x_content").append(leftFeed);   
				$(parentPanel).removeClass("custom d-flex");  
			},
			error : function(errorResp) {

			}
		});
	}

	//즐겨찾는 일감 테이블 
	function ajaxCustomWorkBkmk(parentPanel){
		$.ajax({
			url : "${cPath}/project/${pCode}/main/customWorkBkmk",
			dataType : "json",      
			success : function(bkmkList) {
				$(parentPanel).empty();   
				let x_title = $("<div class='x_title' data-no='2'>").append( 
						$("<h2 >").html("즐겨찾기 일감"),  
						$("<ul class='nav navbar-right panel_toolbox'>").append( 
								$("<li>").html($("<a>").html("더보기")), 
								$("<li>").html($("<a class='closeLink'>").html($("<i class='fa fa-close'>")))),
						$("<div class='clearfix'>"));  
				let x_content = $("<div class='x_content'>").css("display", "block");
				let ths = $("<tr>").append($("<th>").html("카테<br>고리"),	
						$("<th colspan='2'>").html("일감제목"), $("<th>").html("담당자"), 
						$("<th>").html("진척도") ); 
				let bkmkTable = $("<table id='bkmkTable' class='table mt-3'>").append($("<thead>").html(ths),$("<tbody>"));
				
				$(parentPanel).append(x_title, x_content);     
				$(parentPanel).find(".x_content").html(bkmkTable);   
				//다시 customBtn나오게할때는 addClass해주기
				$(parentPanel).removeClass("custom d-flex"); 
				if(bkmkList.length > 0){
					for(index in bkmkList){      
						bkmk = bkmkList[index]; 
						console.log(index);    
						$("#bkmkTable tbody").append(makeBkmkTr(bkmk)); 
					}      
				}else{       
					$("#bkmkTable tbody").html($("<tr>").append($("<td colspan='4' class='text-center'>").html("즐겨찾기 일감이 없습니다."))); 
				}
			},  
			error : function(errorResp) {

			}
		});
	}
	//즐겨찾기일감테이블 tr만들기
	function makeBkmkTr(bkmk){    
		return $("<tr class='"+bkmk.workPriortCode+"'>").append(      
			$("<td class='ellipsis text-center'>").attr("title", bkmk.ctgryNm).html(bkmk.ctgryNm),		   
			$("<td colspan='2' class='ellipsis' data-code='"+bkmk.workCode+"'>").attr("title", bkmk.workSj).html(bkmk.workSj),		
			$("<td class='text-center'>").html(bkmk.memName),		   
			$("<td class='text-center'>").html(bkmk.workPrgsDgreePoint)		   
		); 
	}
	
	//내 일감 테이블 
	function ajaxCustomWork(parentPanel){
		$.ajax({   
			url : "${cPath}/project/${pCode}/main/customWork",
			dataType : "json",       
			success : function(workList) { 
				$(parentPanel).empty();   
				let x_title = $("<div class='x_title' data-no='1'>").append( 
									$("<h2 >").html("내 일감"),  
									$("<ul class='nav navbar-right panel_toolbox'>").append(  
											$("<li>").html($("<a>").html("더보기")), 
											$("<li>").html($("<a class='closeLink'>").html($("<i class='fa fa-close'>")))),
									$("<div class='clearfix'>"));  
				let x_content = $("<div class='x_content'>").css("display", "block");
				let ths = $("<tr>").append($("<th>").html("카테<br>고리"),
									$("<th colspan='2'>").html("일감제목"),$("<th>").html("우선<br>순위"), 
// 									$("<th>").html("종료<br>일자"),
									$("<th>").html("진척도") );
				let workTable = $("<table id='workTable' class='table mt-3'>").append($("<thead>").html(ths),$("<tbody>"));
				   
				$(parentPanel).append(x_title, x_content);    
				$(parentPanel).find(".x_content").html(workTable); 
				//다시 customBtn나오게할때는 addClass해주기
				$(parentPanel).removeClass("custom d-flex"); 
				if(workList.length > 0){
					for(index in workList){       
						work = workList[index];  
						console.log(index);    
						$("#workTable tbody").append(makeWorkTr(work));  
					}     
				}else{       
					$("#workTable tbody").html($("<tr>").append($("<td colspan='4' class='text-center'>").html("내 일감이 없습니다."))); 
				}
				  
			},       
			error : function(errorResp) {

			}
		});
	}
	
	//내일감테이블 tr만들기
	function makeWorkTr(work){   
		return $("<tr class='"+work.workPriortCode+"'>").append(    
			$("<td class='ellipsis text-center'>").attr("title", work.ctgryNm).html(work.ctgryNm),	  	
			$("<td colspan='2' class='ellipsis' data-code='"+work.workCode+"'>").attr("title", work.workSj).html(work.workSj),		
			$("<td class='text-center'>").html(work.priortNm),		  
// 			$("<td class='text-center'>").html(work.workEndde),		   
			$("<td class='text-center'>").html(work.workPrgsDgreePoint)		   
		);
	}
			 
	//일감추적그래프 
	function ajaxWorkTracking(ctgryCode){  
			var ctgryText = $("#selectCtgry").find("option:selected").text();
			if(ctgryText.length > 5){
				ctgryText = ctgryText.substring(0 , 4) + "...";
			}
			$.ajax({  
			url : "${cPath}/project/${pCode}/main?ctgryCode=" + ctgryCode,
			dataType : "json",  
			success : function(work) { 
				var newCount = work.newcount; 
				var ingCount = work.ingcount;
				var doneCount = work.donecount;
				var allCount = newCount + ingCount + doneCount;
			  	var max = 0; 
			  	var mid = 0;
			  	var min = 0;
				if (newCount >= ingCount && newCount >= doneCount) {
		            max = newCount;
		            if(ingCount >= doneCount){
		            	mid = ingCount;
		            	min = doneCount; 
		            }else{ 
		            	mid = doneCount;
		            	min = ingCount;
		            }
		        } else if (ingCount >= newCount && ingCount >= doneCount) {
		            max = ingCount;
		            if(newCount >= doneCount){
		            	mid = newCount;
		            	min = doneCount;
		            }else{ 
		            	mid = doneCount;
		            	min = newCount;
		            }
		        } else {
		            max = doneCount;
		            if(ingCount >= newCount){
		            	mid = ingCount;
		            	min = newCount;
		            }else{ 
		            	mid = newCount;
		            	min = ingCount;
		            }
		        } 
				var chart = bb.generate({ 
					  data: {
					    columns: [     
					    	["신규", newCount]
					    ],     
					    type: "gauge"
					  },  
					  gauge: {
						  min: 0,     
						  max: allCount,   
						  type: "single",   //'single' or 'multi' 
			 			 title:  ctgryText,     
					  },           
					  color: {  
					    pattern: ["#faac37","#7aff45","#37c0fa", "#ab7ef7"],  
					    threshold: {        
					    	values: [min, mid, max, allCount] 
					    }           
					  },      
					  size: {             
					    height: 200,    
					    width : 320   
					  },         
					  bindto: "#gaugeChart"      
					});        
					setTimeout(function() {        
						chart.load({                  
							columns: [["신규",newCount], ["진행", ingCount], ["완료", doneCount]]
						});   
					}, 100);	 
					
			},
			error : function(errorResp) {
			}
		});
	}
	
	$("body").on("change","#selectCtgry", function(){
		ajaxWorkTracking($(this).val());    
	});  
	
function removecont(cont){ 
	localStorage.removeItem('${authMember.memId}'+ cont);	
}
  
function savecont(menuno, cont) {
	localStorage.setItem('${authMember.memId}'+ cont, JSON.stringify(menuno)); 
} 
 
function getcont(cont, parentPanel){ 
	  if(localStorage.getItem("${authMember.memId}"+ cont)!==null){ 
	     let menuno = JSON.parse(localStorage.getItem("${authMember.memId}"+cont));
	     if(menuno == 1){ 
				ajaxCustomWork(parentPanel);   //내 일감
			}else if(menuno==2){
				ajaxCustomWorkBkmk(parentPanel); //즐겨찾기 일감
			}else if(menuno==3){
				ajaxCustomCurNews(parentPanel);  //최근 뉴스
			}else if(menuno==4){ 
			}else if(menuno==5){  
				ajaxCustomCurWiki(parentPanel); //위키 
			}else if(menuno==6){
				$(parentPanel).empty();   
				$(parentPanel).append(content1);  
				$(parentPanel).removeClass("custom d-flex").addClass(class1);  
				var sumry = "${prjct.sumry }";
				sumry = sumry.replaceAll("<p>", "").replaceAll("</p>", "").replaceAll("&#39;", "'"); 
				$("#sumry").attr("title", sumry);   
				$("#sumryD").html(sumry);    
			}else if(menuno==7){
				$(parentPanel).empty();    
				$(parentPanel).append(content2); 
				$(parentPanel).removeClass("custom d-flex").addClass(class2);  
			}else if(menuno==8){
				$(parentPanel).empty();   
				$(parentPanel).append(content3);   
				$(parentPanel).removeClass("custom d-flex").addClass(class3);  
			}else{ 
				return false; 
			} 
	  }else{
		  return false;
	  }
}

function setCustomTag(cont,panel){
	localStorage.setItem('${authMember.memId}'+ cont + "custom", panel); 
}
function getCustomTag(cont){
	 if(localStorage.getItem('${authMember.memId}'+ cont + "custom")!==null){  
	     return 1; 
	 }else{       
		 return 0; 
	 } 
}
function removeCustomTag(cont){ 
	localStorage.removeItem('${authMember.memId}'+ cont + "custom");	
}
function getmenuno(cont){
	 if(localStorage.getItem("${authMember.memId}"+ cont)!==null){ 
	     return JSON.parse(localStorage.getItem("${authMember.memId}"+cont));
	 }else{  
		 return null;
	 }
}
</script>