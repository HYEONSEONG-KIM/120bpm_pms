<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>roleView</title>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style type="text/css">
#bigD {
	width: 97%;
	background: #fcfcfc;
	display: grid;
	grid-template-columns : 1fr 1fr;
	margin: 2%;
	text-align: center;
	padding-top: 5px;
}
#authInfo{
	width: 97%;
	background: #fcfcfc;
	margin: 2%;
	padding-top: 5px;
}

.roleInfo {
	width: 80%%;
	margin: 20px;
	float: left;
	box-shadow: 1px 2px 3px 1px #d5d7db;
	padding: 0 10px;
	border-radius: 20px;
}

.roleInfo span{
	font-size: 20px;
}
.ok{
	font-weight: bold;
	color: black;
	font-size: 15px;
}
.no{
	color: lightgray;
	font-size: 15px;
}
.modalSpan{
	font-size: 15px;
}
table td{
	vertical-align: middle;
}
td span {
    line-height: 2.5;
}

table h3{
	text-shadow: 4px 4px 4px 4px gray;
}
#modifyAuth, #deleteRole{
	font-size: 30px;
	margin: 25px 10px;
}
.modal-xl {
    max-width: 80%;
}
.updateBtn{
	float: right;
	margin-top: 1.7%;
}

.form-check-input {
margin-right: 5px;
    position: absolute;
    margin-top: 0.8rem;
    margin-left: -1.6rem;
}
.form-check {
    position: relative;
    display: block;
    padding-left: 1.25rem;
    margin-top: 14px;
    
}
.form-check-label {
	margin-bottom: 1.2rem;
}
.deleteBtn{
	border-radius: 5px;
}
</style>
</head>
<body>
<div id = 'bigD'>
		<div class="roleInfo" data-auth="${role.author}">
			<c:if test="${not empty role.authorNm }">
				
				<h3>${role.authorNm}</h3>
			</c:if>
		
			<hr>
			<br>

			<c:if test="${not empty role.authorDc }">
				<h4>${role.authorDc}</h4>
			</c:if>
			<c:if test="${not empty role.authorCreatde}">
				<span>등록일 &nbsp:&nbsp ${role.authorCreatde}
					&nbsp&nbsp|&nbsp&nbsp </span>

			</c:if>

			<c:if test="${not empty role.projectCnt}">
				<span>프로젝트 수 &nbsp:&nbsp ${role.projectCnt}</span>
				<br>
			</c:if>
			<br>
			<hr>
			
		</div>

		<div id = "chart">
	</div>
</div>

<div id = "authInfo">

<form id="authForm" action="${cPath }/admin/role/updateRole" method="post">
       	<input type="hidden" value="${role.author}" name = "author">
		       	<table class = "table">
			<c:forEach items="${resourceList }" var="resource" varStatus="vs">
					
						<c:if test="${resource.level le 2 }">
						<c:if test="${not vs.first}">
							</tr>
						</c:if>
						<tr>
						<th>
							<c:if test="${vs.count ge 2 }"></div></c:if>
							<div class="row m-3">
							<span class="ok">${resource.resrceDc }</span>
						</th>
						</c:if>
					
					
							<c:if test="${resource.level ge 3 }">
							<td>
						<div class="form-check col">
						<sapn class = "modalSpan">
							<label class="form-check-label" title="${resource.resrcePttrn }" data-bs-toggle="tooltip" data-bs-placement="top">
								<input name="resrceCode" id="${resource.resrceCode }" class="form-check-input" type="checkbox" style="width:15px;height:15px;" value="${resource.resrceCode }" 
									${not empty role.author and fn:contains(resource.authorities, role.author)?"checked":"" }
								>
						    	${resource.resrceDc }
						  </label>
						  </sapn>
							</div>
						</td>
							  </c:if>
					<c:if test="${ vs.last }"></tr></c:if>
				
			</c:forEach>
			</table>
      </form>

	<button type="button" class="updateBtn btn-lg" id = "save">Save</button>
<!-- 	<table class = "table"> -->
<%-- 	<c:forEach items="${resourceList }" var="resource" varStatus="vs"> --%>
			
<%-- 				<c:if test="${resource.level le 2 }"> --%>
<%-- 				<c:if test="${not vs.first}"> --%>
<!-- 					</tr> -->
<%-- 				</c:if> --%>
<!-- 				<tr> -->
<!-- 				<th> -->
<%-- 					<c:if test="${vs.count ge 2 }"></div></c:if> --%>
<!-- 					<div class="row m-3"> -->
<%-- 					<h5>${resource.resrceDc }</h5> --%>
<!-- 				</th> -->
<%-- 				</c:if> --%>
			
			
<%-- 					<c:if test="${resource.level ge 3 }"> --%>
<!-- 					<td> -->
<!-- 				<div class="form-check col"> -->
<%-- 					  <label class="form-check-label" title="${resource.resrcePttrn }" data-bs-toggle="tooltip" data-bs-placement="top"> --%>
<%-- 				    	<c:choose> --%>
<%-- 					    	<c:when test="${not empty role.author and fn:contains(resource.authorities, role.author)}"> --%>
<%-- 						    	<span class = "ok">${resource.resrceDc }</span> --%>
<%-- 						    </c:when> --%>
<%-- 						    <c:otherwise> --%>
<%-- 						    	<span class = "no">${resource.resrceDc }</span> --%>
<%-- 						    </c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 					  </label> -->
<!-- 				</div> -->
<!-- 				</td> -->
<%-- 					  </c:if> --%>
<%-- 			<c:if test="${ vs.last }"></tr></c:if> --%>
		
<%-- 	</c:forEach> --%>
<!-- 	</table> -->
<!-- 		<input type = "button" class="updateBtn float-right" data-bs-toggle="modal" -->
<!-- 			data-bs-target="#staticBackdrop" id="modifyAuth" value="권한수정"> -->
		<c:if test="${role.projectCnt eq 0}">
			<input type = "button" class = "deleteBtn float-right" value = "역할 삭제" data-auth="${role.author}"
			id = "deleteRole"/>
		</c:if>	
	</div>



<!-- Modal -->
<!-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"> -->
<!--   <div class="modal-dialog modal-xl"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<%--         <h3 class="modal-title" id="staticBackdropLabel">${role.authorNm}권한 수정</h3> --%>
<!--         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<%--        <form id="authForm" action="${cPath }/admin/role/updateRole" method="post"> --%>
<%--        	<input type="hidden" value="${role.author}" name = "author"> --%>
<!-- 		       	<table class = "table"> -->
<%-- 			<c:forEach items="${resourceList }" var="resource" varStatus="vs"> --%>
					
<%-- 						<c:if test="${resource.level le 2 }"> --%>
<%-- 						<c:if test="${not vs.first}"> --%>
<!-- 							</tr> -->
<%-- 						</c:if> --%>
<!-- 						<tr> -->
<!-- 						<th> -->
<%-- 							<c:if test="${vs.count ge 2 }"></div></c:if> --%>
<!-- 							<div class="row m-3"> -->
<%-- 							<span class="ok">${resource.resrceDc }</span> --%>
<!-- 						</th> -->
<%-- 						</c:if> --%>
					
					
<%-- 							<c:if test="${resource.level ge 3 }"> --%>
<!-- 							<td> -->
<!-- 						<div class="form-check col"> -->
<!-- 						<sapn class = "modalSpan"> -->
<%-- 							<label class="form-check-label" title="${resource.resrcePttrn }" data-bs-toggle="tooltip" data-bs-placement="top"> --%>
<%-- 								<input name="resrceCode" id="${resource.resrceCode }" class="form-check-input" type="checkbox" style="width:15px;height:15px;" value="${resource.resrceCode }"  --%>
<%-- 									${not empty role.author and fn:contains(resource.authorities, role.author)?"checked":"" } --%>
<!-- 								> -->
<%-- 						    	${resource.resrceDc } --%>
<!-- 						  </label> -->
<!-- 						  </sapn> -->
<!-- 							</div> -->
<!-- 						</td> -->
<%-- 							  </c:if> --%>
<%-- 					<c:if test="${ vs.last }"></tr></c:if> --%>
				
<%-- 			</c:forEach> --%>
<!-- 			</table> -->
<!--       </form>  -->
<!--       </div> -->
      
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="gobackBtn btn-lg" data-bs-dismiss="modal" id = "closeModal">Close</button> -->
<!-- <!--         <button type="button" class="updateBtn btn-lg" id = "save">Save</button> --> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
</body>

<script type="text/javascript">
var options = {
        series: [{
          name: "Desktops",
          data: ${monthList},
      }],
        chart: {
        height: 280,
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
        text: ' 월별 ${role.authorNm}의 프로젝트 등록 카운트 현황',
        align: 'center',
        style: {
            fontSize:  '30px',
            fontWeight:  'bold',
            fontFamily:  undefined,
            color:  '#263238'
          },
      },
      grid: {
        row: {
          colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
          opacity: 0.5
        },
      },
      xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
      }
      };

      var chart = new ApexCharts(document.querySelector("#chart"), options);
      chart.render();
      
      $(function(){
    	  $('#modifyAuth').on('click',function(){
	    	  $('#staticBackdrop').modal('show');
    	  })
    	  
    	  $('#closeModal').on('click',function(){
	    	  $('#staticBackdrop').modal('hide');
    	  })
    	  
    	  $('#save').on('click',function(){
    		  $('#authForm').submit();
    	  })
    	  
    	  $('#deleteRole').on('click',function(){
    		  let authCode = $(this).data('auth');
    		  let url = "${cPath}/admin/role/deleteRole/" + authCode;
    		  
    		  Swal.fire({
    			  title: '해당 역할을 삭제하시겠습니까?',
    			  icon: 'warning',
    			  showCancelButton: true,
    			  confirmButtonColor: '#3085d6',
    			  cancelButtonColor: '#d33',
    			  confirmButtonText: '삭제',
    				cancelButtonText: '취소'
    			}).then((result) => {
    			  if (result.isConfirmed) {
    				   $.ajax({
    						url : url,
    						dataType : "json",
    						success : function(resp) {
    							console.log(resp)
    							if(resp == 'OK'){
    								Swal.fire({
        									title: '삭제완료',
        						    		icon: 'success'
    								}).then(function(){
	    								location.href = "${cPath}/admin/role/list";								
    								});
    							}else if(resp == 'FAIL'){
    								Swal.fire({
        									title: '삭제 실패',
        						    		icon: 'error'
    								});
    							}else if(resp == 'DELETEIMPOSSIBLE'){
    								Swal.fire({
    									title: '실패',
    									text : '해당 역할이 사용중 이므로 삭제 불가합니다',
    						    		icon: 'error'
    								});
    							}
    				    			  
    						},
    						error : function(errorResp) {

    						}

    					}); 
    			  }
    			})
    		  
    		
    		  
    	  })
      })
</script>
</html>