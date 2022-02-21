package kr.or.ddit.chatting.handler;

import java.util.Map;
import java.util.UUID;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.Headers;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class PushMsgHandler {

	// 채팅에 관한 @SubscribeMapping
		@SubscribeMapping("/push/{memId}")
		public String subscribeHandler(
					@DestinationVariable String memId,
					@Headers Map<String, Object> headers
				) {
			
			log.info("headers : {}", headers);
			String sub_id = memId;
			return sub_id;
		}
}
