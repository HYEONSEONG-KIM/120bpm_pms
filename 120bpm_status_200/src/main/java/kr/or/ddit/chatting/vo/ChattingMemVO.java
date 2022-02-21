package kr.or.ddit.chatting.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of="prjctNo")
@NoArgsConstructor
public class ChattingMemVO implements Serializable{

	private Integer prjctNo;
	private String chttroomCode;
	private String memId;
	private String memName;
	
	List<MessageVO> message;
}
