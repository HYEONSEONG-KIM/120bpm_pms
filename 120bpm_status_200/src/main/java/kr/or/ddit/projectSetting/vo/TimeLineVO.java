package kr.or.ddit.projectSetting.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@EqualsAndHashCode(of="tlineCode")
@NoArgsConstructor
public class TimeLineVO implements Serializable{

	private String tlineCode;
	private Integer prjctNo;
	private String memId;
	private String tlineRgsde;
	private String menuClCode;
	private String cmdClCode;
}
