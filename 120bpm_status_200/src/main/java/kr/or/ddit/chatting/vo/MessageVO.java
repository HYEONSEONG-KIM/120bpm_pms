package kr.or.ddit.chatting.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="mssageNo")
@ToString
@NoArgsConstructor
public class MessageVO implements Serializable {
	private String mssageCn;
	private String mssageWritde;
	private Integer mssageNo;
	private String memId;
	private Integer prjctNo;
	private String chttroomCode;
	private String memName;
	private String sender;
	private String proflImgNm;
	
	public void setSender(String sender) {
		this.sender = sender;
		this.memId = sender.substring(0,sender.indexOf(","));
		this.memName = sender.substring(sender.indexOf(",")+1);
	}
	
}
