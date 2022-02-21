<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<script src = "${cPath}/resources/fullcalendar-5.9.0/lib/main.min.js"></script> 
<link href="${cPath}/resources/fullcalendar-5.9.0/lib/main.min.css" rel="stylesheet">
<script src = "${cPath}/resources/fullcalendar-5.9.0/lib/locales-all.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<style>
.fc-event-main:hover{ 
	color : #3788d8;
}
.fc-button-primary.fc-today-button{
	background-color: rgb(82, 227, 210);
	border-color: rgb(82, 227, 210);
}
span{
	font-size: 0.8em;
}
.tippy-box[data-theme~='sea'] {
  background-color: #3788d8;
  color: #fff;
} 
.tippy-box[data-theme~='sea'][data-placement^='top'] > .tippy-arrow::before {
  border-top-color: #3788d8;
}
.tippy-box[data-theme~='sea'][data-placement^='bottom'] > .tippy-arrow::before {
  border-bottom-color: #3788d8;
}
.tippy-box[data-theme~='sea'][data-placement^='left'] > .tippy-arrow::before {
  border-left-color: #3788d8;
}
.tippy-box[data-theme~='sea'][data-placement^='right'] > .tippy-arrow::before {
  border-right-color: #3788d8;
}
.colorD span{
	font-size: 1.0em;
}
.color {
    float: left;
    width: 20px;
    height: 20px;
    margin-right: 2px;
    border: 1px solid #d1b347;
}  
.myWork{
	background: #ffeca8;
}
</style>   
<div class="colorD mb-1 mt-1 ">
	<div class="color myWork"></div>
	<span> 내 일감 &ensp;</span>
</div>
<div id='calendar-container' class="mt-3">  
	<div id='calendar'></div> 
</div>  

<script> 
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
	   	height: '830px', // calendar 높이 설정
	   	expandRows: true, // 화면에 맞게 높이 재설정
	//     	slotMinTime: '08:00', // Day 캘린더에서 시작 시간
	//     	slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
		headerToolbar: { 
			left: 'today dayGridMonth listWeek',	 
			center: 'title',  
			right: 'prev next'   
		},
		initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		editable: false, // 수정 가능?
		selectable: true, // 달력 일자 드래그 설정가능
		nowIndicator: true, // 현재 시간 마크
		dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		locale: 'ko', // 한국어 설정
		// 이벤트
    	eventSources: [{
		events: function(info, successCallback, failureCallback) {
			$.ajax({
				method : 'post',
				dataType: 'json',
				success: function(data) {
					successCallback(data);
				}
			}); 
		}
	}],
		eventDidMount: function(info) { 
    	     tippy(info.el, {   
             content: info.event.extendedProps.description,
             allowHTML: true,
//              placement: 'auto-start',
             arrow : true, 
             duration: 0, 
             followCursor : 'horizontal',
             theme: 'sea'
          });    
	    },
		
    });  
    calendar.render(); 

    calendar.on('eventClick', function(info) {  
		  console.log(info.event.url); 
	});
    
});  

var color = null;
	$("body").on("mouseover", ".fc-h-event", function(){
		color = $(this).css("background-color");
		$(this).css("background-color", "#fff");
	}); 
	$("body").on("mouseout", ".fc-h-event", function(){
		$(this).css("background-color", color); 
	});
</script> 


