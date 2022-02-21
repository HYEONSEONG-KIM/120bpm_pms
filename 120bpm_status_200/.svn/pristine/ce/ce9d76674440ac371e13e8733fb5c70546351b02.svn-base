<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${cPath}/resources/css/errorPage.css" rel="styleSheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
	<script type="text/javascript">
       let message = "${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}";
       Swal.fire({
    	   title: '올바른 접근이 아닙니다',
    	   text: message,
    	   icon: 'error',
    	   confirmButtonText: '확인'
    	 }).then(function(){
	    	 history.back();
    	 })
     </script>
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
</c:if>
<!-- <div id = "parent"> -->
<!-- 	<div id = "messageArea"> -->
<!-- 		<div id = "message"> -->
<!-- 			<span id = "statusCode">4 0 3</span><br> -->
<!-- 			<sapn id = "statusMessage"> -->
<!-- 			Forbidden<br> -->
<!-- 			링딩동 링딩동~♬ -->
<!-- 			</sapn> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
</body>
</html>