<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="${cPath}/resources/js/projectReport.js"></script>

<style type="text/css">
#prtInfoArea{
	display: grid;
	grid-template-columns : 2fr 0.1fr 2fr;
	margin: 2%;
	text-align: center;
	width: 95%;
}
#memberInfo{
		display: grid;
		grid-template-columns : 0.1fr 4fr 0.1fr;
		margin: 2%;
		text-align: center;
		width: 95%;
		background: #ffffff;	
	
}
.content{
	background: #ffffff;
	border-radius: 7px;
}
#memberInfo td{
	text-align: center;	
}
.progress{
	
	margin-top: 1.2rem;
	
}
</style>
	

	<div id = "prtInfoArea">
		<div id = "basicInfo" class = "content">
			<h3>개요</h3>
				<table class = 'table'>
					<tr>
						<th>프로젝트명</th>
						<td>${prt.prjctNm}</td>
					</tr>
					<tr>
						<th>개요내용</th>
						<td>${prt.sumry}</td>
					</tr>
					<tr>
						<th>시작일자</th>
						<td>${fn:substring(prt.prjctBeginde,0,10)}</td>
					</tr>
					<tr>
						<th>종료일자</th>
						<td>${fn:substring(prt.prjctEndde,0,10)}</td>
					</tr>
					<tr>
						<th>발주처명</th>
						<td>${prt.prjctOrnt}</td>
					</tr>
					<tr>
						<th>사업규모</th>
						<td>${prt.bsnssclae}</td>
					</tr>
				</table>
		</div>
		
		<div class = "pad"></div>
		
		<div id = "boardCnt" class = "content"></div>
	</div>
	<div id = "memberInfo">
		<div></div>
		<div>
			<h3>구성원 정보</h3>
			<table class = 'table content'>
				<tr style = "text-align: left;">
					<th>번호</th>
					<th>회원ID</th>
					<th>이름</th>
					<th>역할</th>
					<th>등록일</th>
					<th>진척도 평균</th>
				</tr>
				<c:forEach items="${prtMemList}" var="prtMem" varStatus="status">
					<tr>
						<td>${status.index +1}</td>
						<td>${prtMem.memId}</td>
						<td>${prtMem.memName}</td>
						<td>${prtMem.authorNm}</td>
						<td>${prtMem.createMonths }</td>
						<td>
						<div class="progress">
	 						<div class="progress-bar progress-bar-striped progress-bar-animated" 
	 						role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" data-avg = "${prtMem.avgWork}" 
	 						style=
	 						"width: ${prtMem.avgWork ne 0?prtMem.avgWork : '100'}%; 
	 						background-color : ${prtMem.avgWork eq 0?'#F5F5F5' : ''};
	 						color : ${prtMem.avgWork eq 0?'black' : ''}
	 						">
	 						${prtMem.avgWork ne 0? prtMem.avgWork : '0'}%
	 						</div>
						</div>
						
						</td>
					</tr>
				</c:forEach>				
			</table>
		</div>
		<div></div>
	</div>


<script type="text/javascript">
var options = {
        series: [{
        name: 'Series 1',
        data: ${menuCnt},
      }],
        chart: {
        height: 370,
        type: 'radar',
      },
      title: {
        text: '메뉴별 등록된 글',
      	  style: {
      	      fontSize:  '20px',
      	      fontWeight:  'bold',
      	      fontFamily:  undefined,
      	      color:  '#263238'
      	    }
      },
      xaxis: {
        categories: ${menu}
      }
      };

      var chart = new ApexCharts(document.querySelector("#boardCnt"), options);
      chart.render();

</script>
