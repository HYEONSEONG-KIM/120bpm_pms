package kr.or.ddit.chatting.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.struts.chain.contexts.WebActionContext;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.chatting.vo.MessageVO;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class EditorHandler {

	@Data
	@NoArgsConstructor
	public static class CodeVO{
		
		private String code;
		private String sender;
	}
	
	@Inject
	private SimpMessagingTemplate messagingTemplate;
	
	
	// 코드 handler
	@MessageMapping("/editor/{editId}")
	public void codeHandler(
			@DestinationVariable int editId,
			@Payload CodeVO codeVO, @Header("sub_id") String id )
	throws Exception{
		messagingTemplate.convertAndSend("/topic/editor/"+editId, codeVO.getCode());
	}
	
	@SubscribeMapping("/editor/{editId}")
	public String subscribeHandler(
			@DestinationVariable int editId,
			@Headers Map<String, Object> headers
			) {
		log.info("headers : {}, editId : {}", headers,editId);
			
		String sub_id = UUID.randomUUID().toString();
		return sub_id;
	}
	
	
	// 메세지 피드백 handler
	@MessageMapping("/editorMsg/{editId}")
	public void msgHandler(
			@DestinationVariable int editId,
			@Payload MessageVO message, @Header("sub_id") String id )
	throws Exception{
		messagingTemplate.convertAndSend("/topic/editorMsg/"+editId, message);
	}
	
	
	@SubscribeMapping("/editorMsg/{editId}")
	public String subscribeEditorMsgHandler(
			@DestinationVariable int editId,
			@Headers Map<String, Object> headers
			) {
		UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) headers.get("simpUser");
		AcceptMemberVOWrapper wrapper = (AcceptMemberVOWrapper) token.getPrincipal();
		AcceptMemberVO auth = wrapper.getAdaptee();
		MessageVO msg = new MessageVO();
		msg.setMemName(auth.getMemName());
		
		
		
		messagingTemplate.convertAndSend("/topic/editorMsg/"+editId, msg);
		String sub_id = UUID.randomUUID().toString();
		return sub_id;
	}
	
}
