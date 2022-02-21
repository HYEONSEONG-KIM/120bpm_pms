<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="${cPath }/resources/dashboard/styles.css" /> --%>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style>
#avgAndIssue{
	display: grid;
	grid-template-columns : 2fr 0.1fr 2fr;
	margin: 2%;
	text-align: center;
	width: 95%;
}
#categoryReport{
	margin: 2%;
	text-align: center;
	width: 95%;
	background: #ffffff;
	border-radius: 7px;
}
.content{
	background: #ffffff;
	border-radius: 7px;
}
.progress{
	margin-top: 1.2rem;
}
</style>
</head>
<body>


<div id = "avgAndIssue">
	<div id = "workAvg" class = "content"></div>
	<div></div>
	<div id = "issue" class = 'content'></div>
</div>

<div id = "categoryReport">
	<div>
		<h3 style = "margin: 20px;">일감카테고리 Report</h3>
		<table class="table">
			<tr>
				<th>카테고리명</th>
				<th>등록 일감수</th>
				<th>긴급</th>
				<th>높음</th>
				<th>보통</th>
				<th>낮음</th>
				<th>평균 진척도</th>
			</tr>
			<c:choose>
				<c:when test="${empty CategoryList}">
					<tr>
						<td>카테고리가 존재하지 않습니다</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${CategoryList }" var="category">
						<tr>
							<td>${category.ctgryNm}</td>
							<td>${category.workCnt}</td>
							<td>${category.emergency}</td>	
							<td>${category.high}</td>	
							<td>${category.middle}</td>	
							<td>${category.low}</td>	
							<td>
								<div class="progress">
			 						<div class="progress-bar progress-bar-striped progress-bar-animated" 
			 						role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" data-avg = "${prtMem.avgWork}" 
			 						style=
			 						"width: ${category.prgsAvg ne 0?category.prgsAvg : '100'}%; 
			 						background-color : ${category.prgsAvg eq 0?'#F5F5F5' : ''};
			 						color : ${category.prgsAvg eq 0?'black' : ''}
			 						">
			 						${category.prgsAvg ne 0? category.prgsAvg : '0'}%
			 						</div>
								</div>
							</td>	
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>

</div>
</body>
<script type="text/javascript">

var totalWork = '${work.totalWork}';
var avgPrgs = '${work.avgPrgs}';
var donecount = '${work.donecount}';
var totalIssue = '${issue.totalIssue}';
var solutIssue = '${issue.solutIssue}';


// 평균 진척도
var options = {
        series: [avgPrgs],
        chart: {
        height: 350,
        type: 'radialBar',
        offsetY: -10
      },
      plotOptions: {
        radialBar: {
          startAngle: -135,
          endAngle: 135,
          dataLabels: {
            name: {
              fontSize: '16px',
              color: undefined,
              offsetY: 120
            },
            value: {
              offsetY: 76,
              fontSize: '22px',
              color: undefined,
              formatter: function (val) {
                return val + "%";
              }
            }
          }
        }
      },
      fill: {
        type: 'gradient',
        gradient: {
            shade: 'dark',
            shadeIntensity: 0.15,
            inverseColors: false,
            opacityFrom: 1,
            opacityTo: 1,
            stops: [0, 50, 65, 91]
        },
      },
      stroke: {
        dashArray: 4
      },
      labels: [''],
      title: {
          text: '전체 평균 진척도',
          align: 'center',
          offsetY: 20,
          style: {
            fontSize: '18px',
            fontWeight:  'bold'
          }
        },
      };

      var chart = new ApexCharts(document.querySelector("#workAvg"), options);
      chart.render();

// 일감 및 이슈 진행 차트
var optionDonut = {
        series: [totalWork, donecount ,totalIssue, solutIssue],
        chart: {
	        type: 'radialBar',
	        width: '100%', 
	        height: 320, 
	        fontFamily:'Noto Sans KR, sans-serif'
      },  
      plotOptions: {
        radialBar: {
          offsetY: 0,
          startAngle: 0, 
          endAngle: 270,
          hollow: {
            margin: 5,
            size: '30%',
            background: 'transparent',
            image: undefined,
          },
          dataLabels: {
            name: {
              show: false,
            },
            value: {
              show: false,
            }
          }
        }
      },
      colors: ['#52e3d2',  '#c9bf2c', '#f52a52', '#42b4e6'],
      labels: ['등록 일감', '완료 일감', '발생 이슈', '해결 이슈' ],
      legend: {
        show: true,
        floating: true,
        fontSize: '16px',
        position: 'left',
        offsetX: 85, 
        offsetY: 25,
        labels: {  
          useSeriesColors: true,
        }, 
        markers: {
          size: 0
        },
        formatter: function(seriesName, opts) {
          return seriesName + ":  " + opts.w.globals.series[opts.seriesIndex]
        },
        itemMargin: {
          vertical: 3
        }
      },
      title: {
          text: '일감 및 이슈 진행 차트',
          align: 'center',
          style: {
            fontSize: '18px'
          }
        },
      responsive: [{
        breakpoint: 480,
        options: {
          legend: {
              show: false
          }
        }
      }]
      };
var donut = new ApexCharts(
  document.querySelector("#issue"),
  optionDonut
)
donut.render();

</script>
</html>