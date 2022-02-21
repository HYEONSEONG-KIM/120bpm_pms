<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#memTopPar{
		display: grid;
		grid-template-columns : 0.8fr 2fr;
		margin: 2%;
		text-align: center;
		width: 95%;
		background: #fcfcfc;
	}
	
	#memMidPar{
		display: grid;
		grid-template-columns : 1.3fr 0.1fr 1.3fr;
		margin: 2%;
		text-align: center;
		width: 95%;
		background: #ffffff;
	}
	
	#memImg img{
		border-radius: 50%;
		width: 230px;
		height: 230px;
		margin-left: 20%;
	}
	#memInfo hr{
		height: 1.5px;
		background: skyblue;
	}
	
	#boardCnt, #workAvg {
		background: #fcfcfc;
		border-radius: 5px;
		box-shadow: 1px 1px 1px lightGray;
	}
	
</style>
</head>
<body>
		<h3 style = "text-align: center;">${memDetail.memName}님의 프로젝트 status</h3>
	<div id = "memTopPar">
		<div id = "memImg">
			<img alt="memImg" src="${cPath}/resources/imgs/member/${memDetail.proflImgNm}">
		</div>
		<div id = "memInfo">
			<hr>
			<table class = "table">
				<tr>
					<th>이름</th>
					<td>${memDetail.memName}</td>
				</tr>
				<tr>
					<th>역할</th>
					<td>${memDetail.authorNm}(${memDetail.authorDc})</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${memDetail.createde }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${memDetail.memEmail }</td>
				</tr>
			</table>
				<hr>
		</div>
	</div>
	
	<div id = "memMidPar">
		<div id = "boardCnt">
		
		</div>
		<div></div>
		<div id = "workAvg">
		
		</div>
	</div>
</body>
</html>
<script>

	var boardOptions = {
	        series: [{
	        name: 'Series 1',
	        data: ${boardCnt},
	      }],
	        chart: {
	        height: 350,
	        type: 'radar',
	      },
	      title: {
	        text: '메뉴별 글 등록 현황',
	        style: {
      	      fontSize:  '20px',
      	      fontWeight:  'bold',
      	      fontFamily:  undefined,
      	      color:  '#263238'
      	    }
	      },
	      xaxis: {
	        categories: ['일감', '이슈', '뉴스', '위키', '자유게시판']
	      }
	      };
	
	      var boardChart = new ApexCharts(document.querySelector("#boardCnt"), boardOptions);
	      boardChart.render();

	      var workOptions = {
	              series: [${workAvg}],
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
	            labels: ['일감 평균 진척도'],
	            };
	      
      var workChart = new ApexCharts(document.querySelector("#workAvg"), workOptions);
      workChart.render();
</script>