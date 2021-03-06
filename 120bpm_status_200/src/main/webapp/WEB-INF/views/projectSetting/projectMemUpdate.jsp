<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" 
integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style type="text/css">
	#par{
		width: 95%;
		background: #fcfcfc;
		display: grid;
		grid-template-columns : 1fr 1fr 1fr;
		margin: 2%;
		text-align: center;
	}
	#activityAvg{
		width: 95%;
		background: #fcfcfc;
		margin: 2%;
		text-align: center;
	}
	.memRoleInfo, .memRoleAdd{
		width: 80%;
		margin: 20px;
		float: left;
		box-shadow: 1px 2px 3px 1px #d5d7db;
		padding: 0 10px;
		border-radius: 20px;
		height: 200px;
	}
	.memRoleInfo span{
		font-size: 14px;
	}
	.memRoleAdd img{
		width : 55px;
	 	border-radius: 50%;
		margin-top: 4.5rem;
		box-shadow: 3px 2px 2px grey;
	}
	.memRoleInfo:hover, .memRoleAdd:hover{
		cursor: pointer;
		box-shadow: 3px 2px 2px grey;
		
	}
	.deletePrtMem{
		float: right;
		margin-right : 10px;
		margin-bottom : 10px;
		font-size: 25px;
		color: #e667a4;
		
	}
	#memPar{
		width: 97%;
		background: #fcfcfc;
		display: grid;
		grid-template-columns : 1fr 1fr 1fr 1fr;
		margin: 2%;
		text-align: center;
		padding-top: 5px;
		border-radius: 15px;
	}
	.memInfo{
		width: 80%;
		font-size: 20px;
		font-weight : bold;
		text-align: left;
		margin: 20px;
	}
	#modalMemPar{
		width: 97%;
		display: grid;
		grid-template-columns : 1fr 1.3fr;
		margin: 2%;
		text-align: center;
		padding-top: 5px;
	}
	#memDetailInfo{
		border : 2px solid lightgray;
		overflow: auto;
		margin-top: 2%;
		height: 600px;
	}
	#memArea{
		display: grid;
		grid-template-rows : 2fr 0.3fr 0.5fr
	}
	#detailArea{
		display: grid;
		grid-template-rows : 0.1fr 1fr;
		margin: 2%;
	}
	#detailArea select{
		float : left;
		height: 20px;
		width: 50%;
	}
	
	#searchUI{
		justify-content: flex-start;
		margin: 2%;
	}
	.insertBtn{
		float: right;
		font-size: 20px;
	}
	#detailWord{
		height: 38px;
	}
	#searchBtn{
		margin-left: 5px;
		margin-top: -20px;
	}
	table th {
		background: #F0F9FC;
	}
	#selectMem{
		width: 55px;
		border-color: lightGray;
		background: lightGray;
		margin-right: 2%;
	}
	.modifyRole{
		font-size: 15px;
		margin-left: 3px;
	}
	.modifyRole:hover{
		text-shadow: 1px 1px 1px grey;
	}
	#topPar{
		display: grid;
		grid-template-columns : 0.5fr 0.1fr 1fr;
		margin: 2%;
		text-align: center;
		width: 95%;
		background: #ffffff;
	}
	#memImg{
		width: 150px;
		height: 150px;
		margin-top: 20px;
	}
	#basicInfo th{
		width: 100px;
		font-size: 15px;
		text-align: left;
		height: 30px;
	}

	#basicInfo td{
		text-align: left;
		font-size: 15px;
	}
	#selectMem{
		float: right;
		width: 60px;
		margin: 3%;
	}
	
	#projectInfo{
		margin-top: 6%; 
	}
</style>

	<security:authentication property="principal.adaptee" var="authMember"/>
	<security:authentication property="authorities" var="authMemRoles"/>
	
	<div id = "activityAvg">
		
	</div>
	
	<div id = "par">
	
		<c:forEach items="${prtMemList}" var="prtMem">
		
		<c:if test="${authMember.memId ne prtMem.memId}">
				<div class = 'memRoleInfo' data-auth = '${prtMem.author}' data-id = '${prtMem.memId }'>
						<c:if test="${not empty prtMem.memName }">
								<h3>  ${prtMem.memName}</h3>
						</c:if>
						<hr>
									
						<c:if test="${not empty prtMem.authorNm}">
								<h5>${prtMem.authorNm}(${prtMem.authorDc})<i class="fas fa-edit modifyRole" data-id = '${prtMem.memId}'></i></h5>
						</c:if>
						
						<c:if test="${not empty prtMem.createde}">
								<span>????????? &nbsp:&nbsp ${prtMem.createde}</span>
			
						</c:if>
							<br>
						<hr>
							<i type = "button" value = "-"  class = "fas fa-minus-circle deletePrtMem" data-id = "${prtMem.memId}" ></i>
				</div>
			</c:if>
		</c:forEach>
			<div  class = 'memRoleAdd' id = "addMem">
					 <img alt="??????" src="${cPath }/resources/imgs/img/plusbutton.png">
			</div>
	</div>
	
<!-- ????????? ?????? Modal -->	
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="staticBackdropLabel"></h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      
      	<h3 style="text-align: center;">????????? ??????</h3>
      	
	   
      	
      	<div id = "modalMemPar">
      	<div id = "memArea">
		      	<div id = "memPar">
		      		<c:set value="${paging.dataList}" var="prtMemList"/>
		      		<c:forEach items="${prtMemList}" var="prtMem">
						<span class = "memInfo" id = "member" data-id = '${prtMem.memId}' data-name = '${prtMem.memName}'>${prtMem.memName}</span>
		      		</c:forEach>
		      	</div>
		      	
		      <div id="searchUI" class="row">
				<div>
					<div class="searchUIInput">
						<input type="text" name = "detailWord" id = "detailWord" placeholder="??????,ID,Email??? ??????"/>
					</div> 
				</div>
				<div class="searchUIBtn">
						<button type="button" id="searchBtn" class="btnTags btn searchBtn">??????</button>
				</div>
			</div>
	      	
	      	<div id = "pagingArea">
	      		${paging.pagingHTMLBS }
	      	</div>
      	</div>
      	
      	<div id = "detailArea">
      		<div>
      			<select id = "selectAuthor" class="form-select" style = "height: 35px;">
		      		<option value>?????? ??????</option>
		      		<c:forEach items="${roleList}" var="role">
		      			<option value="${role.author}">${role.authorNm}(${role.authorDc})</option>
		      		</c:forEach>
		      	</select>
      		</div>
	      	<div id = "memDetailInfo">
	      	
				      		  		<div id = "topPar">
					<div class = "topChild">
						<img id = "memImg" src="${cPath}/resources/imgs/member/noimg.jpg">
					</div>
					
					<div></div>
					
					<div class = "topChild">
						
						<hr>
						<table id = "basicInfo">
							<tr>
								<th>??????</th>
								<td></td>
							</tr>
							<tr>
								<th>?????????</th>
								<td></td>
							</tr>
							
							<tr>
								<th>?????????</th>
								<td></td>
							</tr>
							
							<tr>
								<th>??????</th>
								<td></td>
							</tr>
						</table>
						<hr>
					</div>
				</div>
				
				<div id = "bottomPar">
					<h4>????????????</h4>
					<table class = 'table' id = "careerInfo">
					<tr>
						<th>???????????????</th>
						<th>????????????</th>
						<th>??????</th>
						<th>????????????</th>
					</tr>
							
							
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
						</tr>
					
					</table>
				</div>
				<hr>
				<div id = "projectInfo">
					<h4>???????????? ??????</h4>
					<table class = 'table'>
						<tr>
							<th>???????????????</th>
							<th>????????????</th>
							<th>????????????</th>
							<th>??????</th>
						</tr>
					
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
						</tr>
					
					</table>
				</div>
	      	</div>
	     </div>
      	</div>
		     <input type = 'button' id = "selectMem" class = "insertBtn" value = "??????"   disabled>
      	
      
      	<!-- ?????? ?????? ?????? form -->
      	<form id = "searchForm">
      		<input type = "hidden" name = "page"/>
      		<input type = "hidden" name = "detailWord"/>
      	</form>
      	
      	<!-- ????????? ?????? form -->
      	<form>
      		<input type = "hidden" name = "author" id = "author"/>
      		<input type = "hidden" name = "memId" id = "selectMemId"/>
      	</form>
      	
      	
      </div>
      
      <div class="modal-footer">
        <button type="button" class="gobackBtn btn-lg" data-bs-dismiss="modal" id = "closeModalAddMem">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- ?????? ???????????? modal -->
<div class="modal fade" id="prtMemDetail" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="staticBackdropLabel"></h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="prtMem">
      
      </div>
      
      <div class="modal-footer">
        <button type="button" class="gobackBtn btn-lg" data-bs-dismiss="modal" id = "closeModalDetailMem">Close</button>
      </div>
    </div>
  </div>
</div>




<!-- ?????? ????????? ?????? ?????? -->
<form id="passCheckForm" action="${cPath}/mypage/accountCheck" method="post"> 
	<div id="popUp" class="popCmmn">
	  <div class="popBg" data-num="11"></div> 
		<div class="popOuterBox">         
		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >???</button>
		  <div class="popInnerBox">  
		    <div class="popHead">???????????? ????????? ??????</div>  
		    <div class="popBody">  
		    	<span>??????????????? ?????? ???????????? ???????????????.</span><br> 
		    	<input  type="password" name="memberPass" class="holderInput inputPass" placeholder="???????????? ??????" required>
		    	<input type = "hidden" id = "hiddenMemId_delMem">
		    	<div><input class ="showPass" type="checkbox" >???????????? ??????</div>
		    </div>   
		    <div class="popFoot">    
		      <input type = "submit" id="submitBtn"  class="checkBtn btn btbtn" value = "??????"> 
		    </div>  
		  </div>     
	  </div>
	</div>  
</form> 


<!--  ?????? ?????? ?????? pop -->
<form id="modifyRoleForm" action="${cPath}/project/${pCode}/modify/mem/role"> 
	<div id="modifyRolePopUp" class="popCmmn">
	  <div class="popBg" data-num="11"></div> 
		<div class="popOuterBox">         
		<button  class="popCloseBtnCmmn btn" data-num="11" type="button" >???</button>
		  <div class="popInnerBox">  
		    <div class="popHead">?????? ??????</div>  
		    <div class="popBody">  
		    	<span>????????? ????????? ???????????????</span><br> 
		    	<select id = "selectModifyRole" name = "author" class="form-select" style = "height: 35px; width: 280px;margin-top: 10px;">
		      		<option value>?????? ??????</option>
		      		<c:forEach items="${roleList}" var="role">
		      			<option value="${role.author}">${role.authorNm}(${role.authorDc})</option>
		      		</c:forEach>
		      	</select>
		      		<input type = "hidden" name = "memId" id = "hiddenMemId_modifyRole">
		    </div>   
		    <div class="popFoot">    
		      <input type = "button" id="modifyRoleBtn"  class="checkBtn btn btbtn" value = "??????"> 
		    </div>  
		  </div>     
	  </div>
	</div>  
</form>  


<script>
	$(function(){
		
		$(document).ajaxComplete(function(event, xhr, options){
			searchForm.find("[name='page']").val("");
		}).ajaxError(function(event, xhr, options, error){
			console.log(event);
			console.log(xhr);
			console.log(options);
			console.log(error);
		});
		
		

		let prtMemDetail = $('#prtMemDetail').modal({
			show:false
		}).on('show.bs.modal',function(event){
			let info = event.relatedTarget;
		
	 		let memId = $(info).data('id');
	 		let url = "${cPath}/project/${pCode}/modify/memDetail/" + memId;
		
			
			$.ajax({
				url : url,
				dataType : "html",
				success : function(resp) {
					$('.prtMem').empty();
					$('.prtMem').html(resp);
				},
				error : function(errorResp) {

				}

			});
		});
		

		$('.memRoleInfo').on('click',function(){
			prtMemDetail.modal('show',this)
		})
		
		$('#closeModalDetailMem').on('click',function(){
			prtMemDetail.modal('hide');
		})
		
		
	})

	
	let staticBackdrop = $('#staticBackdrop');
	let memList = $('#memPar');
	let pagingArea = $('#pagingArea');
	
	$('#addMem').on('click',function(){
		staticBackdrop.modal('show');	
	})
	
	let searchForm = $('#searchForm').paging().ajaxForm({
		dataType : 'json',
		success : function(res){
			memList.empty();
			pagingArea.empty();
			
			let dataList = res.dataList;
			
			let span = [];
			
			$(dataList).each(function(idx,value){
				let memNm = value.memLnm + value.memFnm;
				span.push($('<sapn>').attr({
					'class' : 'memInfo', 'data-id' : value.memId,
					'data-name' : memNm
				}).text(memNm))
			})
			
			memList.html(span);
			pagingArea.html(res.pagingHTMLBS);
		}
	})
	
	let memDetailInfo = $('#memDetailInfo');
	
	let clickMem;
	
	$('#memPar').on('click','.memInfo',function(){
		
		if(clickMem != null){
			clickMem.css('color', 'black');
			clickMem = null;
		}
		clickMem = $(this);
		clickMem.css('color', 'blue');
		
		let memId = $(this).data('id');
		$('#selectMem').attr({
			'data-id': memId,
			'disabled' : false
			}).css({
			'background': '#69C7F0',
			'border-color' : '#69C7F0'})
		
 		let url = "${cPath}/proejct/0/detail/prtForm/" + memId;
	 		$.ajax({
				url : url,
				dataType : "html",
				success : function(resp) {
					memDetailInfo.empty();
					memDetailInfo.html(resp)
					
				},
				error : function(errorResp) {

				}
			});
	}).css('cursor', 'pointer');
	
	$('#selectMem').on('click', function(){
		let selectAuthor = $('#selectAuthor').val();
		let memId = $(this).data('id');
		let url = "${cPath}/project/${pCode}/modify/addMem";
		let data = {
				memId : memId,
				author : selectAuthor
		}
		
		if(selectAuthor.length == 0){
			Swal.fire({
				title: '????????? ???????????? ?????????',
	    		icon: 'error'
			})
		}else{
			$.ajax({
				url : url,
				data : data,
				method : "post",
				dataType : "json",
				success : function(resp) {
				
					
					if(resp == 'OK'){
						Swal.fire({
								title: '?????? ???????????????',
					    		icon: 'success'
						}).then(function(){
 							location.href = "${cPath}/project/${pCode}/modify/mem";								
						});
					}else if(resp == 'FAIL'){
						Swal.fire({
								title: '?????? ??????',
					    		icon: 'error'
						});
					}
				},
				error : function(errorResp) {

				}

			});
			
		}
	});
	

	
	$('#closeModalAddMem').on('click',function(){
		staticBackdrop.modal('hide');
	});
	

	
	
	//???????????? ??????
	$(".showPass").click(function(){
		if($(this).is(':checked')){
			$(".inputPass").attr('type', 'text');
		}else{ 
			$(".inputPass").attr('type', 'password');
		}
	});
	
	
	$("#passCheckForm").ajaxForm({
		
		dataType : 'text', 
		success : function(result){ 
			if(result=='OK'){   
				let memId = $('#hiddenMemId_delMem').val();
		 		let url = "${cPath}/project/${pCode}/modify/delMem/" + memId;
				
				$.ajax({
					url : url,
					dataType : "json",
					success : function(resp) {
						if(resp == 'OK'){
							 Swal.fire({
						    	   title: '???????????? ?????? ???????????????',
						    	   icon: 'success',
						    	   confirmButtonText: '??????'
						    	 }).then(function(){
 							    	 location.href = "${cPath}/project/${pCode}/modify/mem";
						    	 })
						}else{
							Swal.fire({
						    	   title: '????????? ?????????????????????..????????? ?????? ????????? ?????????',
						    	   icon: 'error',
						    	   confirmButtonText: '??????'
						    	 })
							
						}
					},
					error : function(errorResp) {
						 
					}

				});
			}else if(result=='FAIL'){
				 Swal.fire({
			    	   title: '???????????? ??????',
			    	   icon: 'error',
			    	   confirmButtonText: '??????'
			    	 })
			}    
		}     
	}); 
	
	//?????? ?????? ?????? ?????? ?????????
	$('#modifyRoleBtn').on('click',function(){
		let selectModifyRole = $('#selectModifyRole').val();
		if(selectModifyRole.length == 0){
			Swal.fire({
		    	   title: '????????? ???????????????',
		    	   icon: 'info',
		    	   confirmButtonText: '??????'
		    	 })
		    return false;
		}else{
			modifyRoleForm.submit();
		}
	})
	
	
	// ?????? ?????? ????????? ??????
	let modifyRoleForm = $('#modifyRoleForm').ajaxForm({
		dataType : 'json',
		success : function(res){
			if(res == 'OK'){
				 Swal.fire({
			    	   title: '????????? ?????????????????????',
			    	   icon: 'success',
			    	   confirmButtonText: '??????'
			    	 }).then(function(){
				    	 location.href = "${cPath}/project/${pCode}/modify/mem";
			    	 })
			}else{
				Swal.fire({
			    	   title: '????????? ?????????????????????..????????? ?????? ????????? ?????????',
			    	   icon: 'error',
			    	   confirmButtonText: '??????'
			    	 })
				
			}
			
		}
	})
 	
	function setPop() {
		var popOpenBtn = $('.popOpenBtnCmmn');

		// ?????? ????????? ?????? ??????
		$('.modifyRole').on('click',function(event) {
			event.stopPropagation();
			let memId = $(this).data('id');
			$('#hiddenMemId_modifyRole').val(memId);
			 $('#modifyRolePopUp').fadeIn(200);
		});
		
		//?????? ??????   
		$('.popBg, .popCloseBtnCmmn').on('click', function() {
			 $('#popUp').fadeOut(200);
			 $('#modifyRolePopUp').fadeOut(200);
		});
	}
	setPop();
	
	//????????? ???????????? ?????? ?????? ??????
	$('.deletePrtMem').on('click',function(event) {
		event.stopPropagation();
		let memId = $(this).data('id');
		 let url = "${cPath}/project/${pCode}/modify/delMem/" + memId;
		 
		  Swal.fire({
			  title: '?????? ???????????? ?????? ???????????????????',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '??????',
			cancelButtonText: '??????'
			}).then((result) => {
				 if (result.isConfirmed) {
					 $.ajax({
							url : url,
							dataType : "json",
							success : function(resp) {
								if(resp == 'OK'){
									 Swal.fire({
								    	   title: '???????????? ?????? ???????????????',
								    	   icon: 'success',
								    	   confirmButtonText: '??????'
								    	 }).then(function(){
									    	 location.href = "${cPath}/project/${pCode}/modify/mem";
								    	 })
								}else{
									Swal.fire({
								    	   title: '????????? ?????????????????????..????????? ?????? ????????? ?????????',
								    	   icon: 'error',
								    	   confirmButtonText: '??????'
								    	 })
									
								}
							},
							error : function(errorResp) {
								 
							}
			
						});
				 }
		})
	});
	
	
	let avgDataArray =  ${activityAvg};
	let memListArray = ${memList};
	if(memListArray.length < 10){
		let idx = 10 - memListArray.length; 
 		for(i = idx; i <= 10; i++){
 			avgDataArray.push(0);
 			memListArray.push('');
 		}
	}
	console.log(avgDataArray);
	console.log(memListArray);
	
	var options = {
	          series: [{
	          name: 'Inflation',
	          data:avgDataArray
	        }],
	          chart: {
	          height: 350,
	          type: 'bar',
	        },
	        plotOptions: {
	          bar: {
	            borderRadius: 10,
	            dataLabels: {
	              position: 'top', // top, center, bottom
	            },
	          }
	        },
	        dataLabels: {
	          enabled: true,
	          formatter: function (val) {
	            return val + "%";
	          },
	          offsetY: -20,
	          style: {
	            fontSize: '12px',
	            colors: ["#304758"]
	          }
	        },
	        
	        xaxis: {
	          categories: memListArray,
	          position: 'top',
	          axisBorder: {
	            show: true
	          },
	          axisTicks: {
	            show: true
	          },
	          crosshairs: {
	            fill: {
	              type: 'gradient',
	              gradient: {
	                colorFrom: '#D8E3F0',
	                colorTo: '#BED1E6',
	                stops: [0, 100],
	                opacityFrom: 0.4,
	                opacityTo: 0.5,
	              }
	            }
	          },
	          tooltip: {
	            enabled: true,
	          }
	        },
	        yaxis: {
	          axisBorder: {
	            show: false
	          },
	          axisTicks: {
	            show: false,
	          },
	          labels: {
	            show: false,
	            formatter: function (val) {
	              return val + "%";
	            }
	          }
	        
	        },
	        title: {
	          text: '????????? ???????????? ????????? (?????????)',
	          offsetY: 0,
	          align: 'center',
	          style: {
	            color: '#9699a2',  
	            fontSize:  '25px'
	          }
	        }
	        };

	        var chart = new ApexCharts(document.querySelector("#activityAvg"), options);
	        chart.render();

	

	
</script>
