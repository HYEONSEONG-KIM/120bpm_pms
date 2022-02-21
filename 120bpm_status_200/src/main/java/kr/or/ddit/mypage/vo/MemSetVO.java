package kr.or.ddit.mypage.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of= {"setupCode","setupCnNo","memId"})
@ToString
@NoArgsConstructor
public class MemSetVO implements Serializable {

	private String setupCode;
	private Integer setupCnNo;
	private Integer setupDetailNo;
	private String memId;
	private String setupValue;
}
