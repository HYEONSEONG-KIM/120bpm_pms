<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script> 
<style>
.bigD {
	width: 100%;
	background: white;
	display: none;
	/* 	margin: 2%; */
	float: left;
}

.smallD {
	width: 42%;    
	margin: 12px 25px 8px;
	float: left; 
	box-shadow: 1px 2px 3px 2px #d5d7db;
	padding: 0 10px; 
	border-radius: 20px;
}

.myProgress {   
	width: 95%; 
	margin: 10px 0;
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

.noData {
	color: gray;
	margin: 50px 20px;
}

p {
	margin: 0;
	font-size: 1.2em;
} 

.minitable {
	border-collapse: collapse;
	width: 100%;
	font-size: 1.2em;
}

.goProject {
	cursor: pointer;
	font-weight: bold;
	height: 30px;
} 

.newMark {
	width: 25px; 
	height: 25px;
	position : absolute;
	right : 107%;
	line-height: 23px; 
	border-radius: 50%;
	background: #42B4E6;
	color: #fff;
	text-align: center;
	font-weight: bold;
}

.noticeUi {
	padding: 0;
}

.noticeUi li {
	position: relative;
	list-style: none;
	border-bottom: 1px dashed lightgrey;
}

.ellipsis {
	display: block;
	overflow: hidden;
	position: relative;
	color: #2c2c2c;
	text-overflow: ellipsis;
	white-space: nowrap;
}

b, strong {
	font-size: 17px;
}
 
.noticeUi a {
	display: block;
	width: 100%;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-right: 23%; 
	cursor: pointer;
}
   
.noticeUi a > em {
	display: block;
	position: absolute;
	right: 0; 
	top: 15px;
	font-size: 17px;
	color: #818181;
}

.toast { 
	position: absolute;
	top: 5px;
	left: 25%;
	max-width: 700px;
	width: 600px;
	color: white;
	background-color: #42B4E6;
	z-index: 100;
}

.toast-header {
	color: white;
	background-color: #42B4E6;
	justify-content: space-around;
	font-size: 1.2em;
}

#index_01 {
	width: 1200px;
	height: 400px;
	border: 1px solid dimgrey;
	margin: 0 auto;
}

#slide1 {
	height: 300px;
	overflow: hidden;
	border-bottom: 1px solid dimgrey;
}

#slide1>ul {
	width: 3600px;
	font-size: 0;
}

#slide1>ul>li {
	display: inline-block;
	font-size: 0;
}

label {
	width: 100px;
	height: 100%;
	position: absolute;
	opacity: 0;
	z-index: 10;
	cursor: pointer;
	transition: opacity .2s;
	color: #FFF;
	font-size: 200px;
	text-align: center;
	line-height: 350px;
	background-color: rgba(255, 255, 255, .3);
	text-shadow: 0px 0px 15px rgb(119, 119, 119);
}

label:hover {
	opacity: 1;
}

.next {
	right: 0;
}

.upside {  
	height: 450px;
}
#chart text{ 
	font-size: 15px; 
}  
.feed{  
	height: 280px; 
}
.feed h2{  
	font-size: x-large;   
}     
.feed p{  
	font-size: 1.3em;
	height: 67%; 
	overflow: auto;
	border-top: 1px solid lightgrey;
	border-bottom: 1px solid lightgrey;
}
.feed span{
	position: absolute;
	bottom: 0; 
} 
.under{ 
	height : 380px;
} 
.x_panel{
	overflow: auto;   
}
</style>
<div class="row">
	<div class="col-md-6 col-sm-6  ">
		<div class="x_panel upside">
			<div class="x_title ">
				<h2>
					진행중인 프로젝트
				</h2> 
				<ul class="nav navbar-right panel_toolbox ">
					<li><a href="${cPath }/main/projects">더보기</a></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content" style="display: block;">
				<c:if test="${not empty myProjectList }">
					<c:forEach var="prjct" items="${myProjectList }" step="4"
						varStatus="stts">
						<div class="bigD">
							<c:if test="${stts.index ne 0 }">
								<label class="prev">&#x2039;</label>
							</c:if>
							<c:forEach var="li" items="${myProjectList }"
								begin="${stts.index }" end="${stts.index + 3 }" step="1"
								varStatus="stt">
								<div class="smallD">
									<h5 class='goProject prjctNm ellipsis mt-3'
										data-prjctno="${li.prjctNo }" title="${li.prjctNm }">${li.prjctNm }</h5>
									<p>시작일자 : ${li.prjctBeginde } ${stts.end }</p>
									<p>종료일자 : ${li.prjctEndde }</p>
									<p>내 역할 : ${li.role.authorNm  }</p>
									<div class="myProgress mb-3"> 
										<div data-begin="${li.prjctBeginde }"
											data-end="${li.prjctEndde }" class="progressbar">0%</div>
									</div> 
								</div>
							</c:forEach>
							<c:if test="${not stts.last}">
								<label class="next">&#x203a;</label>
							</c:if>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty myProjectList }">
					<h4 class="noData">참여중인 프로젝트가 없습니다.</h4>
				</c:if>
			</div>
		</div>
	</div>

	<div class="col-md-6 col-sm-6  ">
		<div class="x_panel upside">
			<div class="x_title">
				<h2>
					 프로젝트별 내 일감
				</h2>
				<ul class="nav navbar-right panel_toolbox ">
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div id="chart" class="x_content" style="display: block;"></div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-6 col-sm-6  ">
		<div class="x_panel under">
			<div class="x_title">
				<h2>
					공지사항
				</h2>
				<ul class="nav navbar-right panel_toolbox"> 
					<li><a href="${cPath }/notice/noticeList">더보기</a></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content" style="display: block;">

				<c:if test="${not empty noticeList }">
					<ul class="noticeUi">
						<c:forEach var="notice" items="${noticeList }"> 
							<li><a href="${cPath }/notice/detail/${notice.noticeCode}"> <strong class="ellipsis"
									title="${notice.noticeSj}">${notice.noticeSj}</strong> 
									<em>
										<em class="date">${notice.noticeRgsde }</em>
									</em>
							</a></li>
						</c:forEach>
					</ul>
				</c:if>
				<c:if test="${empty noticeList }">
					<h4 class="noData">공자사항이 없습니다.</h4>
				</c:if>
			</div>
		</div>
	</div>

	<div class="col-md-6 col-sm-6  ">
		<div class="x_panel under">
				<c:if test="${not empty news }"> 
				<div class="x_title">
					<h2>
						최근 뉴스
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a data-prjctNo="${news.prjctNo }" class="moreNews">더보기</a></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul> 
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<div class="float-left feed col-md-12 mt-2">
						<h6> 
							<strong>${news.memName }</strong><small>님이 작성함</small>
						</h6>
						<h2>${news.boSj }</h2>
						<p>${news.boCn }</p>
						<span>${news.boRgsde } 작성</span>
					</div>
<!-- 					<div class="float-right feed col-md-5 mt-2">  -->
<%-- 						<img src="${cPath }/resources/imgs/temp/" alt="이미지"> --%>
<!-- 					</div> -->
					</div>
				</c:if>
				<c:if test="${empty news }">
					<div class="x_title">
					<h2> 
						최근 뉴스
					</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<h4 class="noData">뉴스가 없습니다.</h4>
				</div>
				</c:if>
		</div>
	</div>
</div>
 
<div class="toast" data-autohide="false" >
	<div class="toast-header pt-2 pb-2"> 
		<strong>WELCOME</strong>
	</div>
	<div class="toast-body">${S0010120}</div>
</div>

<script> 
	$(function() {
		var big = $('.bigD:first-child');
		var notFirst = $('.bigD:not(:first-child)');
		$(big).css("display", "inline-block");
		$(notFirst).animate({marginRight: "-1200px"});
		//슬라이드 배너 오른쪽 화살표 누름
		$(".next").on("click",function(){   
			$(big).animate({marginLeft: "-1200px"}); 
			$(notFirst).animate({marginRight: "0px"}); 
			$(notFirst).css("display", "inline-block"); 
			if($(big).css("margin-left")=="-1200px"){ 
				$(big).css("display", "none").animate({marginLeft: "-2400px"}); 
			}else if($(big).css("margin-left")=="-2400px"){
				$(big).animate({marginLeft: "0px"});  
			} 
		});
		 
// 		$('.bigD:first-child').delay(2500);   
		//슬라이드 배너 왼쪽 화살표 누름
		$(".prev").on("click",function(){   
			$(notFirst).animate({marginRight: "-1200px"}); 
			$(big).animate({marginLeft: "0px"}); 
			$(big).css("display", "inline-block");  
			$(notFirst).css("display", "none");  
			if($(notFirst).css("margin-right")=="-1200px"){ 
				$(notFirst).animate({marginRight: "-2400px"}).css("display", "none"); 
			}else if($(notFirst).css("margin-right")=="-2400px"){
				$(notFirst).css("display", "none").animate({marginRight: "0px"});  
			}
		});
		
		//웰컴 토스트 메시지
		$('.toast').css("display", "none");
		<c:if test="${not empty loginSuccess }"> 
			function showMsg() { 
			 $('.toast').css("display", "block");
			 $('.toast').toast('show');  
			}  
			function hideMsg(){
				 $('.toast').fadeOut(1000);   
				 $('.toast').css("display", "none");
			}      
			setTimeout(showMsg, 500);
			setTimeout(hideMsg, 3000);
		</c:if>      
		<c:remove var="loginSuccess" scope="session"/>

		
		//공지사항 NEW (30일이내) 마크
		var dates = $(".date"); 
		var now = new Date(); 
		var monthAgo = new Date(now.setMonth(now.getMonth() - 1));
		$.each(dates, function(i, date){
			let rgsde = new Date($(date).html());  
			if(rgsde >= monthAgo){  
				$(date).before($("<span class='newMark'>").html("N"));
			}   
		});
		 
		//프로젝트 진행바
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

		
		//프로젝트명 클릭시 프로젝트 팝업 열림
	$(".goProject").click(function(){ 
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
	
		
	//뉴스 더보기 클릭시 해당 프로젝트 팝업 뉴스 열림	
	$(".moreNews").click(function(){ 
		let pCode = $(this).data("prjctno");
		let prjctNm = $(this).html(); 
		var popupWidth = 1400;             
		var popupHeight = 950;                  
		var popupX = (window.screen.width / 2) - (popupWidth / 2); 
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음    
		var popupY= (window.screen.height / 2) - (popupHeight / 2) - 50;  
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음       
		var popup = window.open("${cPath}/project/"+pCode + "/news/list", prjctNm + " 프로젝트", 'toolbar=yes,scrollbars=yes, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY );
 	});  
		
	//상태별 내 일감그래프
		<c:if test="${not empty chartList}">
			prjctNms = ${chartList[0]}; 
			newcnts = ${chartList[1]};
			ingcnts = ${chartList[2]};
			donecnts = ${chartList[3]};
		</c:if>	
	
        var options = {
          series: [{
          name: '신규',
          data: newcnts
        }, {
          name: '진행',
          data:  ingcnts
        }, {
          name: '완료',
          data: donecnts
        }],
          chart: {
          type: 'bar',
          height: 350,
          fontFamily:'Noto Sans KR, sans-serif'
        },
        plotOptions: {
          bar: {
            horizontal: false,
            columnWidth: '55%',
            endingShape: 'rounded'
          },
        },
        dataLabels: {
          enabled: false
        },
        stroke: {
          show: true,
          width: 2,
          colors: ['transparent']
        },
        xaxis: {
          categories: prjctNms,
        },
        yaxis: {
          title: {
            text: '일감 수'
          }
        },
        fill: {
          opacity: 0.6
        },
        tooltip: {
          y: {
            formatter: function (val) {
              return  val + " 개"
            }
          }
        }
        };

	        var chart = new ApexCharts(document.querySelector("#chart"), options);
	        chart.render();
	      
});
	 
	
	
</script>
