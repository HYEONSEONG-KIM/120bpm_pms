package kr.or.ddit.accept.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="loginIdNo")
@ToString
public class LogginInfoVO {
	private String memId;
	private String ipAddr;
	private String conectDt;
	private Integer loginIdNo;
	private String sesionId;
}
