package kr.or.ddit.pushMsg.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="memId")
@ToString
@NoArgsConstructor
public class PushMsgVO implements Serializable {
	
	private Integer pushCode;
	private String pushMessage;
	private String memId;
	private String createde;
	
	public PushMsgVO(String pushMessage,String memId) {
		this.pushMessage = pushMessage;
		this.memId = memId;
	}
}
