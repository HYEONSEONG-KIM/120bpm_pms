<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
.myProgress_detail {
	width: 95%;
	margin: 2%;
	background-color: #f3f3f3;
	border-radius: 5px;
	box-shadow: 1px 1px 1px #d5d7db;
	text-align: center;
}

.progressbar_detail {
	height: 20px;
	background-color: #42b4e6;
	text-align: center; /* To center it horizontally (if you want) */
	line-height: 37px; /* To center it vertically */
	border-radius: 5px;
	height: 40px;
}
#topPar{
	width: 95%;
	background: #ffffff;
	margin: 2%;
	text-align: center;
	padding-bottom: 10px;
}
#midPar{
		display: grid;
		grid-template-columns : 0.1fr 4fr 0.1fr;
		margin: 2%;
		text-align: center;
		width: 95%;
		background: #ffffff;
		
}
#bottomPar{
	display: grid;
		grid-template-columns : 1fr 0.1fr 1fr;
		margin: 2%;
		text-align: center;
		width: 95%;
		background: #ffffff;
}
#childProject{
	margin: 2%;
		text-align: center;
		width: 95%;
		background: #ffffff;
}
.innerInfo{
	margin: 30px;
	float: left;
	box-shadow: 1px 2px 3px 1px #d5d7db;
	padding: 0 10px;
	border-radius: 20px;
}

</style>

	<div id = "topPar">
		<h3>${prt.prjctNm }</h3>
		<div class="myProgress_detail">
			<div data-begin="${prt.prjctBeginde }" data-end="${prt.prjctEndde }"
				class="progressbar_detail">0%</div>
		</div>
	</div>
	
	<div id = "midPar">
		<div></div>
		<div id = "projectMem" class="innerInfo">
			<h3>프로젝트 구성원</h3>
			<table class = 'table'>
				<tr style = "text-align: left;">
					<th>번호</th>
					<th>회원ID</th>
					<th>이름</th>
					<th>역할</th>
					<th>이메일</th>
					<th>등록일</th>
				</tr>
				<c:forEach items="${prtMemList}" var="prtMem" varStatus="status">
					<tr>
						<td>${status.index +1}</td>
						<td>${prtMem.memId}</td>
						<td>${prtMem.memLnm}${prtMem.memFnm}</td>
						<td>${prtMem.authorNm}</td>
						<td>${prtMem.memEmail }</td>
						<td>${prtMem.createMonths }</td>
					</tr>
				</c:forEach>				
			</table>
		</div>
		<div></div>
	</div>
	
<div id = "bottomPar">
	<div id = "proejctInfo" class="innerInfo">
			<h3>프로젝트 정보</h3>
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
					<th>상위프로젝트</th>
					<td>${empty prt.parentPrtNm?"-" : prt.parentPrtNm}</td>
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

		
		<div></div>
	<div id="workGraph" class="innerInfo"></div>

</div>

<div id = "childProject">	
	<h3>하위 프로젝트 List</h3>
	<table id = "childPrtInfo" class = 'table'>
		<thead>
			<tr>
				<th>프로젝트명</th>
				<th>시작일자</th>
				<th>종료일자</th>
				<th>발주처명</th>
				<th>사업규모</th>
			</tr>
		</thead>
		
		<tbody>
		<c:choose>
			<c:when test="${empty childList}">
				<tr>
					<th colspan="5">하위 프로젝트가 없습니다</th>
				</tr>
			</c:when>
		
			<c:otherwise>
				<c:forEach items="${childList}" var = "child">
					<tr>
						<td>${child.prjctNm}</td>
						<td>${child.prjctBeginde }</td>
						<td>${child.prjctEndde }</td>
						<td>${child.prjctOrnt }</td>
						<td>${child.bsnssclae }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
		
		<tfoot></tfoot>
	</table>
</div>


<script>
	$(function() {
		
		var pgbars = $(".progressbar_detail");
		
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
			}else if(percent < 0){
				console.log($(this))
				$(this).css('background-color', '#F3F3F3')
			}
			
		});
		
		  var options = {
		          series: [{
		          name: 'Series 1',
		          data: ${menuCnt},
		        }],
		          chart: {
		          height: 380,
		          type: 'radar',
		        },
		        title: {
		          text: '메뉴별 등록 현황',
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

		        var chart = new ApexCharts(document.querySelector("#workGraph"), options);
		        chart.render();
		      
	});
</script>
