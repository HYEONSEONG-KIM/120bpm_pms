<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Role Report</title>
<style type="text/css">
#par{
	width: 95%;
	background: #fcfcfc;
	display: grid;
	grid-template-columns : 0.9fr 0.2fr 1.7fr;
	margin: 2%;
	text-align: center;
	padding-top: 5px;
}
.par2{
	width: 95%;
	background: #fcfcfc;
	margin: 2%;
	text-align: center;
	padding-top: 5px;
}
table{
	margin-top: 15px;
}
table th{
	font-size: 15px;
}
table td{
	font-size: 20px;
}
#menuRoleText{
 	font-size : 35px;
 	color :  #9699a2;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>
	<div id = "par">
		<div id = "roleAuthCnt"></div>
		<div></div>
		<div id = "projectRoleAvg"></div>
	</div>
	
	<div class = "par2">
		<div id = "roleMemCnt"></div>
	</div>
	
	<div class = "par2">
		<span id = "menuRoleText">메뉴별 역할 보호자원 통계 </span>
		<table class = "table">
			<thead>
			<tr>
				<td> </td>
				<c:forEach var="resLevel2" items="${level2Res }">
					<th>${resLevel2.resrceDc }</th>				
				</c:forEach>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${allRole}" var="role">
			<tr>
				<th><a href = "detail/${role.author}">${role.authorNm}</a></th>
				<c:set  var="cnt" value="0"/>
				<c:forEach items="${level2Res}" var="parRes">
					<c:forEach items="${ resourceList}" var="allRes">
						<c:forEach items="${allRes.authorities}" var="resAuth">
							<c:if test="${(role.author eq resAuth.author) and (allRes.resrceParent eq parRes.resrceCode) }">
								<c:set var="cnt" value="${cnt +1}"/>
							</c:if>
						</c:forEach>
					</c:forEach>
						<td>${cnt}</td>
				<c:set  var="cnt" value="0"/>
				</c:forEach>
			</tr>
			</c:forEach>
			</tbody>
			<tfoot></tfoot>
		</table>
	</div>
	
</body>
<script type="text/javascript">



var roleAvgOptions = {
        series: [{
        data: ${cntAvg}
      }],
        chart: {
        type: 'bar',
        height: 400
        
      },
      colors : '#5CACEB',
      plotOptions: {
        bar: {
          borderRadius: 4,
          horizontal: true,
        },
        
      },
      dataLabels: {
        enabled: false,
      },
      xaxis: {
        categories: ${authList},
        position: 'bottom',
        range : 100,
        min: 0,
        max: 100,
        labels: {
            show: true,
            rotate: -45,
            rotateAlways: false,
            hideOverlappingLabels: true,
            showDuplicates: false,
            trim: false,
            minHeight: undefined,
            maxHeight: 100,
            style: {
                colors: [],
                fontSize: '20px',
                fontFamily: 'Helvetica, Arial, sans-serif',
                fontWeight: 400,
                cssClass: 'apexcharts-xaxis-label',
            }
        
        },
        
      },
      yaxis :{
    	  labels: {
              
              style: {
                  colors: [],
                  fontFamily: 'sans-serif',
                  fontSize: '20px',
                  fontWeight: 400,
                  cssClass: 'apexcharts-xaxis-label',
              }
            
    	  
      },
      },
      subtitle: {
          text: "전체 프로젝트 대비 역할 할당 비율",
          align: 'left',
          margin: 10,
          offsetX: 80,
          offsetY: 0,
          floating: false,
          style: {
            fontSize:  '30px',
            fontWeight:  'normal',
            fontFamily:  undefined,
            color:  '#9699a2'
          },
      },
      tooltip: {
          enabled: true,
          enabledOnSeries: undefined,
          shared: true,
          followCursor: false,
          intersect: false,
          inverseOrder: false,
          custom: undefined,
          fillSeriesColor: false,
          theme: false,
          style: {
            fontSize: '20px',
            fontFamily: undefined
          },
          onDatasetHover: {
              highlightDataSeries: true,
          },
          x: {
              show: true,
              format: 'dd MMM',
              formatter: undefined,
          },
          y: {
              formatter: undefined,
              
          },
          z: {
              formatter: undefined,
              title: 'Size: '
          },
          marker: {
              show: false,
          },
         
          fixed: {
              enabled: false,
              position: 'topRight',
              offsetX: 0,
              offsetY: 0,
          },
      }
      };

      var chart = new ApexCharts(document.querySelector("#projectRoleAvg"), roleAvgOptions);
      chart.render();
    
      
      
      var roleAuthCntOptions = {
              series: ${cntAuth},
              chart: {
              type: 'polarArea',
            },
            labels: ${roleAuthList},
            stroke: {
              colors: ['#fff']
            },
            fill: {
               type: 'gradient',
              opacity: 0.8
            },
          
            responsive: [{
              breakpoint: 300,
              options: {
                chart: {
                  width: 100
                },
                legend: {
                  position: 'bottom'
                }
              }
            }],
            subtitle: {
                text: "역할별 보호자원 통계",
                align: 'left',
                margin: 10,
                offsetX: 50,
                offsetY: 0,
                floating: false,
                style: {
                  fontSize:  '30px',
                  fontWeight:  'normal',
                  fontFamily:  undefined,
                  color:  '#9699a2'
                },
            },
            tooltip: {
                enabled: true,
                enabledOnSeries: undefined,
                shared: true,
                followCursor: true,
                intersect: false,
                inverseOrder: false,
                custom: undefined,
                fillSeriesColor: true,
                theme: true,
                style: {
                  fontSize: '20px',
                  fontFamily: undefined
                },
                onDatasetHover: {
                    highlightDataSeries: true,
                },
                x: {
                    show: true,
                    format: 'dd MMM',
                    formatter: undefined,
                },
                y: {
                    formatter: undefined,
                    title: {
                        formatter: '할당된 %',
                    },
                },
                z: {
                    formatter: undefined,
                    title: 'Size: '
                },
                marker: {
                    show: true,
                },
               
                fixed: {
                    enabled: false,
                    position: 'topRight',
                    offsetX: 0,
                    offsetY: 0,
                },
            }
            };

            var chart = new ApexCharts(document.querySelector("#roleAuthCnt"), roleAuthCntOptions);
            chart.render();
      
            var roleMemCntOptions = {
                    series: [{
                      name: "Desktops",
                      data: ${roleMemCnt}
                  }],
                    chart: {
                    height: 350,
                    type: 'line',
                    zoom: {
                      enabled: false
                    }
                  },
                  dataLabels: {
                    enabled: false
                  },
                  stroke: {
                    curve: 'straight'
                  },
                  title: {
                    text: '사용자-역할 부여 현황',
                    align: 'left',   
                    margin: 10,
                    offsetX: 30,
                    offsetY: 0,
                    style: {
                        fontSize:  '30px',
                        fontWeight:  'bold',
                        fontFamily:  undefined,
                        color:  '#9699a2'
                      },
                  },
                  grid: {
                    row: {
                      colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                      opacity: 0.5
                    },
                  },
                  xaxis: {
                    categories: ${authList},
                    labels: {
                        show: true,
                        rotate: -45,
                        rotateAlways: false,
                        hideOverlappingLabels: true,
                        showDuplicates: false,
                        trim: false,
                        minHeight: undefined,
                        maxHeight: 100,
                        style: {
                            colors: [],
                            fontSize: '20px',
                            fontFamily: 'Helvetica, Arial, sans-serif',
                            fontWeight: 400,
                            cssClass: 'apexcharts-xaxis-label',
                        }
                    
                    },
                  },
                  yaxis :{
                	  labels: {
                          
                          style: {
                              colors: [],
                              fontFamily: 'sans-serif',
                              fontSize: '15px',
                              fontWeight: 400,
                              cssClass: 'apexcharts-xaxis-label',
                          }
                        
                	  
                  },
                  },
                  tooltip: {
                      enabled: true,
                      enabledOnSeries: undefined,
                      shared: true,
                      followCursor: false,
                      intersect: false,
                      inverseOrder: false,
                      custom: undefined,
                      fillSeriesColor: false,
                      theme: false,
                      style: {
                        fontSize: '20px',
                        fontFamily: undefined
                      },
                      onDatasetHover: {
                          highlightDataSeries: true,
                      },
                      x: {
                          show: true,
                          format: 'dd MMM',
                          formatter: undefined,
                      },
                      y: {
                          formatter: undefined,
                          
                      },
                      z: {
                          formatter: undefined,
                          title: 'Size: '
                      },
                      marker: {
                          show: false,
                      },
                     
                      fixed: {
                          enabled: false,
                          position: 'topRight',
                          offsetX: 0,
                          offsetY: 0,
                      },
                  }
                  };

                  var chart = new ApexCharts(document.querySelector("#roleMemCnt"), roleMemCntOptions);
                  chart.render();
                


</script>
</html>