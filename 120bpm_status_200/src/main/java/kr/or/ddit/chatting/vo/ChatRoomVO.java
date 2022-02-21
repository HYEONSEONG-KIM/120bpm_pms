package kr.or.ddit.chatting.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of = "chttroomCode")
@ToString
@NoArgsConstructor
public class ChatRoomVO implements Serializable{

	private String chttroomCode;
	private String chttroomSj;
	private String memId;
	private String chttroomRgsde;
	private Integer prjctNo;
	
	List<ChattingMemVO> chatMember;
	
}
