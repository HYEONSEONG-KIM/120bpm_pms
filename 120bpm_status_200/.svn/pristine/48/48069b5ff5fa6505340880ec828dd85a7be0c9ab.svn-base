<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<style>
.white{
	background: white;
}
</style>

<link
	href="https://fonts.googleapis.com/css?family=Titillium+Web:400,600,700"
	rel="stylesheet" />
<link rel="stylesheet" href="${cPath }/resources/dashboard/styles.css" />
</head> 

<body>
	<div id="wrapper">
		<div class="content-area">
			<div class="container-fluid">
				<div class="main">
					<div class="row sparkboxes mt-2 mb-4">
						<div class="col-md-4 ">
							<div class="white" id="spark1"></div>
						</div>   
						<div class=" col-md-4">
							<div class="white" id="spark2"></div>
						</div>
						<div class="col-md-4">
							<div class="white" id="spark3"></div>
						</div>  
					</div>
 
					<div class="row mt-3 mb-4">
						<div class="col-md-12">
							<div class="white" id="bar"></div>
						</div> 
					</div>

					<div class="row mt-4 ">
						<div class="col-md-6">
							<div class="white" id="donut"></div>
						</div> 
						<div class="col-md-6">
							<div class="white" id="area"></div>
						</div>
<!-- 						<div class="col-md-6">  -->
<!-- 							<div class="white" id="line"></div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div> 

<script>
	var totalWork = '${work.totalWork}';
	var avgPrgs = '${work.avgPrgs}';
	var donecount = '${work.donecount}';
	var totalIssue = '${issue.totalIssue}';
	var solutIssue = '${issue.solutIssue}';
	 
	var days = []; 
	var counts = []; 
	var dayAvgPrgs = [];
	<c:if test="${not empty arrayList}">
		days = ${arrayList[0]}; 
		counts = ${arrayList[1]};
		dayAvgPrgs = ${arrayList[2]};
	</c:if>
	
	var mems = [];
	var newcnts = [];
	var ingcnts = [];
	var donecnts = [];
	<c:if test="${not empty memArrList}">
		mems = ${memArrList[0]};  
		newcnts = ${memArrList[1]};
		ingcnts = ${memArrList[2]};
		donecnts = ${memArrList[3]};
	</c:if>
	
// 	var totalOcc = null;
	var dayiscnt = [];
	var occAvgs = []; 
	var solAvgs = []; 
	<c:if test="${not empty issueList}">
// 		totalOcc = ${issueList[0]}; 
		dayiscnt = ${issueList[0]};
		occAvgs = ${issueList[1]}; 
		solAvgs = ${issueList[2]};
	</c:if>
	
</script>
<script src="${cPath }/resources/dashboard/data.js"></script>
<script src="${cPath }/resources/dashboard/scripts.js"></script>	
		
		