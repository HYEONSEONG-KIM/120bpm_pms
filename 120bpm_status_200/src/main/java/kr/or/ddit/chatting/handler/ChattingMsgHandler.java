package kr.or.ddit.chatting.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.WebSocketSession;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.chatting.service.ChattingService;
import kr.or.ddit.chatting.vo.MessageVO;
import kr.or.ddit.enumtype.ServiceResult;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ChattingMsgHandler {

	
	@Inject
	private SimpMessagingTemplate messagingTemplate;
	
	@Inject
	private ChattingService service;
	
	// 채팅메세지가 전달
	@MessageMapping("/handled/{roomNo}")
	public void handler(@DestinationVariable String roomNo, 
			@Payload MessageVO messageVO, @Header("sub_id") String id )
	throws Exception{
		log.info("messageVO : {}", messageVO);
		
		messageVO.setChttroomCode(roomNo);
		
		ServiceResult result = service.messageInsert(messageVO);
		
		if(result.equals(ServiceResult.OK)) {
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateStr = format.format(now);
			messageVO.setMssageWritde(dateStr);
			messagingTemplate.convertAndSend("/topic/chat/" + roomNo, messageVO);
		}else {
			messagingTemplate.convertAndSend("/topic/chat/" + roomNo, result);
		}
		
	}
	
	// 채팅에 관한 @SubscribeMapping
	@SubscribeMapping("/handled/{roomNo}")
	public String subscribeHandler(
				@DestinationVariable String roomNo,
				@Headers Map<String, Object> headers
			) {
		
		log.info("roomNo : {}", roomNo);
		String sub_id = roomNo;
		return sub_id;
	}
	

	
}



