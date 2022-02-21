/**
 * 
 */

Apex.grid = {
  padding: {
    right: 0,
    left: 0
  }
}

Apex.dataLabels = {
  enabled: false
}

var randomizeArray = function (arg) {
  var array = arg.slice();
  var currentIndex = array.length, temporaryValue, randomIndex;

  while (0 !== currentIndex) {

    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}

// data for the sparklines that appear below header area
var sparklineData = [47, 45, 54, 38, 56, 24, 65, 31, 37, 39, 62, 51, 35, 41, 35, 27, 93, 53, 61, 27, 54, 43, 19, 46];

// the default colorPalette for this dashboard
//var colorPalette = ['#01BFD6', '#5564BE', '#F7A600', '#EDCD24', '#F74F58'];
var colorPalette = ['#00D8B6','#008FFB',  '#FEB019', '#FF4560', '#775DD0']

var spark1 = {
  chart: {
    id: 'sparkline1',
    group: 'sparklines',
    type: 'area', 
    height: 150,
    fontFamily:'Noto Sans KR, sans-serif',
    sparkline: {
      enabled: true
    },
  },
  stroke: {
    curve: 'straight'
  },
  fill: {
    opacity: 1, 
  },
  series: [{
    name: '등록 일감(개수)',
    data: counts
  }],
  labels: days,
  yaxis: {
    min: 0
  },
  xaxis: {
    type: 'category',
  },
  colors: ['#52e3d2'],
  title: {
    text: '총 등록 일감',
    offsetX: 30,
    style: { 
      fontSize: '15px',
      cssClass: 'apexcharts-yaxis-title'
    }
  },
  subtitle: {
    text: totalWork + '개',
    offsetX: 30, 
    style: {
      fontSize: '24px',
      cssClass: 'apexcharts-yaxis-title'
    }
  }
}

var spark2 = {
  chart: {
    id: 'sparkline2',
    group: 'sparklines',
    type: 'area',
    height: 150,
    fontFamily:'Noto Sans KR, sans-serif',
    sparkline: {
      enabled: true
    },
  },
  stroke: {
    curve: 'straight'
  },
  fill: {
    opacity: 1,
  },
  series: [{
    name: ' 평균 진척도(%)',
    data: dayAvgPrgs
  }],
  labels: days,
  yaxis: {
    min: 0
  },
  xaxis: {
    type: 'category',
  },
  colors: ['#42b4e6'],
  title: {
    text: '평균 진척도',
    offsetX: 30,
    style: {
      fontSize: '15px',
      cssClass: 'apexcharts-yaxis-title'
    }
  },
  subtitle: {
    text: avgPrgs + '%',
    offsetX: 30,
    style: {
      fontSize: '24px',
      cssClass: 'apexcharts-yaxis-title'
    }
  }
}

var spark3 = {
  chart: {
    id: 'sparkline3',
    group: 'sparklines',
    type: 'area',
    height: 150, 
    fontFamily:'Noto Sans KR, sans-serif',
    sparkline: {
      enabled: true
    },
  },
  stroke: {
    curve: 'straight'
  },
  fill: {
    opacity: 1,
  },
  series: [{
    name: '발생 이슈(개)',
    data: dayiscnt 
  }],
  labels: days,
  xaxis: {
    type: 'category',
  },
  yaxis: {
    min: 0
  },
//  colors: ['#008FFB'],
  colors: ['#5564BE'],
  title: {
    text: '총 발생 이슈',
    offsetX: 30,
    style: {
      fontSize: '15px',
      cssClass: 'apexcharts-yaxis-title'
    }
  },
  subtitle: { 
    text: totalIssue + "개", 
    offsetX: 30, 
    style: {
      fontSize: '24px',
      cssClass: 'apexcharts-yaxis-title'
    }
  }
}

var monthlyEarningsOpt = {
  chart: { 
    type: 'area',
    height: 250,
    background: '#eff4f7',
    fontFamily:'Noto Sans KR, sans-serif',
    sparkline: {
      enabled: true
    },
    offsetY: 20
  },
  stroke: {
    curve: 'straight'
  },
  fill: {
    type: 'solid',
    opacity: 1,
  },
  series: [{
    data: randomizeArray(sparklineData)
  }],
  xaxis: {
    crosshairs: {
      width: 1
    },
  },
  yaxis: {
    min: 0,
    max: 130
  },
  colors: ['#dce6ec'],

  title: {
    text: 'Total Earned',
    offsetX: -30,
    offsetY: 100,
    align: 'right',
    style: {
      color: '#7c939f',
      fontSize: '16px',
      cssClass: 'apexcharts-yaxis-title'
    }
  },
  subtitle: {
    text: '$135,965',
    offsetX: -30,
    offsetY: 100,
    align: 'right',
    style: {
      color: '#7c939f',
      fontSize: '24px',
      cssClass: 'apexcharts-yaxis-title'
    }
  }
}


new ApexCharts(document.querySelector("#spark1"), spark1).render();
new ApexCharts(document.querySelector("#spark2"), spark2).render();
new ApexCharts(document.querySelector("#spark3"), spark3).render();

var monthlyEarningsChart = new ApexCharts(document.querySelector("#monthly-earnings-chart"), monthlyEarningsOpt);

//이슈 발생 대비 해결률 그래프
var optionsArea = {
	  colors: ['#f52a52', '#42b4e6'],
      series: [{
      name: '이슈 발생률(%)',
      data: occAvgs
    }, {
      name: '이슈 해결률(%)',
      data: solAvgs
    }],
      chart: {
      height: 305,
      fontFamily:'Noto Sans KR, sans-serif',
      type: 'area'
    }, 
    dataLabels: {
      enabled: false
    },
    stroke: {
      curve: 'smooth'
    },
    xaxis: {
      type: 'datetime',
      categories: days
    },
    title: {
	    text: '이슈 발생 대비 해결률 그래프',
	    align: 'left',
	    style: {
	      fontSize: '18px'
	    }
    },
    tooltip: {
      x: {
        format: 'yyyy-MM-dd'
      },
    },
};
 

var chartArea = new ApexCharts(document.querySelector('#area'), optionsArea);
chartArea.render();
  
// 구성원별 담당 일감 상태 막대그래프  
var optionsBar = {
	colors: ['#52e3d2', '#42B4E6', '#fff570'],
    series: [{ 
      name: '신규',
      data: newcnts
    }, {
      name: '진행',
      data: ingcnts
    }, {  
      name: '완료',
      data: donecnts
    }],
    chart: { 
	  type: 'bar',
	  height: 280,
	  width: '100%',
	  fontFamily:'Noto Sans KR, sans-serif',
	  stacked: true, 
	  toolbar: {
	    show: true
	  },
	  zoom: {
	    enabled: true
	  }
	},
    responsive: [{
      breakpoint: 480,
      options: {
        legend: {
          position: 'bottom',
          offsetX: -10,
          offsetY: 0
        }
      }
    }],
    plotOptions: {
      bar: {
        horizontal: false,
//        columnWidth: '45%',
//        borderRadius: 10
      },
    },
    xaxis: {
      type: 'category',
      categories: mems,
    },
    legend: {
      position: 'right',
          offsetY: 40
        },
    fill: {
      opacity: 1
    },
    
    title: {
      text: '각 구성원 상태별 일감 그래프',
      align: 'left',
      style: {
        fontSize: '18px'
      }
    }

 };

  

var chartBar = new ApexCharts(document.querySelector('#bar'), optionsBar);
chartBar.render();


//일감 및 이슈 진행 차트
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
        offsetX: 5, 
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
          align: 'left',
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
  document.querySelector("#donut"),
  optionDonut
)
donut.render();


function trigoSeries(cnt, strength) {
  var data = [];
  for (var i = 0; i < cnt; i++) {
      data.push((Math.sin(i / strength) * (i / strength) + i / strength+1) * (strength*2));
  }

  return data;
}



