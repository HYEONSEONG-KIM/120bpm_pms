<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<security:authorize access="isFullyAuthenticated()">
  			<security:authentication property="principal.adaptee" var="authMember"/>
			<security:authentication property="authorities" var="authMemRoles"/>

<input type = "hidden" id = "pushTotalCnt" value = "${pushCnt}"/>
<c:remove var="pushCnt" scope="session"/>
<div class="top_nav">
	<div class="nav_menu">
		<div class="nav toggle">
			<a id="menu_toggle"><i class="fa fa-bars"></i></a>
		</div>
		<nav class="nav navbar-nav">
			<ul class=" navbar-right">
				<li class="nav-item dropdown open" style="padding-left: 15px;">
					<a href="javascript:;" class="user-profile dropdown-toggle"
					aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
					aria-expanded="false"> <img src="${cPath }/resources/imgs/member/${authMember.proflImgNm}" alt="프로필">
					${authMember.memName}
				</a>
					<div class="dropdown-menu dropdown-usermenu pull-right"
						aria-labelledby="navbarDropdown">
						<c:if test="${authMember.mngrAt eq '0'}">
						<a class="dropdown-item" href="${cPath }/mypage"> 마이페이지</a>
						</c:if>
						<form action="${cPath}/logout" method = "post">
							<a class="dropdown-item" id = "logout">
							<i class="fa fa-sign-out pull-right"></i> 로그아웃</a>
						</form>

					</div>
				</li>
				<c:if test="${authMember.mngrAt eq '0'}">
				<li role="presentation" class="nav-item dropdown open">
					<a
						href="javascript:;" class="dropdown-toggle info-number pushMsgIcon"
						id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
							<i class="fa fa-envelope-o" ></i>
							<span class="badge bg-green" id = "pushMsg"></span>
					</a>
						<ul class="dropdown-menu list-unstyled msg_list" role="menu"
							aria-labelledby="navbarDropdown1" >
							<div id = "pusMsgArea">

							</div>

							<li class="nav-item">
								<div class="text-center">
									<a class="dropdown-item" href="${cPath }/mypage/notification"> <strong>모든 푸시알림 보기</strong> <i
										class="fa fa-angle-right"></i>
									</a>
								</div>
							</li>

						</ul>
					</li>
					</c:if>
			</ul>
		</nav>
	</div>
</div>
<script>
$(function(){
	$('#logout').on('click',function(){
 		$(this).parent().submit();
	})
})

	let client = null;
	let headers = {}
	let SUB_ID= "${authMember.memId}";
	let pushMsgCnt = $('#pushMsg');
	let pushMsgIcon = $('.pushMsgIcon');


	// 푸쉬알림 메세지 읽지 않았을때 처리를 위한 로컬스토리지 key
	let storageKey = "${authMember.memId}:pushCnt";

	let pushCnt = $('#pushTotalCnt').val();
	// 로그인시 비접속시에 온 메세지 갯수 표시하기 위한 스토리지 키
	let pushTotalStorageKey = "${authMember.memId}:pushTotalCnt";

	if(pushCnt != null && pushCnt.length != 0){
		let beforeCnt = localStorage.getItem(pushTotalStorageKey) != null ?localStorage.getItem(pushTotalStorageKey): 0;
		localStorage.setItem(pushTotalStorageKey, pushCnt);
		let unRead = pushCnt - beforeCnt;
		if(unRead > 0){
			localStorage.setItem(storageKey, unRead);
		}
	}

	function init(){
	<!-- // stomp-endpoint로 양방향 통신 연결 수립  -->
		var sockJS=new SockJS("${cPath}/stomp/mainPush");
			client=Stomp.over(sockJS);
			client.debug = null
			client.connect(headers, function(connectFrame){

				//잡지사
				client.subscribe("/app/push/" + SUB_ID, function(messageFrame){
					headers.sub_id=SUB_ID;
					console.log("SUB_ID : " + SUB_ID)
					console.log("body : " + messageFrame.body)


					//잡지를 구독하기위한 부분
				client.subscribe("/topic/push/"+ SUB_ID, function(messageFrame){
					let cnt = pushMsgCnt.text();
					if(cnt.length == 0){
						cnt = '0';
					}
					cnt = parseInt(cnt) + 1;
					localStorage.setItem(storageKey, cnt);

					pushMsgCnt.text(cnt);

					}, {id:SUB_ID});
				});


			}, function(error){
				console.log(error);
				alert(error.headers.message);
			});
		}

 	init();



	function disconnect(event){
		if(! client || ! client.connected) throw "stomp 연결 수립 전";
			client.disconnect();
			console.log("연결종료");
	}

	function setPushCnt(){
		let localPushCnt = localStorage.getItem(storageKey);
		if(localPushCnt == null){
			return false;
		}
		pushMsgCnt.text(localPushCnt);
	}

	setPushCnt();

	pushMsgIcon.on('click',function(){
		localStorage.removeItem(storageKey);
		pushMsgCnt.text('');

		$.ajax({
			url : "${cPath}/push",
			dataType : "json",
			success : function(resp) {

				let pusMsgArea = $('#pusMsgArea');
				pusMsgArea.empty('.msgCn');
				let msg = "<h5 style = 'text-align:center;margin : 5px;'>알림</h5>";
				$(resp).each(function(idx,value){
					let msgDateStr = value.createde;
					let now = new Date();
					let msgDate = new Date(msgDateStr);

					let timeCompar = (now.getTime() - msgDate.getTime())/ (1000*60*60*24);
					let timeAgo;

					console.log(msgDate);

					if(timeCompar >= 1){
						timeAgo = parseInt(timeCompar) + '일 전';
					}else{
						if(timeCompar * (60*60*24) < 600){
							timeAgo = '방금'
						}else if(timeCompar * (60*60*24) < 3600){
							timeAgo = parseInt((timeCompar * (60*24)) % 60) + '분 전'
						}else{
							timeAgo = parseInt((timeCompar * 24) % 24) + '시간 전'
						}
					}

					msg +=  "<li class='nav-item msgCn'><a class='dropdown-item'>"
					msg += "<span> <span>알림</span> <span class='time'>" + timeAgo + "</span></span>"
					msg += "<span class='message'>" + value.pushMessage +"</span></a></li>"
				})
				pusMsgArea.append(msg);
			}

		});
	})



</script>
</security:authorize>

















