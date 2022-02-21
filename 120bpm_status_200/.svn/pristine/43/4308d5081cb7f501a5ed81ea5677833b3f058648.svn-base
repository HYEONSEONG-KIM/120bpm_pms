<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title> ${S0010110}</title>

<tiles:insertAttribute name="preScript" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');  
body{
		 font-family:'Noto Sans KR', sans-serif !important;
		 height : auto;
		 overflow: scroll;  
		 min-width: 1000px;
} 
.swal2-styled.swal2-confirm {
	border: 0;
	border-radius: .25em; 
	background: initial;
	background-color: #42b4e6;
	color: #fff;
	font-size: 1em;
}

.swal2-styled.swal2-confirm:focus {
	box-shadow: 0 0 0 3px rgb(115 200 240/ 50%);
}

.swal2-icon.swal2-error [class^=swal2-x-mark-line] {
	display: block;
	position: absolute;
	top: 2.3125em;
	width: 2.9375em;
	height: .3125em;
	border-radius: .125em;
	background-color: #F5DA81;
}

.swal2-icon.swal2-error {
	border-color: #F5DA81;
	color: #F5DA81;
}
.toggle a{
	padding: 0;
}
.col-md-1 {
	flex: 0 0 5%; 
}
</style>
	<security:authentication property="principal.adaptee" var="authMember"/>
<c:if test="${not empty setupmessage}">
	<script type="text/javascript">
		$(function() {
			if ("${setupmessage}" == "OK") {
				Swal.fire({
					title : "SUCCESS",
					text : "설정이 저장되었습니다.",
					icon : 'success',
					confirmButtonText : '확인'
				})
			} else {
				Swal.fire({
					title : "SERVER ERROR",
					text : "다시 시도해주세요.",
					icon : 'error',
					confirmButtonText : '확인'
				})
			}
		});
	</script>
</c:if>
</head>  
<body class="nav-md" >  
	<div class="container body">
		<div class="main_container">
			<tiles:insertAttribute name="PrjctLeftMenu" />
			
			<div class="right_col" role="main" style="min-height: 4546px;">
				<div class="">  
					<div class="row"> 
						<div class="nav col-md-1"> 
<!-- 							<a id="menu_toggle"><i class="fa fa-bars" style="color: #42B4E6;"></i></a> -->
						</div>          
						<div class="col-md-11 col-sm-6  mt-3">
							<!-- 센터내용 -->
							<tiles:insertAttribute name="content" />
						</div>
					</div> 
				</div>
			</div>
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

</body>

<script type="text/javascript">

	let client = null;
	let headers = {}
	let prtId = "${pCode}";
	let myId = "${authMember.memId}";
	let chatRoom = '${chatRoom}';
	let memPrtStateStorageKey = '${authMember.memId}:state';
	
	let SUB_ID= "${authMember.memId},${authMember.memLnm}${authMember.memFnm}"
	
	function init(){
	<!-- // stomp-endpoint로 양방향 통신 연결 수립  -->
		var sockJS=new SockJS("${cPath}/stomp/chatPush");
			client=Stomp.over(sockJS); 
			client.connect(headers, function(connectFrame){
			
				//잡지사
				client.subscribe("/app/handled/" + chatRoom, function(messageFrame){
					headers.sub_id=SUB_ID; 
				
					//잡지를 구독하기위한 부분
				client.subscribe("/topic/chat/"+ chatRoom, function(messageFrame){
					let state = localStorage.getItem(memPrtStateStorageKey);
					if(state != 1){
						let cnt = $('#newChatState').text();
						console.log("cnt : " + cnt)
						if(cnt.length == 0){
							cnt = '0';
						}
						cnt = parseInt(cnt) + 1;
						
						$('#newChatState').text(cnt).css('padding', '5px');
						
					}

					}, {id:SUB_ID});
				});
				
				
			}, function(error){
				console.log(error);
				alert(error.headers.message);
			});
		}
	

	function disconnect(event){
		if(! client || ! client.connected) throw "stomp 연결 수립 전";
			client.disconnect();
			console.log("연결종료");
		}

	// 소켓 연결 실행
	 	init();
	
	

	
	

</script>
</html>


