<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" 
integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style type="text/css">
	#topPar{
		width: 95%;
		background: #fcfcfc;
		display: grid;
		grid-template-columns : 1.3fr 2fr;
		margin: 2%;
		text-align: center;
	}
	#categoryCnt{
		padding-top: 2rem;
	}
	
	#midPar{
		width: 95%;
		background: #fcfcfc;
		display: grid;
		grid-template-columns : 1fr 1fr 1fr 1fr 1fr;
		margin: 2%;
		text-align: center;
	}
	.categoryInfo,.categoryAdd{
		width: 80%;
		margin: 20px;
		float: left;
		box-shadow: 1px 2px 3px 1px #d5d7db;
		padding: 0 10px;
		border-radius: 20px;
		height: 220px;
	}
	.categoryAdd img{
		width : 55px;
	 	border-radius: 50%;
		margin-top: 4.5rem;
		box-shadow: 3px 2px 2px grey;
	}
	
	i:hover, .categoryAdd:hover{
		cursor: pointer;
		box-shadow: 3px 2px 2px grey;
	}
	.prgstext{
		font-size: 15px;
		font-weight: bold;
		margin: 5px;
	}
	.progress {
	    margin-top: 15px;
    }
    .wokrCnt{
    	font-size: 13px;
    	
    }
    i{
    	font-size: 15px;
    	margin-left: 2px;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/additional-methods.min.js"></script>

	<div id = "topPar">
		<div id = "categoryCnt">
		</div>
	
		<div id = "categoryState">
		</div>
	</div>
	
	<div id = "midPar">
			<c:forEach items="${categoryList }" var="category">
				
				<div class = "categoryInfo">
					<hr>
					<h4 title = "${category.ctgryNm }">${fn:length(category.ctgryNm) > 5? fn:substring(category.ctgryNm,0,4)+= '..' : category.ctgryNm }<i class="fas fa-edit modifyNm commonPop" data-command = "modify" data-code = "${category.ctgryCode}"></i></h4>
			
			<hr>
					<span class = "wokrCnt">등록된 일감 수 : ${category.workCnt}</span><br>
					<hr>
					<span class = "prgstext">평균 진척도</span>
					<div class="progress">
 						<div class="progress-bar progress-bar-striped progress-bar-animated" 
 						role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" data-avg = "${category.prgsAvg}" 
 						style=
 						"width: ${category.prgsAvg ne 0?category.prgsAvg : '100'}%; 
 						background-color : ${category.prgsAvg eq 0?'#F5F5F5' : ''};
 						color : ${category.prgsAvg eq 0?'black' : ''}
 						"
 						>${category.prgsAvg ne 0? category.prgsAvg : '0'}%</div>
					</div>
				</div>
			</c:forEach>
			<div  class = 'categoryAdd commonPop' id = "addCategory" data-command = "create">
					 <img alt="추가" src="${cPath }/resources/imgs/img/plusbutton.png">
			</div>
	</div>
	
<!--  카테고리 추가 레이어 팝업 -->	
<form id="addCategoryForm" > 
	<div id="popUp" class="popCmmn">
	  <div class="popBg" data-num="11"></div> 
		<div class="popOuterBox">         
		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >✖</button>
		  <div class="popInnerBox">  
		    <div class="popHead">카테고리 이름 설정</div>  
		    <div class="popBody">  
		    	<span>카테고리의 이름을 입력하세요(중복불가)</span><br> 
		    	<input  type="text" name="ctgryNm" class="holderInput inputPass" placeholder="카테고리 이름" required>
		    	<input type = "hidden" name = "command" id = "commandHidden">
		    </div>   
		    <div class="popFoot">    
		      <input type = "button" id="submitBtn"  class="checkBtn btn btbtn" value = "확인"> 
		    </div>  
		  </div>     
	  </div>
	</div>  
</form>
	

<script>
	
	$(function(){
		function checkCategoryCnt(){
			let categoryInfo = $('.categoryInfo');
			let cnt = 0;
			$(categoryInfo).each(function(){
				cnt++;
			})
			console.log(cnt);
			if(cnt >= 10){
				$('.categoryAdd').remove();
			}
			
		}

		checkCategoryCnt();
		
	})
	
	
	let addCategoryForm = $('#addCategoryForm');
	
	let validateOptions = {};
	
	validateOptions.rules={
			ctgryNm:{
 				remote : "${cPath}/project/${pCode}/modify/category/duplcheck"
			}
		}
		validateOptions.messages={
			ctgryNm:{
				remote:"이미 존재하는 이름입니다",
				required : "필수 입력 값 입니다"
			}
		}
	let validated = addCategoryForm.validate(validateOptions);
	
	$('#submitBtn').on('click',function(){
		addCategoryForm.submit();
	})
	
	addCategoryForm.ajaxForm({
		url : '${cPath}/project/${pCode}/modify/category/create',
		dataType : 'json',
		success : function(res){
			if(res == 'CREATEOK'){
				Swal.fire({
					title: '등록 완료 되었습니다',
			    	icon: 'success'
				}).then(function(){
						location.href = "${cPath}/project/${pCode}/modify/category";								
				});
			}else if(res == 'MODIFYOK'){
				Swal.fire({
					title: '수정 되었습니다',
			    	icon: 'success'
				}).then(function(){
						location.href = "${cPath}/project/${pCode}/modify/category";								
				});
			}else if(res == 'FAIL'){
				Swal.fire({
					title: '실패...',
			    	icon: 'error'
				})
			}else if(res == 'PARAMOMISSION'){
				Swal.fire({
					title: '이름을 입력하여 주세요',
			    	icon: 'info'
				})
			}
		}
	})
	
	function setPop() {
		var popOpenBtn = $('.popOpenBtnCmmn');

		//팝업 열기
		$('.commonPop').on('click',function(event) {
			console.log(event);
			let command = $(this).data('command');
			let memId = $(this).data('id');
			let code = $(this).data('code');
			if(code != null){
				command = command + "," + code
			}
			
			let commandHidden = $('#commandHidden');
			commandHidden.empty();
			commandHidden.val(command);
			 $('#popUp').fadeIn(200);
		});

		//팝업 닫기   
		$('.popBg, .popCloseBtnCmmn').on('click', function() {
			 $('#popUp').fadeOut(200);
		});
	}
	setPop();

	var categoryCntOptions = {
        series: ${categoryCnt},
        chart: {
        width: 430,
        type: 'pie',
      },
      labels: ${category},
      fill: {
          type: 'gradient',
        },
      responsive: [{
        breakpoint: 480,
        options: {
          chart: {
            width: 200
          },
          legend: {
            position: 'bottom'
          }
        }
      }], title: {
          text: '카테고리별 일감 등록 비율',
          align: 'left',   
          margin: 20,
          offsetX: 30,
          offsetY: 0,
          style: {
              fontSize:  '20px',
              fontWeight:  'bold',
              fontFamily:  undefined,
              color:  '#9699a2'
            },
        }

      };

      var categoryCntChart = new ApexCharts(document.querySelector("#categoryCnt"), categoryCntOptions);
      categoryCntChart.render();

var categoryStateOptions = {
        series: [{
        name: '완료',
        data: ${complate}
      }, {
        name: '진행',
        data: ${proceeding}
      }, {
        name: '신규',
        data: ${newWork}
      }],
        chart: {
        type: 'bar',
        height: 350,
        stacked: true,
        stackType: '100%'
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
      
      xaxis: {
        categories: ${category},
      },
      
      fill: {
    	  type: 'gradient',
        opacity: 1
      },
      legend: {
        position: 'right',
        offsetX: 0,
        offsetY: 50
      },title: {
          text: '일감상태에 따른 현황',
          align: 'center',   
          margin: 10,
          offsetX: 30,
          offsetY: 0,
          style: {
              fontSize:  '23px',
              fontWeight:  'bold',
              fontFamily:  undefined,
              color:  '#9699a2'
            },
        }

      };

      var categoryStateChart = new ApexCharts(document.querySelector("#categoryState"), categoryStateOptions);
      categoryStateChart.render();

</script>