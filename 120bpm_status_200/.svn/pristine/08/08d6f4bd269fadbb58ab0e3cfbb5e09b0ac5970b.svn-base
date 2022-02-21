package kr.or.ddit.listener.customevent;

import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationEvent;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class PushMsgCustomEvent{
	
	private Map<String, Object> source;
	private String message;
	private Object[] args;
	
	
	public PushMsgCustomEvent(Map<String, Object> source, String message, Object[] args) {
		this.source = source;
		this.message = message;
		this.args = args;
	}



	

}
