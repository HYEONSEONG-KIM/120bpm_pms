<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-language_tools.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-emmet.min.js" type="text/javascript" charset="utf-8"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ext-modelist.min.js" type="text/javascript" charset="utf-8"></script> -->
<style type="text/css" media="screen">
    #editor { 
        position: absolute;
     	width: 80%;
    	height: 400px;
    	margin-left: 10%;
    }
</style>

<select id = "selectLanguage">
	<option value = "javascript" selected>JavaScript</option>
	<option value = "java">JAVA</option>
	<option value = "html">HTML</option>
	<option value = "css">CSS</option>
	<option value = "sql">SQL</option>
</select>
<div id="editor">
</div>

<div id = "javaCN" style="display: none">
	public class codeEditor {
		public static void main(String[] args) {
		
	}
}
</div>


<script>
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/twilight");
    
    
    
    let selectLanguage = $('#selectLanguage').val();
	editor.session.setMode("ace/mode/"+selectLanguage);
    
    $('#selectLanguage').on('change',function(){
    	selectLanguage = $(this).val();
	    editor.setValue('');
    	if(selectLanguage == 'java'){
    	    editor.setValue($('#javaCN').text());
    	}
	    editor.session.setMode("ace/mode/"+selectLanguage);
	    codeSend($('#javaCN').text());
	    console.log(selectLanguage);
    })
    
    editor.setOptions({
    	enableBasicAutocompletion: true,
    	enableLiveAutocompletion:true,
    	enableSnippets: true,
    	enableEmmet: true,
    })




	let EditorClient = null;
	let EditorHeaders = {}
	let myId = "${authMember.memId}";
	let chatRoom = '${chatRoom}';
	
	let ED_SUB_ID= "test"
	
	function init(){
	<!-- // stomp-endpoint로 양방향 통신 연결 수립  -->
		var sockJS=new SockJS("${cPath}/stomp/editor");
			EditorClient=Stomp.over(sockJS); 
			EditorClient.connect(EditorHeaders, function(connectFrame){
			
				//잡지사
				EditorClient.subscribe("/app/editor", function(messageFrame){
					EditorHeaders.sub_id=ED_SUB_ID; 
				
					//잡지를 구독하기위한 부분
				EditorClient.subscribe("/topic/editor", function(messageFrame){
					
					let body = messageFrame.body;
					console.log(body);
					
					var pos = editor.session.selection.toJSON()
					editor.session.setValue(body)
				    editor.session.selection.fromJSON(pos)
					

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
		EditorClient.send("/app/editor", EditorHeaders, JSON.stringify(codeBody));
	}

	// 소켓 연결 실행
	 	init();
	
	 $('#editor').on('keyup',function(){
	    	let codeCN = editor.getValue();
	    	console.log(codeCN)
	    	codeSend(codeCN);
	  })
    
    
 
</script>
