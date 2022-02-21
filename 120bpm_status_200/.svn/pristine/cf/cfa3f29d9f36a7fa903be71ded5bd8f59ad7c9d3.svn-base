<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" 
integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style>
li{
	list-style: none;
}
#wholeArea{
	width : 80%;
	padding-bottom: 5%;
	margin: 2%;
/* 	border-radius: 10px; */
	background-color: #fcfcfc;
	margin-left: 5%;
	box-shadow: 1px 1px 1px 1px lightgray;
border-radius: 4px;
}

#chatroom{
	display: grid;
	grid-template-columns : 1fr 3fr 1fr;
	margin-top: 5%;

}
#chatUL{
	padding-left: 1%;
}

#chatArea{
	height: 580px;
	overflow: auto;
	border: 2px solid lightgray;
	background-color: #B2C7D9;
	display: flex;
	flex-direction: column;
	margin-top: 5%;
	
		
}
 #chatArea::-webkit-scrollbar {
    width: 15px;
  }
 #chatArea::-webkit-scrollbar-thumb {
    background-color: lightgray;
  }
  #chatArea::-webkit-scrollbar-track {
    background-color: #fcfcfc;
  }
.incomig-message{
	align-self: flex-start;
	display : grid;
	grid-template-columns : 1fr 8fr;
	width: 53%;
	margin-top: 30px;
	margin-bottom: 10px;
}
.profile_img{
	width: 40px;
  	border-radius: 15px;
   	margin-right: 15px;
    box-shadow: 0 30px 60px -12px rgb(50 50 93 / 25%), 
    		0 18px 36px -18px rgb(0 0 0 / 30%),
     		0 -12px 36px -8px rgb(0 0 0 / 3%);
    text-align: center;
}
.message_bubble{
    background-color: white;
    display: block;
    box-shadow: 0 30px 60px -12px rgb(50 50 93 / 25%), 
   			0 18px 36px -18px rgb(0 0 0 / 30%), 
    		0 -12px 36px -8px rgb(0 0 0 / 3%);
    padding: 10px 20px;
    border-radius: 20px;
    font-weight: 600;
    font-size: 18px;
      
}
.name{
	font-size: 14px;
	font-weight: bold;
	margin: 5%;
}
.date{
	font-weight: bold;
	color: gray;
	margin: 2%;
}
.incomig-message .message_bubble{
	color : black;
  	border-bottom-left-radius: 0;
  	border-color : white;
/*     background-image: linear-gradient(to right,#00c6ff, #0072ff); */
}
.sent-message .message_bubble{
	color : whiter;
	border-bottom-right-radius: 0;
	background-color: #FFF000;
/*    	background-image: linear-gradient(to left,#b9f1f7, #00c6ff); */
   	margin-right: 3%;
}

.sent-message{
	float : right;
	width: 53%;
	margin-top: 30px;
	margin-bottom: 10px;
}
#msgInput{
	display: flex;
	width: 100%;
	
}
#msgCn{
	width: 90%;
	height: 50px;
}
#send{
	width: 10%;
	 outline: none;
    border: 1px solid lightgray;
    background: white;
    color: #0084FF;
    font-size: 14px;
    padding : 2px;
	
}


</style>

<security:authentication property="principal.adaptee" var="authMember"/>
		<h1 style = "text-align: left;font-weight: bold;margin-left: 5%;"><i class="far fa-comments"></i>채팅</h1>
		<hr style = "width: 90%;text-align: center;">
<c:set value="${authMember.memId}" var="memId"/>
<div id = "wholeArea">
	<div id = "chatroom">
	<div class = "pad_left"></div>
	<div id = "chatting">
			<div id = "chatArea">
					<c:if test="${not empty msgList}">
						<ul id = "chatUL">
							<c:forEach items="${msgList }" var="msg">
								<c:choose>
									<c:when test="${msg.memId eq memId}">
											<li class = "sent-message">
												<div>
													<span class = "message_bubble">${msg.mssageCn}</span>
												</div>
											</li>
									</c:when>
									
									<c:otherwise>
										<li class = "incomig-message message">
											<img src="${cPath }/resources/imgs/member/${msg.proflImgNm}" class = "profile_img">
											<div>
												<span class = 'name'>${msg.memName}</span><br>
												<span class = "message_bubble">${msg.mssageCn}</span>
											</div>
											<span></span>
											<span class = 'date'>${msg.mssageWritde}</span>
										</li>	
									</c:otherwise>
								</c:choose>
								
							</c:forEach>
						</ul>
					</c:if>
				
			</div>
		
			<div id = "msgInput">
				<input type="text" id = "msgCn" class="form-control"/>
				<input type = "button" value = "보내기" id = "send" >
			</div>
		</div>
		
		<div class = "pad_right"></div>
	</div>
</div>
<script type="text/javascript">
	let client2 = null;
	let headers2 = {}
	let messageArea2 = document.querySelector("#messagesArea");
	let proflImgNm = '${authMember.proflImgNm}'
	let chatRoom2 = "${chatRoom}";
	let myId2 = "${authMember.memId}";
	let prtId2 = "${pCode}";
	
	let SUB_ID2= "${authMember.memId},${authMember.memLnm}${authMember.memFnm}"
	
	function init(){
	<!-- // stomp-endpoint로 양방향 통신 연결 수립  -->
		var sockJS=new SockJS("${cPath}/stomp/chatting");
			client2=Stomp.over(sockJS); 
			client2.connect(headers2, function(connectFrame){
				state(); 

				//잡지사
				client2.subscribe("/app/handled/" + chatRoom2, function(messageFrame){
					headers2.sub_id=SUB_ID2; 
				
					//잡지를 구독하기위한 부분
				client2.subscribe("/topic/chat/"+ chatRoom2, function(messageFrame){
					let body=JSON.parse(messageFrame.body); 
					console.log(body);
					if(body == "FAIL"){
						alert("메세지 전송 실패");
					}else{
						let message = body.mssageCn;
						let name = body.memName;
						let id = body.memId;
						
						let newMsg = $('#chatUL');
						let msgPtag;
						if(id == myId2){
							msgPtag = "<li class = 'sent-message'>"
							msgPtag += "<div>"
							msgPtag += "<span class = 'message_bubble'>" + message + "</span>"
							msgPtag += "</div> </li>";
						}else{
							msgPtag =  "<li class = 'incomig-message message'>";
							msgPtag += "<img src='${cPath }/resources/imgs/member/" + body.proflImgNm + "' class = 'profile_img'>"
							msgPtag += "<div>"
							msgPtag += "<span class = 'name'>" + name + "</span><br>"
							msgPtag += "<span class = 'message_bubble'> " + message+ "</span> </div>"
							msgPtag += "<span></span> <span class = 'date'>" + body.mssageWritde + "</span></li>"
						}
						newMsg.append(msgPtag);
						autoScroll();
						
					}
					
					

					}, {id:SUB_ID2});
				});
				
				
			}, function(error){
				console.log(error);
				alert(error.headers2.message);
			});
		}
	
 	init();
	
	let msgCnInput = $('#msgCn');
	
	function messageSend(msgCn){
		if(! client2 || ! client2.connected) throw "stomp연결 수립 전";
		msgCn = msgCn.replaceAll("<","&lt;");
		let body={sender : SUB_ID2, mssageCn : msgCn, prjctNo : prtId2, proflImgNm : proflImgNm}
		client2.send("/app/handled/"+ chatRoom2, headers2, JSON.stringify(body));
		msgCnInput.val("");
		$('#newChatState').text("");
	}
	

	

	function disconnect(event){
		if(! client2 || ! client2.connected) throw "stomp 연결 수립 전";
			client2.disconnect();
			let msgTag=document.createElement("p");
			msgTag.innerHTML="연결종료";
			messageArea2.appendChild(msgTag);
		}
	
	
	$('.chatRoomBtn').on('click',function(){
		chatRoom2 = $(this).data('room');
		let roomBtn = $('.chatRoomBtn');
		$(roomBtn).each(function(){
			$(this).attr("disabled", "false");
		})
		
		init(chatRoom2);
	})
	
	$('#send').on('click',function(){
		let msgCn = msgCnInput.val().replace('\n', '<br>');
		if(msgCn == null || msgCn.length == 0){
			return false;
		}
		messageSend(msgCn);
	})
	
	$('#msgCn').on('keyup',function(key){
		
		if(key.keyCode == 13){
				let msgCn = $(this).val().replace('\n', '<br>');
				if(msgCn == null || msgCn.length == 0){
					return false;
				}
			messageSend(msgCn);
			}
			
	})
	
	
	function autoScroll(){
		$('#chatArea').scrollTop($('#chatArea')[0].scrollHeight);
	}
	autoScroll();
	
	function state(){
 		let memPrtStateStorageKey = '${authMember.memId}:state';
 		localStorage.setItem(memPrtStateStorageKey, 1);
	}
		
	

</script>