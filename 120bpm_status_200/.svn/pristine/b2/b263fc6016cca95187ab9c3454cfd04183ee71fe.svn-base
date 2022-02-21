<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>  
<style>
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

.grid{
	display: grid;
	grid-template-columns: 2fr 1fr;
	grid-template-rows : 420px 400px;
	column-gap: 2%;     
	row-gap : 2%;
}
.item1{
	 grid-column: 1 / 3;
} 
.apexcharts-datalabels{
	font-size: 17px;
} 
</style>

<div class="grid">
<div class="x_panel item1">     
	<div class="x_title">  
		<h2> 
			월별 프로젝트 등록 현황
		</h2>
		<div class="clearfix"></div>
	</div> 
	<div class="x_content" style="display: block;">
		<div id="prjctChart"></div>
	</div>
</div>

<div class="x_panel under ">
	<div class="x_title">  
		<h2>
			공지사항
		</h2>
		<ul class="nav navbar-right panel_toolbox"> 
			<li><a href="${cPath }/notice/noticeList">더보기</a></li>
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
	
<div class="x_panel under  ">
	<div class="x_title">
		<h2>
			진행 상태별 프로젝트 비율
		</h2>
		<div class="clearfix"></div>
	</div>
	<div class="x_content" style="display: block;">
		<div id="sttsChart"></div>
	</div>
</div>
</div>
<script> 
var datas = [];
var ctgrys = [];
var year = "";
<c:if test="${not empty prjctList }">
	year = "${prjctList[0]['thismonths']}";
	year = year.substring(0,4);
<c:forEach items="${prjctList }" var="pj" varStatus="stt">
	datas.push(${pj.prjctcnt});
	ctgrys.push('${pj.thismonths}');
</c:forEach>
</c:if> 
var options = {
        series: [ 
        {
          name: "프로젝트",
          data: datas
        }
      ],
        chart: {     
        height: 330, 
        type: 'line', 
        dropShadow: {
          enabled: true,
          color: '#000',
          top: 18,
          left: 7,
          blur: 10,
          opacity: 0.2
        },
        toolbar: {
          show: false
        }
      },
      colors: ['#77B6EA', '#545454'],
      dataLabels: {
        enabled: true,
      },
      stroke: {
        curve: 'smooth'
      },
      grid: {
        borderColor: '#e7e7e7',
        row: {
          colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
          opacity: 0.5
        },
      },
      markers: {
        size: 1
      },
      xaxis: {
        categories: ctgrys,
        title: {
          text: year+'년 월별'
        }
      },
      yaxis: {
        title: {
          text: '등록 수'
        },
        min: 0,
        max: 10
      },  
      legend: {
        position: 'top',
        horizontalAlign: 'right',
        floating: true,
        offsetY: -25,
        offsetX: -5
      }
      };
 	
  	//월별 프로젝트 등록 현황
      var chart = new ApexCharts(document.querySelector("#prjctChart"), options);
      chart.render();
    
	  var series = [];       
      <c:if test="${not empty prjct }">
      	series.push(${prjct.yetcount});
      	series.push(${prjct.ingcount});
      	series.push(${prjct.donecount});
      </c:if> 
      var options2 = {
        series: series,
        chart: { 
        width: 420, 
        type: 'pie', 
      }, 
      fill: {
          opacity: 0.7
        },
      labels: ['등록 - ${prjct.yetcount}', '진행 - ${prjct.ingcount}', '완료 - ${prjct.donecount}'],
      responsive: [{
        breakpoint: 480,
        options: { 
          chart: { 
            width: 200,
          },   
          legend: {
            position: 'bottom',
            
          }
        }
      }],
      legend: {
      	fontSize : '17px'
      } 
      };
	//진행 상태별 프로젝트 비율
      var chart = new ApexCharts(document.querySelector("#sttsChart"), options2);
      chart.render(); 

$(function(){ 
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
	
});   
    
  
</script>

