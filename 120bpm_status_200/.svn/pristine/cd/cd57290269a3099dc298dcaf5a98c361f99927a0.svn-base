<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-language_tools.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-emmet.min.js" type="text/javascript" charset="utf-8"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-modelist.min.js" type="text/javascript" charset="utf-8"></script> -->
<style type="text/css" media="screen">
li {
	list-style: none;
}

#par {
	width: 100%;
	background: #fcfcfc;
	display: grid;
	grid-template-columns: 5fr 0.1fr 3fr;
	margin: 3%;
}

#editor {
	width: 100%;
	height: 700px;
}

#chatArea {
	border: 1px solid lightgray;
	border-radius: 5px;
	position: relative;
	height: 700px;
	overflow: auto;
}

#selectLanguage {
	margin-left: 3%;
	font-size: 20px;
	width: 200px;
	border: 1px solid gray;
	font-family: inherit;
	border-radius: 5px;
}

#title {
	display: block;
	text-align: center;
	font-size: 40px;
	font-family: inherit;
	margin-top: 1%;
	font-weight: bold;
}

#msgInput {
	display: flex;
	width: 100%;

}

#msgCn {
	width: 90%;
	height: 50px;
}

#send {
	width: 10%;
	outline: none;
	border: 1px solid lightgray;
	background: white;
	color: #0084FF;
	font-size: 14px;
	padding: 2px;
}

.incomig-message {
	align-self: flex-start;
	display: grid;
	grid-template-columns: 1fr 8fr;
	width: 53%;
	margin-top: 30px;
	margin-bottom: 10px;
	margin-left: 15px;
}

.profile_img {
	width: 40px;
	border-radius: 15px;
	margin-right: 15px;
	box-shadow: 0 30px 60px -12px rgb(50 50 93/ 25%), 0 18px 36px -18px
		rgb(0 0 0/ 30%), 0 -12px 36px -8px rgb(0 0 0/ 3%);
	text-align: center;
}

.message_bubble {
	background-color: white;
	display: block;
	box-shadow: 0 30px 60px -12px rgb(50 50 93/ 25%), 0 18px 36px -18px
		rgb(0 0 0/ 30%), 0 -12px 36px -8px rgb(0 0 0/ 3%);
	padding: 10px 20px;
	border-radius: 20px;
	color: white;
	font-weight: 600;
	font-size: 18px;
}

.name {
	font-size: 14px;
}

.incomig-message, .enterMem {
	margin-left: -8%;
}

.incomig-message .message_bubble {
	border-bottom-left-radius: 0;
	background-image: linear-gradient(to right, #00c6ff, #0072ff);
}

.sent-message .message_bubble {
	border-bottom-right-radius: 0;
	background-image: linear-gradient(to left, #b9f1f7, #00c6ff);
	margin-right: 10px;
}

.sent-message {
	margin-left: 45%;
	width: 53%;
	margin-top: 30px;
	margin-bottom: 10px;
}

.enterMem {
	display: block;
	text-align: center;
	color: gray;
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
}
.setData{
	margin-left: 10px;
	font-size: 20px;
	color: lightgray;
}
</style>

<security:authentication property="principal.adaptee" var="authMember"/>
	<span id = "title">${editVO.editorNm}</span>
	<hr>
<div id = "wholeArea">
		<select id = "selectLanguage">
			<option>언어를 선택하세요</option>
			<option value = "java" >JAVA</option>
			<option value = "javascript">JavaScript</option>
			<option value = "jsp">JSP</option>
			<option value = "html">HTML</option>
			<option value = "css">CSS</option>
			<option value = "sql">SQL</option>
		</select>
		
	<div id = "par">
		<div id="editor">
		</div>
		
		<div></div>
		
		<div id = "chatArea">
			<div >
				<ul id = "chatting"></ul>
			</div>
		</div>
		<div>
			
			<span id = "1" class = "setData">1</span>
			<span id = "2" class = "setData">2</span>
			<span id = "3" class = "setData">3</span>
			<span id = "4" class = "setData">4</span>
			<span id = "5" class = "setData">5</span>
			<span id = "6" class = "setData">6</span>
		</div>
		<div>
		</div>
			<div id = "msgInput">
				<input type="text" id = "msgCn" class="form-control"/>
				<input type = "button" value = "전송" id = "send" >
			</div>
	</div>
</div>
<div id = "java" style="display: none">
@Controller
@RequestMappin("project/{id}/free/")
public class FreeBoardController {
	
	private FreeBoardService service;
	
	@RequestMapping("create")
	public String createBoard(
		@PathValiable int id,
		FreeBoardVO boardVO,
		Eerrors errors
	){
		
		String goTo = null;
	
		ResultService result = 
			service.createBoard(boardVO);
		
		if(result == 'OK'){
			goTO = "board/boardList";
		}else{
			goTO = "redirect:board/boardForm";
		}
		
	
		return goTo;
	}
	
	public static boardVO(){
		
		String id;
		
		public setId(String id){
			this.id = id;
		}	
	}
}
</div>

<div id = "javascript" style="display: none">
function codeEditor(items){
	//TestCode...
}
</div>

<div id = "html" style="display: none">

&lt;!DOCTYPE html>
&lt;html>
&lt;head>
&lt;meta charset="${encoding}">
&lt;title>Insert title here&lt;/title>
&lt;/head>
&lt;body>
&lt;!-- TestCode... -->
&lt;/body>
&lt;/html>

</div>

<div id = "jsp" style="display: none">
&lt;%@ page language="java" contentType="text/html; charset=${encoding}"
    pageEncoding="${encoding}"%>
&lt;!DOCTYPE html>
&lt;html>
&lt;head>
&lt;meta charset="${encoding}">
&lt;title>Insert title here&lt;/title>
&lt;/head>
&lt;body>
&lt;!-- TestCode... -->
&lt;/body>
&lt;/html>
</div>

<script>
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/twilight");
    
    
    
    let selectLanguage = $('#selectLanguage').val();
	editor.session.setMode("ace/mode/"+selectLanguage);
    
    $('#selectLanguage').on('change',function(){
    	selectLanguage = $(this).val();
	    let langCN = '';
    	if(selectLanguage == 'java'){
    		langCN = $('#java').text()
    	}else if(selectLanguage == 'javascript'){
    		langCN = $('#javascript').text()
    	}else if(selectLanguage == 'html'){
    		langCN = $('#html').text()
    	}else if(selectLanguage == 'jsp'){
    		langCN = $('#jsp').text()
    	}
    	
	    editor.session.setMode("ace/mode/"+selectLanguage);
	    codeSend(langCN);
    })
    
    editor.setOptions({
    	enableBasicAutocompletion: true,
    	enableSnippets: true,
    	enableEmmet: true,
    	fontSize: "16pt"
    })




	let EditorClient = null;
	let EditorMsgClient = null;
	let EditorHeaders = {}
	let EditorMsgHeaders = {}
	let editId = '${editId}';
	let ED_SUB_ID= "${authMember.memId},${authMember.memLnm}${authMember.memFnm}";
	let proflImgNm = '${authMember.proflImgNm}';
	let editMemId = '${authMember.memId}'
	
	function initEditor(){
	<!-- // stomp-endpoint로 양방향 통신 연결 수립  -->
		var sockJS=new SockJS("${cPath}/stomp/editor");
			EditorClient=Stomp.over(sockJS); 
			EditorClient.connect(EditorHeaders, function(connectFrame){
			
				//잡지사
				EditorClient.subscribe("/app/editor/"+editId, function(messageFrame){
					EditorHeaders.sub_id=ED_SUB_ID; 
					
					EditorClient.subscribe("/topic/editor/"+editId, function(messageFrame){
						
						let body=messageFrame.body; 
						
						var pos = editor.session.selection.toJSON();
 						editor.session.setValue(body)
					    editor.session.selection.fromJSON(pos)
						
	
						}, {id:ED_SUB_ID});
				
					
					
				});
				
				
			}, function(error){
				console.log(error);
				alert(error.EditorHeaders.message);
			});
		}
	
	function initEditMsg(){
		var MsgSockJS=new SockJS("${cPath}/stomp/editorMsg");
		EditorMsgClient=Stomp.over(MsgSockJS); 
		EditorMsgClient.connect(EditorHeaders, function(connectFrame){
		
			//잡지사
			EditorMsgClient.subscribe("/app/editorMsg/"+editId, function(messageFrame){
				EditorMsgHeaders.sub_id=ED_SUB_ID; 
				
				
				EditorMsgClient.subscribe("/topic/editorMsg/"+editId, function(messageFrame){
					
						let body=JSON.parse(messageFrame.body); 
						
						let message = body.mssageCn;
						let name = body.memName;
						let id = body.memId;
					
						let newMsg = $('#chatting');
						let msgPtag;
						if(message != null){
							if(id == editMemId){
								msgPtag = "<li class = 'sent-message message'>"
								msgPtag += "<div>"
								msgPtag += "<span class = 'message_bubble'>" + message + "</span>"
								msgPtag += "</div> </li>";
							}else{
								msgPtag =  "<li class = 'incomig-message message'>";
								msgPtag += "<img src='${cPath }/resources/imgs/member/" + body.proflImgNm + "' class = 'profile_img'>"
								msgPtag += "<div>"
								msgPtag += "<span class = 'name'>" + name + "</span><br>"
								msgPtag += "<span class = 'message_bubble'> " + message+ "</span> </div></li>"
							}
						}else{
							msgPtag = "<li class = 'enterMem'>***" + name +"님이 입장하셨습니다***</li>"
						}
						newMsg.append(msgPtag);
						autoScroll();
					
					
					}, {id:ED_SUB_ID}); 
				
				
			});
			
			
		}, function(error){
			console.log(error);
			alert(error.EditorHeaders.message);
		});
	}
	

	function disconnect(event){
		if(! EditorClient || ! EditorClient.connected) throw "stomp 연결 수립 전";
			EditorClient.disconnect();
			console.log("연결종료");
		}
	

	function codeSend(code){
		if(! EditorClient || ! EditorClient.connected) throw "stomp연결 수립 전";
		let codeBody={sender : ED_SUB_ID ,code : code}
		EditorClient.send("/app/editor/" +editId, EditorHeaders, JSON.stringify(codeBody));
	}
	
	let msgCnInput = $('#msgCn');
	
	function msgSend(msg){
		if(! EditorMsgClient || ! EditorMsgClient.connected) throw "stomp연결 수립 전";
		msg = msg.replaceAll("<","&lt;");
		let msgBody = {sender : ED_SUB_ID, mssageCn : msg,
				proflImgNm : proflImgNm};
		EditorMsgClient.send("/app/editorMsg/" +editId, EditorHeaders, JSON.stringify(msgBody));
		msgCnInput.val('');
	}

	// 소켓 연결 실행
	 initEditor();
	 initEditMsg();
	
	 $('#editor').on('keyup',function(e){
		 if(e.keyCode == 17 || e.keyCode == 32 || (e.keyCode == 17 && e.keyCode == 32)){
				return false;
		}else if(e.keyCode == 37 || e.keyCode == 38 || e.keyCode == 39 || e.keyCode == 40){
				return false;
			
		}
	    	let codeCN = editor.getValue();
	    	codeSend(codeCN);
	    	
	  })
	  
	$('#send').on('click',function(key){
		
		let msgCn = msgCnInput.val().replace('\n', '<br>');
		if(msgCn == null || msgCn.length == 0){
			return false;
		}
		msgSend(msgCn);
	})
	
	$('#msgCn').on('keyup',function(key){
		 if(key.keyCode == 13){
			let msgCn = $(this).val().replace('\n', '<br>');
			if(msgCn == null || msgCn.length == 0){
				return false;
			}
			
			msgSend(msgCn);
		}
	})
	
	function autoScroll(){
		$('#chatArea').scrollTop($('#chatArea')[0].scrollHeight);
	}
	autoScroll();
	
	
	$('#1').on('click',function(){
		msgCnInput.val('안녕하세요!!코드 올릴테니 피드백 부탁 드립니다 ㅠㅠ');
	})
	$('#2').on('click',function(){
		msgCnInput.val('네!!올려 주세요!!');
	})
	$('#3').on('click',function(){
		msgCnInput.val('확인해보니 service 객체를 주입 받기 않았네요!!');
	})
	$('#4').on('click',function(){
		msgCnInput.val('아하!!!!');
	})
	$('#5').on('click',function(){
		msgCnInput.val('그리고 id도 VO에 담아주지 않았네요 수정해주세요');
	})
	$('#6').on('click',function(){
		msgCnInput.val('감사합니다!!!');
	})
    
 
</script>
